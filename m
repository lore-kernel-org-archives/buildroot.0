Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDA47E77173
	for <buildroot@archiver.kernel.org>; Sun,  8 Dec 2024 21:21:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8E041406E2;
	Sun,  8 Dec 2024 21:21:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2mfp-1QgaNPK; Sun,  8 Dec 2024 21:21:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 755E0406E4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 755E0406E4;
	Sun,  8 Dec 2024 21:21:57 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 05258979
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5F1D406E4
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:21:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ueEYRARAm0Yk for <buildroot@buildroot.org>;
 Sun,  8 Dec 2024 21:21:54 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::225;
 helo=relay5-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 18E1A406E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 18E1A406E2
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 18E1A406E2
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:21:53 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 65C881C0003
 for <buildroot@buildroot.org>; Sun,  8 Dec 2024 21:21:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1tKOir-00C4f4-2T
 for buildroot@buildroot.org; Sun, 08 Dec 2024 22:21:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 08 Dec 2024 22:21:49 +0100
Message-ID: <87zfl5zx8y.fsf@dell.be.48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] Buildroot 2024.02.9 released
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

SGksCgpCdWlsZHJvb3QgaXMgYSBzaW1wbGUgdG9vbCBmb3IgY3JlYXRpbmcgY29tcGxldGUgZW1i
ZWRkZWQgTGludXggc3lzdGVtcwooaHR0cHM6Ly9idWlsZHJvb3Qub3JnKS4KCkJ1aWxkcm9vdCAy
MDI0LjAyLjkgaXMgcmVsZWFzZWQgLSBHbyBkb3dubG9hZCBpdCBhdDoKCmh0dHBzOi8vYnVpbGRy
b290Lm9yZy9kb3dubG9hZHMvYnVpbGRyb290LTIwMjQuMDIuOS50YXIuZ3oKCm9yCgpodHRwczov
L2J1aWxkcm9vdC5vcmcvZG93bmxvYWRzL2J1aWxkcm9vdC0yMDI0LjAyLjkudGFyLnh6CgpPciBn
ZXQgaXQgZnJvbSBHaXQ6CgpodHRwczovL2dpdGxhYi5jb20vYnVpbGRyb290Lm9yZy9idWlsZHJv
b3QuZ2l0ICgyMDI0LjAyLjkgdGFnKQoKQnVpbGRyb290IDIwMjQuMDIuOSBpcyBhIGJ1Z2ZpeCBy
ZWxlYXNlIG9uIHRoZSBjdXJyZW50IGxvbmcgdGVybQpyZWxlYXNlLCBmaXhpbmcgYSBudW1iZXIg
b2YgaW1wb3J0YW50IC8gc2VjdXJpdHkgcmVsYXRlZCBpc3N1ZXMKZGlzY292ZXJlZCBzaW5jZSB0
aGUgMjAyNC4wMi44IHJlbGVhc2UuCgotIFNlY3VyaXR5IGZpeGVzIGZvciBleHBhdCwgZnJyLCBp
bnRlbC1taWNyb2NvZGUsIGxpYmN1cmwsIGxpYmtyYjUsCiAgbWJlZHRscywgcGhwLCBwb3N0Z3Jl
c3FsLCB0aWZmCgotIEZpeGVzIGZvciBkb3dubG9hZC9jb21waWxhdGlvbi9ydW50aW1lL2xpY2Vu
c2UgaXNzdWVzIGluIGFsc2EtbGliLAogIGFuZHJvaWQtdG9vbHMsIGJhYmVsZCwgYm1hcC10b29s
cywgYm9vc3QsIGVidGFibGVzLCBmYnYsIGZvb3QsIGdhbWluLAogIGdudXRscywgaXJzc2ksIGxp
Ym1vZGJ1cywgbGlidnBsLCBsaW51eC10b29scywgbG1iZW5jaCwgbW9zcXVpdHRvLAogIG11c2ws
IG11c2wtY29tcGF0LWhlYWRlcnMsIG5mcy11dGlscywgbnRwLCBwcm9jcHMtbmcsIHB5dGhvbi1w
c3ljb3BnMiwKICBweXRob24tc2lwLCBxdDZiYXNlLCBxdWFnZ2EsIHJ0LXRlc3RzLCBzc2hndWFy
ZCwgc3lzdGVtZCwgeDExdm5jCgpGb3IgbW9yZSBkZXRhaWxzLCBzZWUgdGhlIENIQU5HRVMgZmls
ZToKCmh0dHBzOi8vZ2l0bGFiLmNvbS9idWlsZHJvb3Qub3JnL2J1aWxkcm9vdC8tL2Jsb2IvMjAy
NC4wMi45L0NIQU5HRVMKClVzZXJzIG9mIHRoZSBhZmZlY3RlZCBwYWNrYWdlcyBhcmUgc3Ryb25n
bHkgZW5jb3VyYWdlZCB0byB1cGdyYWRlLgoKTWFueSB0aGFua3MgdG8gYWxsIHRoZSBwZW9wbGUg
Y29udHJpYnV0aW5nIHRvIHRoaXMgcmVsZWFzZToKCmdpdCBzaG9ydGxvZyAtcyAtbiAyMDI0LjAy
LjguLgoKICAgICA5ICBCZXJuZCBLdWhscwogICAgIDkgIEp1bGllbiBPbGl2YWluCiAgICAgOSAg
UGV0ZXIgS29yc2dhYXJkCiAgICAgOCAgVGhvbWFzIFBldGF6em9uaQogICAgIDMgIFNjb3R0IEZh
bgogICAgIDMgIFRJQU4gWXVhbmhhbwogICAgIDIgIEJyYW5kb24gTWFpZXIKICAgICAyICBDaGVy
bmlhZXYgQW5kcmVpCiAgICAgMiAgRnJhbmNvaXMgUGVycmFkCiAgICAgMiAgTWF4aW0gS29jaGV0
a292CiAgICAgMiAgWWFubiBFLiBNT1JJTgogICAgIDEgIEFuc3NpIEhhbm51bGEKICAgICAxICBC
YXJ1Y2ggU2lhY2gKICAgICAxICBGaW9uYSBLbHV0ZSAoV0lXQSkKICAgICAxICBGbG9yaWFuIEZh
aW5lbGxpCiAgICAgMSAgSGFubmFoIEtpZWtlbnMKICAgICAxICBKLiBOZXVzY2jDpGZlcgogICAg
IDEgIExQIEMKICAgICAxICBNaWNoYWVsIE5vc3Rob2ZmCiAgICAgMSAgTmVhbCBGcmFnZXIKICAg
ICAxICBSb21haW4gTmFvdXIKICAgICAxICBUaG9tYXMgRGV2b29nZHQKICAgICAxICBWbGFkaW1p
ciBPbHRlYW4KICAgICAxICBZdSBDaGllbiBQZXRlciBMaW4KCi0tIApCeWUsIFBldGVyIEtvcnNn
YWFyZApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpidWls
ZHJvb3QgbWFpbGluZyBsaXN0CmJ1aWxkcm9vdEBidWlsZHJvb3Qub3JnCmh0dHBzOi8vbGlzdHMu
YnVpbGRyb290Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2J1aWxkcm9vdAo=
