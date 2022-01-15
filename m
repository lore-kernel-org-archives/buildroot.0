Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FBD3C433EF
	for <buildroot@archiver.kernel.org>; Sat, 15 Jan 2022 19:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1DCB540519;
	Sat, 15 Jan 2022 19:45:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MsEdpDckIeIG; Sat, 15 Jan 2022 19:45:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2859F40502;
	Sat, 15 Jan 2022 19:45:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 00DC21BF3E9
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E0F6640502
 for <buildroot@lists.busybox.net>; Sat, 15 Jan 2022 19:45:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GrCAyeqmBclc for <buildroot@lists.busybox.net>;
 Sat, 15 Jan 2022 19:45:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DE9FF400A6
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 19:45:34 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id s11so8454321ioe.12
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 11:45:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=/un8ejhtlw2n6+tyuYXBFnDgYcMyqYzV4xg7pG8xC+4=;
 b=Gv0+XXuLXENmk4IuMU+cnaIoF6ugc35inD74jGMHZCeWAyOKD9Yjz4E17KnPs7QbFK
 xYBfVSi3iuUa+J7tviQlbjrJruex6MsMN7AfqLg9ZYbArKvcezssaoAUUe5/m22eoSJG
 H5wZtHTHXGmAnT7IDnf0LHyQadweWwv68Bp8osDJWpKVcpWndWFOLP/3Dx/Tf5wJ4UQt
 HJaHKkbQlpJKPoc1BR7fE0wZkDhR0dR8IkDLl639lfxzSrGrRjLEkzS/wRKQe48faBkE
 pYXjQ28P+Clt6ZD3kOg/q1NnShIle/ozc01Q/DwDajJT8YDeooegcA1PPhyE+dkvUTpf
 obYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=/un8ejhtlw2n6+tyuYXBFnDgYcMyqYzV4xg7pG8xC+4=;
 b=OYhpcSFfOkk4PZ5snNLc1oLFKY+1RMKUnQrKP61FgubYXQSwoyOgxLxr0m4Saxy1bC
 bn1Vh8jGjI/dQ3vpotC7h/d/eH/jBh9F7g0DMpYpXHp7bi35PsSjFwCDVB+G8kERKj+i
 jXqd2ggOMvf68PF5pOrXKFmm09PFGoMjtFeKXMWGeI4KklIIfAC79TRhaegDlSZ1c8CL
 rlPYGbMBeF2XTUMtW7DChev9b4uzndb/R7z3hdtrqpumG//mXvQMx/MRUpwCujYIF3X1
 32+TtK+EHqsaXKXI5QL9Xll2L4hsOGf0SX3kpDV4VqMUSuVtfqvJTT/OPk4nRx/QnyB6
 AJyw==
X-Gm-Message-State: AOAM533UgFk0mc7YEv8NoTTTVUqYbVPsxq3vfKbmlGK+6rxvu8J+Phrf
 hA1axUa3qfvPBIxLyKnR37o3GgKaKjxsDqHpXx5UELil
X-Google-Smtp-Source: ABdhPJzxuO6lrsCX/eFnTesmh0LCOHZ+PcI/R8ZugaeGzwOJMQf2nuxDXJTW/O4ybZj6N/yHkjvXgtna/wYNwJSp5CM=
X-Received: by 2002:a5d:9a95:: with SMTP id c21mr6772719iom.189.1642275934014; 
 Sat, 15 Jan 2022 11:45:34 -0800 (PST)
MIME-Version: 1.0
References: <20210518113652.29609-1-patrickdepinguin@gmail.com>
 <20210518113652.29609-4-patrickdepinguin@gmail.com>
 <1a139b63-48ff-fe9e-2041-cc1724a753b2@gmail.com>
In-Reply-To: <1a139b63-48ff-fe9e-2041-cc1724a753b2@gmail.com>
From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Sat, 15 Jan 2022 20:45:22 +0100
Message-ID: <CAAXf6LVbA9E4TquNzY2+ov80XTZV_rMaoeN+UKNqg69-1EvYCQ@mail.gmail.com>
To: Romain Naour <romain.naour@gmail.com>
Subject: Re: [Buildroot] [PATCH 3/4] core: introduce BR2_KERNEL_ARCH_OVERRIDE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

