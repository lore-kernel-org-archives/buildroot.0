Return-Path: <SRS0=qoEm=OJ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBD7AC433EF
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 02:38:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 597C661100
	for <buildroot@archiver.kernel.org>; Sun, 19 Sep 2021 02:38:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 597C661100
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=live.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EF5E740475;
	Sun, 19 Sep 2021 02:38:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z8pjvTPgkbuD; Sun, 19 Sep 2021 02:38:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3143040678;
	Sun, 19 Sep 2021 02:38:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 69A3C1BF82B
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 02:38:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5502A8405E
 for <buildroot@lists.busybox.net>; Sun, 19 Sep 2021 02:38:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CogSxyp-6GC1 for <buildroot@lists.busybox.net>;
 Sun, 19 Sep 2021 02:38:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-f169.google.com (mail-il1-f169.google.com
 [209.85.166.169])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A728F83F94
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 02:38:02 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id w1so14706546ilv.1
 for <buildroot@buildroot.org>; Sat, 18 Sep 2021 19:38:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+LYetI7kT/N8dwRKFxTaSWhuGRY//gx/woK/Br4Ce8k=;
 b=Cd5gbzQajMKBjj2N4V/zjquE/3rRaBq6fDJfEEMtRc6+P1Yk9sDx7jenjTIg9cBpu5
 E2D+/euLcnY1AfglduRemDSsqiAmarGSdAX0oHjlkmF4dRFOd2Mb4lchxWg/1ZGpyZdj
 SwLkOHZlZhNKTTM6VyXb7Ce8LgSGme5NTFL4L2hnZPg3Y6m8ho5hBTk58tAkK9wvSwE1
 GU1Ulatr5wAzc6ydxqlsZcE8FRi16YLyTi37e90lb3zflPiGuyX99JwhISA1oSZ54biu
 KP/SEI4BxafE2HlHE6SidWBt/Uyy8WQ9fEOOlnyobDkZBdfmGpA1WdP9ODLSXaSA9fMO
 sTFA==
X-Gm-Message-State: AOAM530B+BvziqSL3Sbvw/+lj6P0rqexd4fFS6umLSURVda08ni1jKSZ
 CArAEjLefzNcvGNtmfOaJbni+Gf38EiR0Hs9XDjzUQrgT4i/1g==
X-Google-Smtp-Source: ABdhPJyuG5pqMqXnFUYxXOH7zkGeJSmr9dyhP+9UXWY13nIXTN+HzO16AZK6tRq2JLXOv00VFUH/3Y1nCawL7thSgVY=
X-Received: by 2002:a92:c24f:: with SMTP id k15mr7662096ilo.3.1632019081636;
 Sat, 18 Sep 2021 19:38:01 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR08MB39931F9CC3A0472896C5CD87A0D19@DM6PR08MB3993.namprd08.prod.outlook.com>
 <87ilyxshwe.fsf@dell.be.48ers.dk>
In-Reply-To: <87ilyxshwe.fsf@dell.be.48ers.dk>
From: James Knight <james.d.knight@live.com>
Date: Sat, 18 Sep 2021 22:37:51 -0400
Message-ID: <CALAjcgWcE9M6qT0uyUHkFwxWGnwx4=wvkPBy+kzD_eX_DTpywg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Subject: Re: [Buildroot] [PATCH v2 1/1] utils/getdeveloperlib.py: explicitly
 set devs document encoding
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: James Knight <james.d.knight@live.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

