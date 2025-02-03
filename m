Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EBBBC02192
	for <buildroot@archiver.kernel.org>; Mon,  3 Feb 2025 22:23:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CF01D605CF;
	Mon,  3 Feb 2025 22:23:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bw9cDz97SjcQ; Mon,  3 Feb 2025 22:23:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BA32060F8D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BA32060F8D;
	Mon,  3 Feb 2025 22:23:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27B2112A
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:23:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 142F0401E1
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:23:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ioQnaxTp9uVi for <buildroot@buildroot.org>;
 Mon,  3 Feb 2025 22:23:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a02:6b8:c41:1300:1:45:d181:d500; helo=forward500d.mail.yandex.net;
 envelope-from=leo@yuriev.ru; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D10AA40102
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D10AA40102
Received: from forward500d.mail.yandex.net (forward500d.mail.yandex.net
 [IPv6:2a02:6b8:c41:1300:1:45:d181:d500])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D10AA40102
 for <buildroot@buildroot.org>; Mon,  3 Feb 2025 22:23:06 +0000 (UTC)
Received: from mail-nwsmtp-mxback-production-main-699.myt.yp-c.yandex.net
 (mail-nwsmtp-mxback-production-main-699.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:4fa4:0:640:5903:0])
 by forward500d.mail.yandex.net (Yandex) with ESMTPS id CBB9860FCB
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 01:15:35 +0300 (MSK)
Received: from mail.yandex.ru (2a02:6b8:c12:31ac:0:640:c9ee:0
 [2a02:6b8:c12:31ac:0:640:c9ee:0])
 by mail-nwsmtp-mxback-production-main-699.myt.yp-c.yandex.net (mxback/Yandex)
 with HTTPS id QFsfDi4O7Gk0-SdnSwoqp; Tue, 04 Feb 2025 01:15:35 +0300
X-Yandex-Fwd: 1
Received: by mail-sendbernar-production-main-60.myt.yp-c.yandex.net with HTTP; 
 Tue, 04 Feb 2025 01:15:35 +0300
