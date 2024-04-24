Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2F1FC4345F
	for <buildroot@archiver.kernel.org>; Wed, 24 Apr 2024 19:33:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5305D60D88;
	Wed, 24 Apr 2024 19:33:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gnncnfrzUtqS; Wed, 24 Apr 2024 19:33:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 599C660D8C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 599C660D8C;
	Wed, 24 Apr 2024 19:33:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5DE801BF34A
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:33:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4A2E440135
 for <buildroot@lists.busybox.net>; Wed, 24 Apr 2024 19:33:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rlGY2s71ccuZ for <buildroot@lists.busybox.net>;
 Wed, 24 Apr 2024 19:33:26 +0000 (UTC)
X-Greylist: delayed 310 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 24 Apr 2024 19:33:25 UTC
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 3FAA740065
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3FAA740065
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.22;
 helo=mout.gmx.net; envelope-from=j.neuschaefer@gmx.net; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3FAA740065
 for <buildroot@buildroot.org>; Wed, 24 Apr 2024 19:33:24 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from probook ([89.0.46.206]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MKbg4-1sG8900PG8-00KP6o; Wed, 24
 Apr 2024 21:28:02 +0200
Date: Wed, 24 Apr 2024 21:28:01 +0200
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <ZildQdJEo56gsRZr@probook>
References: <20240424175359.37025-1-thomas@devoogdt.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240424175359.37025-1-thomas@devoogdt.com>
X-Provags-ID: V03:K1:SeBu3cUWhs6IRzajquI0vEEH3U1gki4I9ukrG9zALxK8se3/CwG
 8klQ/1iQ7AWPFP3MHvoKrBWMSw/bhA4P4x4Zx8Ev4rljni/42UoZmg7csHKSPce9P+q09XW
 wq1/CkVS5KlMI8iusBr04o3kfN9t+golaRYmbnLIEwWkvh/ciRYLHB+1m3/1liCDrAhPRZA
 K257f6tYsy8iqCeh4jIzQ==
UI-OutboundReport: notjunk:1;M01:P0:5jSuxEbn1Rw=;jk9YKmvrL1T7IuuzNjtsJlJCIdS
 DaL6qqadhvZXzXWRO5rsuSQIPevT/MEw0ZpKnvILAaugr5LyHMGk36tnjJY4mSqr/342tKjJ7
 joqdJAB7/pgNe3Mr4ei0/k8n/kqCOhQJJxgKmwMTadAltiIht1tDaI4HanzZaJlWWl2gVwobr
 3AMqSMRsM0nV+4zi2XzmyP3N7a36800qJfmmdf9jjSlAhu2WVsmZetFEFc5hmc80T524d+Xse
 ueQVz5v3kIwn2iyk2WBIqHwvL9WUxteZuFDDcrUB4QfDbtmLh7lD4lv8H07l2pwWo5UA/VrAk
 mByF9egtQs/CjpU/OsA+yhj7pDItZ5HJ2plB1C6YPQhxu75DbB7FYT6YEkYmfMAWEi3SHcgIP
 zPH5Crg3dPJK5twZOYVTpcCT15M5PX6IuLB/Ecnt8veiZQXxIep8YfXb/7fZDcvZSDOgNtC19
 L7PAMipQy+9rKK5WgGYwXtPFCRUF9MVWEIw8BZlp+8neEDH6xTvNYe9qAZZgZyXrOh5j1VLju
 VsavY1bpWiCjWb4m01FBJEP/oMM4hVWw/dVV9stfMk0DePcSXZ9kK6zgQhh6iZoLCr1IQnLOZ
 C691g3aonJb0cq5r2rdPN3HD8/jdGWezoLEOTtNgnz4JuZlBR0FTZvGBYEykpiQfbnAveVxP4
 DWbLLB1/k7UJYTSCaE9UEfhyqhhSwqbBd/YD2pbCUvvwiCc/OGwZvAufJk+GDx9ZWRvaG3aF/
 ckUJHlFhj6l4nKlEMaosuO112CmEpPC8hL38j6itSganFsjFW8aPiFq/PIPsCgjn3EEyjxIDi
 QkPF/umkMbl8tN+0IPrRX2P47SqM/JGVIHj/lQjnBC6D8=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1713987203; x=1714592003; i=j.neuschaefer@gmx.net;
 bh=NLTZlsFu9HTAp/lGFhEz9K3I66ZhNw0K9dCrkExYcFo=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:Message-ID:References:
 MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:
 cc:content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=hE1sTKUGfALR1NwBUnvt8C0N2sxHA5MZtFGYQec2veiMpmeGMiOSz7XkW6sMn/Uq
 Uqi696aBxZM/Qgvns08JZrwDNkyujkGsNYI/MCILDs/443tV8HRcNUJ6SK6jw9xu4
 t11RtbhVZm8IukmKv/rBz9AGF3FL80idYpGLSFAYnN5dqWXYcsh+Pxh+V9bILIUNn
 ggJMsvIw0YCZnSIi0bxjBTOmlPmYRXorbYsLjlaEsqmt6Z+HD9EBQcSZdSe6aGROe
 cs9aV7i8mPxMeLSMvPVyZ5aZPxiQpNCwYm09uSoJt7+oLkv0LTcnFkMSQjTZbAk/j
 ZWL0ZpzJRvKhpq992w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.net header.i=j.neuschaefer@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=hE1sTKUG
Subject: Re: [Buildroot] [PATCH v1] .github: add a pull request warning that
 explains the mailing list workflow
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
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?utf-8?Q?J=2E_Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

T24gV2VkLCBBcHIgMjQsIDIwMjQgYXQgMDc6NTM6NTlQTSArMDIwMCwgVGhvbWFzIERldm9vZ2R0
IHdyb3RlOgo+IFNpZ25lZC1vZmYtYnk6IFRob21hcyBEZXZvb2dkdCA8dGhvbWFzQGRldm9vZ2R0
LmNvbT4KPiAtLS0KPiAgLmdpdGh1Yi9wdWxsX3JlcXVlc3RfdGVtcGxhdGUubWQgfCA2ICsrKysr
Kwo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspCj4gIGNyZWF0ZSBtb2RlIDEwMDY0
NCAuZ2l0aHViL3B1bGxfcmVxdWVzdF90ZW1wbGF0ZS5tZAo+Cj4gZGlmZiAtLWdpdCBhLy5naXRo
dWIvcHVsbF9yZXF1ZXN0X3RlbXBsYXRlLm1kIGIvLmdpdGh1Yi9wdWxsX3JlcXVlc3RfdGVtcGxh
dGUubWQKPiBuZXcgZmlsZSBtb2RlIDEwMDY0NAo+IGluZGV4IDAwMDAwMDAwMDAuLjMxOWU2N2Q4
NjEKPiAtLS0gL2Rldi9udWxsCj4gKysrIGIvLmdpdGh1Yi9wdWxsX3JlcXVlc3RfdGVtcGxhdGUu
bWQKPiBAQCAtMCwwICsxLDYgQEAKPiArUGxlYXNlIGRvIG5vdCBzdWJtaXQgYSBQdWxsIFJlcXVl
c3QgdmlhIEdpdEh1Yi4gQnVpbGRyb290IG1ha2VzIHVzZSBvZiBhCj4gK1ttYWlsaW5nIGxpc3Rd
KGh0dHA6Ly9saXN0cy5idWlsZHJvb3Qub3JnL21haWxtYW4vbGlzdGluZm8vYnVpbGRyb290KSBm
b3IgcGF0Y2ggc3VibWlzc2lvbiBhbmQgcmV2aWV3Lgo+ICtTZWUgW3N1Ym1pdHRpbmcgeW91ciBv
d24gcGF0Y2hlc10oaHR0cDovL2J1aWxkcm9vdC5vcmcvbWFudWFsLmh0bWwjc3VibWl0dGluZy1w
YXRjaGVzKSBmb3IgbW9yZSBpbmZvLgo+ICsKPiArVGhhbmtzIGZvciB5b3VyIGhlbHAhCgpHb29k
IGlkZWEuIEl0J3MgYWx3YXlzIGdvb2QgdG8gY2F0Y2ggbWlzdW5kZXJzdGFuZGluZ3MgZWFybHku
ICBBbmQgaXQncwphIHNoYW1lIHRoYXQgR2l0SHViIHNlZW1zIHRvIGluc2lzdCB0aGF0IFBScyBh
cmUgb3BlbiBvbiBldmVyeSByZXBv4oCmCgpSZXZpZXdlZC1ieTogSi4gTmV1c2Now6RmZXIgPGou
bmV1c2NoYWVmZXJAZ214Lm5ldD4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KYnVpbGRyb290IG1haWxpbmcgbGlzdApidWlsZHJvb3RAYnVpbGRyb290Lm9y
ZwpodHRwczovL2xpc3RzLmJ1aWxkcm9vdC5vcmcvbWFpbG1hbi9saXN0aW5mby9idWlsZHJvb3QK