UGV0ZXIsCgpPbiBTYXQsIFNlcCAxOCwgMjAyMSBhdCA1OjE3IFBNIFBldGVyIEtvcnNnYWFyZCA8
cGV0ZXJAa29yc2dhYXJkLmNvbT4gd3JvdGU6Cj4gSG1tLCB0aGlzIGRvZXNuJ3QgcXVpdGUgc2Vl
bSB0byB3b3JrIHdoZW4gc3Rkb3V0IGlzIG5vdCBhIFVURi04IGNvbnNvbGUKPiAuLi4KPgo+IC4v
dXRpbHMvZ2V0LWRldmVsb3BlcnMgLXAgbGlieWFuZwo+IEhlaWtvIFRoaWVyeSA8aGVpa28udGhp
ZXJ5QGdtYWlsLmNvbT4KPiBKYW4gS3VuZHLDoXQgPGphbi5rdW5kcmF0QGNlc25ldC5jej4KPgo+
IExBTkc9QyAuL3V0aWxzL2dldC1kZXZlbG9wZXJzIC1wIGxpYnlhbmcKPiBIZWlrbyBUaGllcnkg
PGhlaWtvLnRoaWVyeUBnbWFpbC5jb20+Cj4gLi4uCj4gVW5pY29kZUVuY29kZUVycm9yOiAnYXNj
aWknIGNvZGVjIGNhbid0IGVuY29kZSBjaGFyYWN0ZXIgdSdceGUxJyBpbiBwb3NpdGlvbiA5OiBv
cmRpbmFsIG5vdCBpbiByYW5nZSgxMjgpCj4KPiAuL3V0aWxzL2dldC1kZXZlbG9wZXJzIC1wIGxp
YnlhbmcgfCBjYXQKPiAuLi4KPiBVbmljb2RlRW5jb2RlRXJyb3I6ICdhc2NpaScgY29kZWMgY2Fu
J3QgZW5jb2RlIGNoYXJhY3RlciB1J1x4ZTEnIGluIHBvc2l0aW9uIDk6IG9yZGluYWwgbm90IGlu
IHJhbmdlKDEyOCkKPgo+IFJldmVydGluZyA5ZjEyN2NjNDIwODg0YWQgZml4ZXMgaXQ6Cj4KPiAu
L3V0aWxzL2dldC1kZXZlbG9wZXJzIC1wIGxpYnlhbmcKPiBIZWlrbyBUaGllcnkgPGhlaWtvLnRo
aWVyeUBnbWFpbC5jb20+Cj4gSmFuIEt1bmRyw6F0IDxqYW4ua3VuZHJhdEBjZXNuZXQuY3o+Cj4K
PiBMQU5HPUMgLi91dGlscy9nZXQtZGV2ZWxvcGVycyAtcCBsaWJ5YW5nCj4gSGVpa28gVGhpZXJ5
IDxoZWlrby50aGllcnlAZ21haWwuY29tPgo+IEphbiBLdW5kcsOhdCA8amFuLmt1bmRyYXRAY2Vz
bmV0LmN6Pgo+Cj4gLi91dGlscy9nZXQtZGV2ZWxvcGVycyAtcCBsaWJ5YW5nIHwgY2F0Cj4gSGVp
a28gVGhpZXJ5IDxoZWlrby50aGllcnlAZ21haWwuY29tPgo+IEphbiBLdW5kcsOhdCA8amFuLmt1
bmRyYXRAY2VzbmV0LmN6Pgo+Cj4gQW55IGlkZWEgYWJvdXQgaG93IHRvIGZpeCB0aGlzLCBvciBz
aG91bGQgaXQganVzdCBiZSByZXZlcnRlZD8KCkkgaGF2ZSBubyBwcm9ibGVtIHdpdGggcmV2ZXJ0
aW5nIGlmIHRoaXMgaXMgY2F1c2luZyBpc3N1ZXMuCgpGcm9tIG15IChsaW1pdGVkKSB1bmRlcnN0
YW5kaW5nIG9mIGRlYWxpbmcgd2l0aCBlbmNvZGluZywgUHl0aG9uIGFuZApzaGVsbHM7IEkgbWF5
IHVuZGVyc3RhbmQgdGhlIGlzc3VlIGhlcmUgKGZlZWwgZnJlZSB0byBjb3JyZWN0IG1lIGlmIEkK
YW0gd3Jvbmcgb24gYW55IG9mIHRoaXMpLiBJIGFzc3VtZSB0aGF0IHRoZSBQeXRob24gaW50ZXJw
cmV0ZXIgYmVpbmcKdXNlZCBoZXJlIGlzIGEgUHl0aG9uIDIueCB2ZXJzaW9uLiBVc2luZyB0aGUg
ZXhhbXBsZSBwcm92aWRlZCBhYm92ZSwKdGhlIG5hbWUgdmFsdWUgIkt1bmRyw6F0IiBpbmNsdWRl
cyBhIFVuaWNvZGUgY2hhcmFjdGVyIHdoaWNoIGNhbm5vdCBiZQpyZW5kZXJlZCBvbiBhbiBBU0NJ
SS1vbmx5IHN1cHBvcnRlZCB0ZXJtaW5hbC4gRm9yIHRoZSBzZWNvbmQgY29tbWFuZAoodGhlIGV4
cGxpY2l0IGNvbmZpZ3VyYXRpb24gb2YgIkxBTkc9QyIpLCB0aGUgcnVubmluZyBQeXRob24KaW50
ZXJwcmV0ZXIgd291bGQgYXNzdW1lIGFuIEFTQ0lJIHRlcm1pbmFsLCBhdHRlbXB0IHRvIGNvbnZl
cnQgYQp1bmljb2RlIHN0cmluZyB0byBBU0NJSSBhbmQgZ2VuZXJhdGUgdGhlIG9ic2VydmVkIGV4
Y2VwdGlvbi4gV2h5IHRoaXMKZGlkIG5vdCBmYWlsIGJlZm9yZSB0aGlzIGNvbW1pdCB3YXMgdGhh
dCB0aGUgUHl0aG9uIGludGVycHJldGVyIHdvdWxkCmJlIHByb2Nlc3NpbmcgdGhlIG5hbWUgdmFs
dWUgYXMgYSBieXRlIHN0cmluZyAoaS5lLiBub3QgYSBVbmljb2RlCnN0cmluZykuIFRoZSBpbnRl
cnByZXRlciB3b3VsZCBqdXN0IHByaW50IG91dCB0aGUgcmF3IGJ5dGUgc3RyaW5nIHRvCnRoZSBv
dXRwdXQgc3RyZWFtIGFuZCB0aGUgVVRGLTggY29uc29sZSB3b3VsZCBoYW5kbGUvcmVuZGVyIGl0
IGFzCmV4cGVjdGVkLiBJbiB0aGUgZXZlbnQgdGhhdCB0aGVzZSByYXcgYnl0ZXMgYXJlIHdyaXR0
ZW4gdG8gYW4KQVNDSUktb25seSAob3IgYW5vdGhlciB0eXBlIG9mIGNoYXJhY3Rlci1vbmx5KSBz
dXBwb3J0ZWQgdGVybWluYWwsIHRoZQpyZW5kZXJlZCBvdXRwdXQgbWF5IG5vdCBiZSBhbiBleHBl
Y3RlZCBvbmUgKGUuZy4gYSB2YWx1ZSBzdWNoIGFzCiJLdW5kcuKUnMOtdCIpLgoKSSBjYW5ub3Qg
c2F5IEkgdW5kZXJzdGFuZCB0aGUgb3V0cHV0IG9mIHRoZSB0aGlyZCBjb21tYW5kIChJIGNvdWxk
IG5vdApyZXByb2R1Y2Ugd2l0aCB0aGUgZW52aXJvbm1lbnRzIEkgaGF2ZSBzZXQgdXApLiBJIGFz
c3VtZSB0aGF0IG1heWJlCndoZW4gdGhlIGNhbGwgd29ya3Mgd2l0aCB0aGUgcGlwZSBvcGVyYXRp
b24sIFB5dGhvbiBtYXkgYmUKYXV0by1kZXRlY3RpbmcgdGhlIGVudmlyb25tZW50IGFzIGFuIEFT
Q0lJIG91dHB1dCBvbmx5LgoKTXkgaW5pdGlhbCBpbXByZXNzaW9uIG9mIHRoaXMgaXNzdWUgaXMg
dGhhdCBpdCBtYXkgYmUgYmV0dGVyIHdpdGggdGhpcwpjb21taXQsIHNpbmNlIGhhdmluZyB0aGUg
ZXhjZXB0aW9uIHRocm93biB3b3VsZCBoZWxwIGd1YXJhbnRlZSB0aGF0CnRoZSBvdXRwdXQgZW50
cmllcyB3b3VsZCBiZSByZW5kZXJhYmxlIG9uIHRoZSBhY3RpdmUgdGVybWluYWwuCkhvd2V2ZXIs
IGlmIGEgdXNlciBpcyBwdXNoaW5nIHRoZSBvdXRwdXQgdG8gYW5vdGhlciBjb21tYW5kIHRoYXQK
dW5kZXJzdGFuZHMgVVRGLTgsIGl0IHdvdWxkIGJlIGJldHRlciB0aGF0IHRoZSBQeXRob24gaW50
ZXJwcmV0ZXIgbm90CnRocm93IGFuIGV4Y2VwdGlvbiBoZXJlIGFuZCBmb3J3YXJkZWQgdGhlIHJh
dyBieXRlIHN0cmluZ3MgKGFuZCBJCmltYWdpbmUgaGF2aW5nIGEgdXNlciBhdHRlbXB0aW5nIHRv
IGZvcmNlICJQWVRIT05JT0VOQ09ESU5HIiBpbiB0aGlzCmNhc2Ugd291bGQgYmUgYW5ub3lpbmcg
b3ZlciB0aW1lKSAtLSBzbyBtYXliZSByZXZlcnRpbmcgaXMgdGhlIGJlc3QKY2FzZSBoZXJlLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWlsZHJvb3Qg
bWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBsaXN0cy5idWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