From: =?utf-8?B?0JvQtdC+0L3QuNC0INCu0YDRjNC10LI=?= <leo@yuriev.ru>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
In-Reply-To: <20250112171832.2886452-1-leo@yuriev.ru>
References: <20250112171832.2886452-1-leo@yuriev.ru>
MIME-Version: 1.0
X-Mailer: Yamail [ http://yandex.ru ] 5.0
Date: Tue, 04 Feb 2025 01:15:35 +0300
Message-Id: <218931738620849@mail.yandex.ru>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=yuriev.ru; s=mail; 
 t=1738620935; bh=dPflk4jThIdNYFNTB19wDWsA7wXpGRGBKCTYHgTft7Q=;
 h=Message-Id:References:Date:Subject:To:In-Reply-To:From;
 b=R8GQq5+aiPX9fOuGdriC6BO6WI0aVuW83kaW4P741vyqzWGTLBm+ShbFmldJ/uhf3
 DkIZt8fgcdBE9upql1s4Z/ElhR1H1qAbEcOzuwHgRhtrIOWmxfiy2YTQbZXgCl5vW3
 jaPXPCEPLyhwpBDUkVzCo4sv5QLkB2jmlOc7MEoE=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=yuriev.ru
X-Mailman-Original-Authentication-Results: mail-nwsmtp-mxback-production-main-699.myt.yp-c.yandex.net;
 dkim=pass header.i=@yuriev.ru
Subject: Re: [Buildroot] [PATCH] package/libmdbx: bump version to 0.13.3
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
Content-Type: multipart/mixed; boundary="===============2105232745875083440=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2105232745875083440==
Content-Transfer-Encoding: base64
Content-Type: text/html; charset=utf-8

PGRpdj48ZGl2PjxkaXY+SGksPC9kaXY+PGRpdj7CoDwvZGl2PjxkaXY+QSBmZXcgd2Vla3MgYWdv
LCBJIHN1Ym1pdHRlZCB0aGUgcGF0Y2ggaHR0cHM6Ly9wYXRjaHdvcmsub3psYWJzLm9yZy9wcm9q
ZWN0L2J1aWxkcm9vdC9saXN0Lz9zZXJpZXM9NDM5OTgyLjwvZGl2PjxkaXY+wqA8L2Rpdj48ZGl2
PlBsZWFzZSBjYW5jZWwgaXQgYXMgYW4gZXJyb3IgaGFzIGJlZW4gZm91bmQgKEkgaGF2ZW4ndCBm
b3VuZCBhbnkgaW5zdHJ1Y3Rpb25zIG9uIGhvdyB0byBkbyBpdCBteXNlbGYpLjwvZGl2PjxkaXY+
wqA8L2Rpdj48ZGl2PlRoZSBuZXcgdmVyc2lvbiBvZiBsaWJtZGJ4IHdpbGwgYmUgcmVsZWFzZWQg
aW4gYSB3ZWVrIGFuZCBJIHdpbGwgc2VuZCBhIG5ldyBwYXRjaC48L2Rpdj48ZGl2PsKgPC9kaXY+
PGRpdj5UaGFua3MsPC9kaXY+PGRpdj5MZW9uaWQuPC9kaXY+PC9kaXY+PC9kaXY+PGRpdj7CoDwv
ZGl2PjxkaXY+LS0tLS0tLS0tLS0tLS0tLTwvZGl2PjxkaXY+0JrQvtC80YM6IGJ1aWxkcm9vdEBi
dWlsZHJvb3Qub3JnIChidWlsZHJvb3RAYnVpbGRyb290Lm9yZyk7PC9kaXY+PGRpdj7QotC10LzQ
sDogW1BBVENIXSBwYWNrYWdlL2xpYm1kYng6IGJ1bXAgdmVyc2lvbiB0byAwLjEzLjM7PC9kaXY+
PGRpdj4xMi4wMS4yMDI1LCAyMDoxOCwgItCb0LXQvtC90LjQtCDQrtGA0YzQtdCyIChMZW9uaWQg
WXVyaWV2KSIgJmx0O2xlb0B5dXJpZXYucnUmZ3Q7OjwvZGl2PjxibG9ja3F1b3RlPjxwPlRoaXMg
aXMgc3RhYmxlIHJlbGVhc2Ugb2YgZnJvbnR3YXJkIF9saWJtZGJ4XyBicmFuY2ggd2l0aCBuZXcg
c3VwZXJpb3IgZmVhdHVyZXM8YnIgLz5vbiB0aGUgYmlydGhkYXkgYW5kIGluIG1lbW9yeSBvZiBT
ZXJnZWkgS29yb2xldiB3aG8gd2FzIHRoZSBsZWFkIFNvdmlldCByb2NrZXQ8YnIgLz5lbmdpbmVl
ciBhbmQgc3BhY2VjcmFmdCBkZXNpZ25lci48YnIgLz48YnIgLz5UaGUgY29tcGxldGUgQ2hhbmdl
TG9nOiA8YSBocmVmPSJodHRwczovL2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngv
YmxvYj9maWxlPUNoYW5nZUxvZy5tZCIgcmVsPSJub29wZW5lciBub3JlZmVycmVyIj5odHRwczov
L2dpdGZsaWMucnUvcHJvamVjdC9lcnRoaW5rL2xpYm1kYngvYmxvYj9maWxlPUNoYW5nZUxvZy5t
ZDwvYT48YnIgLz48YnIgLz5TaWduZWQtb2ZmLWJ5OiDQm9C10L7QvdC40LQg0K7RgNGM0LXQsiAo
TGVvbmlkIFl1cmlldikgJmx0OzxhIGhyZWY9Im1haWx0bzpsZW9AeXVyaWV2LnJ1IiByZWw9Im5v
b3BlbmVyIG5vcmVmZXJyZXIiPmxlb0B5dXJpZXYucnU8L2E+Jmd0OzxiciAvPi0tLTxiciAvPsKg
cGFja2FnZS9saWJtZGJ4L2xpYm1kYnguaGFzaCB8IDQgKystLTxiciAvPsKgcGFja2FnZS9saWJt
ZGJ4L2xpYm1kYngubWsgfCAyICstPGJyIC8+wqAyIGZpbGVzIGNoYW5nZWQsIDMgaW5zZXJ0aW9u
cygrKSwgMyBkZWxldGlvbnMoLSk8YnIgLz48YnIgLz5kaWZmIC0tZ2l0IGEvcGFja2FnZS9saWJt
ZGJ4L2xpYm1kYnguaGFzaCBiL3BhY2thZ2UvbGlibWRieC9saWJtZGJ4Lmhhc2g8YnIgLz5pbmRl
eCAyMjJlN2NhZjVjLi4xYzkxYWEyZjkwIDEwMDY0NDxiciAvPi0tLSBhL3BhY2thZ2UvbGlibWRi
eC9saWJtZGJ4Lmhhc2g8YnIgLz4rKysgYi9wYWNrYWdlL2xpYm1kYngvbGlibWRieC5oYXNoPGJy
IC8+QEAgLTEsNSArMSw1IEBAPGJyIC8+wqAjIEhhc2hlcyBmcm9tOiA8YSBocmVmPSJodHRwczov
L2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UvU0hBMjU2U1VNUyIgcmVsPSJub29wZW5lciBub3Jl
ZmVycmVyIj5odHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UvU0hBMjU2U1VNUzwvYT48
YnIgLz4tc2hhMjU2IDE5YzBlYjMzZTFlZDQzY2EyYTk0ZGNlYjA2ZGQzMTk0NjQzMmQxNmYzMGE5
NzUxZDM3MDFjNjdlZmEyMmViMWEgbGlibWRieC1hbWFsZ2FtYXRlZC0wLjEyLjEyLnRhci54ejxi
ciAvPitzaGEyNTYgMmU0MjUwNWYxY2ViNTc5NDU1NjlkYjNjMWE1ZGI5YjUyMTZkOGY3MmRhN2M3
NWMyNDBmZjgxMTk2ZjhlOWEwYiBsaWJtZGJ4LWFtYWxnYW1hdGVkLTAuMTMuMy50YXIueHo8YnIg
Lz7CoDxiciAvPsKgIyBMb2NhbGx5IGNhbGN1bGF0ZWQ8YnIgLz4tc2hhMjU2IDMxMGZlMjVjODU4
YTk1MTVmYzhjOGQ3ZDFmMjRhNjdjOTQ5NmY4NGE5MWUwYTBlNDFlYTk5NzViMTM3MWU1NjkgTElD
RU5TRTxiciAvPitzaGEyNTYgMGQ1NDJlMGM4ODA0ZTM5YWE3ZjM3ZWIwMGRhNWE3NjIxNDlkYzY4
MmQ3ODI5NDUxMjg3ZTExYjkzOGU5NDU5NCBMSUNFTlNFPGJyIC8+ZGlmZiAtLWdpdCBhL3BhY2th
Z2UvbGlibWRieC9saWJtZGJ4Lm1rIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWs8YnIgLz5p
bmRleCBjNzM2OTQ1ZTkyLi5hMGYzNGRjOTY2IDEwMDY0NDxiciAvPi0tLSBhL3BhY2thZ2UvbGli
bWRieC9saWJtZGJ4Lm1rPGJyIC8+KysrIGIvcGFja2FnZS9saWJtZGJ4L2xpYm1kYngubWs8YnIg
Lz5AQCAtNCw3ICs0LDcgQEA8YnIgLz7CoCM8YnIgLz7CoCMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
IyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMjIyMj
PGJyIC8+wqA8YnIgLz4tTElCTURCWF9WRVJTSU9OID0gMC4xMi4xMjxiciAvPitMSUJNREJYX1ZF
UlNJT04gPSAwLjEzLjM8YnIgLz7CoExJQk1EQlhfU09VUkNFID0gbGlibWRieC1hbWFsZ2FtYXRl
ZC0kKExJQk1EQlhfVkVSU0lPTikudGFyLnh6PGJyIC8+wqBMSUJNREJYX1NJVEUgPSA8YSBocmVm
PSJodHRwczovL2xpYm1kYnguZHFka2ZhLnJ1L3JlbGVhc2UiIHJlbD0ibm9vcGVuZXIgbm9yZWZl
cnJlciI+aHR0cHM6Ly9saWJtZGJ4LmRxZGtmYS5ydS9yZWxlYXNlPC9hPjxiciAvPsKgTElCTURC
WF9TVVBQT1JUU19JTl9TT1VSQ0VfQlVJTEQgPSBOTzwvcD4tLTxiciAvPjIuNDcuMTxiciAvPsKg
PC9ibG9ja3F1b3RlPg==

--===============2105232745875083440==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2105232745875083440==--