RWwganVlLCAxMyBlbmUgMjAyMiBhIGxhcyAyMzowNSwgUm9tYWluIE5hb3VyCig8cm9tYWluLm5h
b3VyQGdtYWlsLmNvbT4pIGVzY3JpYmnDszoKPgo+IEhpIFRob21hcywKPgo+IExlIDE4LzA1LzIw
MjEgw6AgMTM6MzYsIFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIGEgw6ljcml0IDoKPiA+IEZyb206
IFRob21hcyBEZSBTY2hhbXBoZWxlaXJlIDx0aG9tYXMuZGVfc2NoYW1waGVsZWlyZUBub2tpYS5j
b20+Cj4gPgo+ID4gVGhlcmUgYXJlIGNhc2VzIHdoZXJlIGEgNjQtYml0IGFyY2hpdGVjdHVyZSBp
cyBydW5uaW5nIGEgNjQtYml0IGtlcm5lbCBidXQKPiA+IDMyLWJpdCB1c2Vyc3BhY2UuIEV4YW1w
bGVzIGluY2x1ZGU6Cj4gPiAgICAgKiBhYXJjaDY0IGFyY2hpdGVjdHVyZSwgd2l0aCBhYXJjaDY0
IGtlcm5lbCBhbmQgMzItYml0IChBUk0pIHVzZXJzcGFjZQo+ID4gICAgICogeDg2XzY0IGFyY2hp
dGVjdHVyZSwgd2l0aCB4ODZfNjQga2VybmVsIGFuZCAzMi1iaXQgKGkzODYpIHVzZXJzcGFjZQo+
ID4KPiA+IEluIEJ1aWxkcm9vdCwgdGhlIEFSQ0gvQlIyX0FSQ0ggYW5kIE5PUk1BTElaRURfQVJD
SCB2YXJpYWJsZXMgd2lsbCByZWZlciB0bwo+ID4gdGhlIDMyLWJpdCBhcmNoaXRlY3R1cmUsIGJ1
dCB0aGUga2VybmVsIG5lZWRzIHRvIGJlIGJ1aWx0IHdpdGggdGhlIDY0LWJpdAo+ID4gYXJjaGl0
ZWN0dXJlLgo+ID4KPiA+IE1ha2UgaXQgcG9zc2libGUgdG8gZGVmaW5lIHRoZSBjb3JyZWN0IGFy
Y2hpdGVjdHVyZSB0byBiZSB1c2VkIGZvciB0aGUKPiA+IGtlcm5lbCwgaW4gYSBuZXcgY29uZmln
IG9wdGlvbiAnQlIyX0tFUk5FTF9BUkNIX09WRVJSSURFJy4gVGhlIHVzZXIgaXMKPiA+IGV4cGVj
dGVkIHRvIGtub3cgdGhlIHZhbGlkIHZhbHVlcy4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBUaG9t
YXMgRGUgU2NoYW1waGVsZWlyZSA8dGhvbWFzLmRlX3NjaGFtcGhlbGVpcmVAbm9raWEuY29tPgo+
ID4gLS0tCj4gPiAgTWFrZWZpbGUgICAgICAgfCAgNCArKysrCj4gPiAgYXJjaC9Db25maWcuaW4g
fCAxNSArKysrKysrKysrKysrKysKPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMo
KykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvTWFrZWZpbGUgYi9NYWtlZmlsZQo+ID4gaW5kZXggYzUz
OTllOWEzNS4uZDA5Y2Y3Yzk1OCAxMDA2NDQKPiA+IC0tLSBhL01ha2VmaWxlCj4gPiArKysgYi9N
YWtlZmlsZQo+ID4gQEAgLTQzNCw3ICs0MzQsMTEgQEAgUVVJRVQgOj0gJChpZiAkKGZpbmRzdHJp
bmcgcywkKGZpbHRlci1vdXQgLS0lLCQoTUFLRUZMQUdTKSkpLC1xKQo+ID4gICMgU3RyaXAgb2Zm
IHRoZSBhbm5veWluZyBxdW90aW5nCj4gPiAgQVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0FS
Q0gpKQo+ID4gIE5PUk1BTElaRURfQVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0tFUk5FTF9B
UkNIKSkKPiA+ICtpZmVxICgkKGNhbGwgcXN0cmlwLCQoQlIyX0tFUk5FTF9BUkNIX09WRVJSSURF
KSksKQo+ID4gIEtFUk5FTF9BUkNIIDo9ICQoY2FsbCBxc3RyaXAsJChCUjJfS0VSTkVMX0FSQ0gp
KQo+ID4gK2Vsc2UKPiA+ICtLRVJORUxfQVJDSCA6PSAkKGNhbGwgcXN0cmlwLCQoQlIyX0tFUk5F
TF9BUkNIX09WRVJSSURFKSkKPiA+ICtlbmRpZgo+ID4KPiA+ICBaQ0FUIDo9ICQoY2FsbCBxc3Ry
aXAsJChCUjJfWkNBVCkpCj4gPiAgQlpDQVQgOj0gJChjYWxsIHFzdHJpcCwkKEJSMl9CWkNBVCkp
Cj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9Db25maWcuaW4gYi9hcmNoL0NvbmZpZy5pbgo+ID4gaW5k
ZXggNzU3NWFjZjQ4Yy4uYzgyMTAwZjU0MSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvQ29uZmlnLmlu
Cj4gPiArKysgYi9hcmNoL0NvbmZpZy5pbgo+ID4gQEAgLTMyOSw2ICszMjksMjEgQEAgY29uZmln
IEJSMl9BUkNICj4gPiAgY29uZmlnIEJSMl9LRVJORUxfQVJDSAo+ID4gICAgICAgc3RyaW5nCj4g
Pgo+ID4gK2NvbmZpZyBCUjJfS0VSTkVMX0FSQ0hfT1ZFUlJJREUKPiA+ICsgICAgIHN0cmluZyAi
S2VybmVsIGFyY2hpdGVjdHVyZSBvdmVycmlkZSIKPgo+IE1heWJlIGl0IHdvdWxkIGJlIGJldHRl
ciB0byBhZGQgYXJjaGl0ZWN0dXJlIGRlcGVuZGVuY2llcyBoZXJlIChCUjJfQVJDSF9JU182NCkK
PgoKTm90ZSB0aGF0IEJSMl9BUkNIIGFuZCBCUjJfQVJDSF9JU182NCByZWZlciB0byB0aGUgYXJj
aGl0ZWN0dXJlCkJ1aWxkcm9vdCByZWFsbHkgdXNlcywgd2hpY2ggaW4gdGhlc2Ugc2NlbmFyaW9z
IGlzIHRoZSAzMi1iaXQKYXJjaGl0ZWN0dXJlLiBTbyBsZXR0aW5nIEJSMl9LRVJORUxfQVJDSF9P
VkVSUklERSBkZXBlbmQgb24KQlIyX0FSQ0hfSVNfNjQgaXMgbm90IHBvc3NpYmxlLgoKSWYgd2Ug
cmVzdHJpY3QgdGhlIHdob2xlIGZlYXR1cmUgdG8gc3BlY2lmaWMgY2FzZXMgKGUuZy4gdGhlIHR3
byBvbmVzCnRoYXQgSSBjdXJyZW50bHkgbmVlZCkgYW5kIGV4dGVuZCBvbiBjYXNlLWJ5LWNhc2Ug
YmFzaXMsIHdlIGNvdWxkIGJlCm1vcmUgc3BlY2lmaWMgaGVyZS4KCkJlc3QgcmVnYXJkcywKVGhv
bWFzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmJ1aWxk
cm9vdCBtYWlsaW5nIGxpc3QKYnVpbGRyb290QGJ1aWxkcm9vdC5vcmcKaHR0cHM6Ly9saXN0cy5i
dWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290Cg==
