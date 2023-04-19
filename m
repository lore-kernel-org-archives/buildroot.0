Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB57BC6FD18
	for <buildroot@archiver.kernel.org>; Wed, 19 Apr 2023 19:45:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 78B9341CD6;
	Wed, 19 Apr 2023 19:45:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78B9341CD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RYwK8_DNbdXy; Wed, 19 Apr 2023 19:45:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0990404BF;
	Wed, 19 Apr 2023 19:45:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C0990404BF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 83D361C42EF
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 19:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5DE0984019
 for <buildroot@lists.busybox.net>; Wed, 19 Apr 2023 19:45:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DE0984019
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Zoc6VU0Dh6jO for <buildroot@lists.busybox.net>;
 Wed, 19 Apr 2023 19:45:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 40C1184010
Received: from mail-4316.protonmail.ch (mail-4316.protonmail.ch [185.70.43.16])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 40C1184010
 for <buildroot@buildroot.org>; Wed, 19 Apr 2023 19:45:40 +0000 (UTC)
Date: Wed, 19 Apr 2023 19:45:22 +0000
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Message-ID: <rgAqqQDVcQB2W4pYC9_i78mR_f27aw3H8n-4y6HCzujypDNRqTFUmwyW7T7o0aRrx6zhx6qGRNBogVi_RH_1DYjgh5iVIU4O_nIHMqdUN2c=@protonmail.com>
Feedback-ID: 23448147:user:proton
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=protonmail.com; 
 s=protonmail3; t=1681933537; x=1682192737;
 bh=9Q+ClfnTckuggBCFb4PcQCtOFiVD6PrcT17+zu+4Jn0=;
 h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
 b=CEoTCp0UYCsVC9C0gltnIob9D2u6xgz1IJW4tnpMdEW27jU2R15vz4cXBN0Inztrv
 cMzMYLjKtpA3xdaRAgSYlUlJR7O6zkdSLGX6RCxJbGkLWtNrwphzjaZJLrZP6+UbzQ
 gBhUcbtFUN3lF7kXZpeT/v6oARRt23C/w5tzNGm9Lzmwn84uUv3jDBg/ybvTYf5o9b
 Pgc+PJr/RrQKQPaZuFJDeiF+7dnw3JrceluYbX1us/Y+GMfqIWIsvEQSeyCpZDPtE3
 qa7z9bRwagJRc560p01Dh1k2GhBfnueW8DfCfUOwlk8KFEKRgIKDR2DPo09mEmml5J
 CEjlapNxS6jaA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=protonmail.com header.i=@protonmail.com
 header.a=rsa-sha256 header.s=protonmail3 header.b=CEoTCp0U
Subject: [Buildroot] No sound device
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
From: Lex Nahumury via buildroot <buildroot@buildroot.org>
Reply-To: Lex Nahumury <lexnahumury@protonmail.com>
Content-Type: multipart/mixed; boundary="===============6110837264799907615=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This is a multi-part message in MIME format.

--===============6110837264799907615==
Content-Type: multipart/alternative;
 boundary="b1_S34oHn5P0qKyXeuXlAp5vaJVSaHsnQiHGdcqPKoYbhk"

This is a multi-part message in MIME format.

--b1_S34oHn5P0qKyXeuXlAp5vaJVSaHsnQiHGdcqPKoYbhk
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: base64

SGVsbG8sCgpJIGFtIHRyeWluZyB0byBidWlsZCBhIGxpbnV4IGltYWdlIGZvciB0aGUgT3Jhbmcg
UGkgWmVybyB1c2luZyBidWlsZHJvb3QuCgpnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2J1
aWxkcm9vdC9idWlsZHJvb3QuZ2l0IGJ1aWxkcm9vdAptYWtlIG9yYW5nZXBpX3plcm9fZGVmY29u
ZmlnCm1ha2UgbWVudWNvbmZpZyAoYWRkaW5nIGFsc2EgYW5kIGphY2spCm1ha2UKClRoZSBidWls
ZCBnb2VzIHdlbGwgYW5kIHRoZSBib2FyZCBib290cyBmaW5lLgoKVGhlIFNPQyBoYXMgYW4gb24t
Y2hpcCBJMlMgYXVkaW8gY29kZWMuCkhvd2V2ZXIsIHRoZXJlIGlzIG5vIHNvdW5kIGRldmljZSBk
ZXRlY3RlZC4KCiMgYXBsYXkgLWwKYXBsYXk6IGRldmljZV9saXN0OjI3NDogbm8gc291bmRjYXJk
cyBmb3VuZC4uLgoKSSBoYXZlIHRyaWVkIGEgZGlmZmVyZW50IGJvYXJkIE9saW1leCBPbGludXhp
bm8gQTY0IHdoaWNoIGFsc28gaGFzIGFuIEFsbHdpbm5lciBTT0MKd2l0aCBvbi1jaGlwIGF1ZGlv
IGNvZGVjLgpTYW1lIHN0b3J5OyBubyBzb3VuZCBjYXJkLgoKQW0gSSBtaXNzaW5nIHNvbWUgYnVp
bGQgc2V0dGluZyBpbiBtZW51Y29uZmlnPwpJIGFtIG5ldyB0byBidWlsZHJvb3QgYW5kIExpbnV4
IGludGVybmFscyBpbiBnZW5lcmFsIHNvIEkgYXBwcmVjaWF0ZSBhbnkgaGVscC4=

--b1_S34oHn5P0qKyXeuXlAp5vaJVSaHsnQiHGdcqPKoYbhk
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: base64

PGRpdiBzdHlsZT0iZm9udC1mYW1pbHk6IEFyaWFsLCBzYW5zLXNlcmlmOyBmb250LXNpemU6IDE0
cHg7Ij48c3Bhbj5IZWxsbyw8L3NwYW4+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5JIGFtIHRy
eWluZyB0byBidWlsZCBhIGxpbnV4IGltYWdlIGZvciB0aGUgT3JhbmcgUGkgWmVybyB1c2luZyBi
dWlsZHJvb3QuPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+Z2l0IGNsb25l
IDxhIGhyZWY9Imh0dHBzOi8vZ2l0aHViLmNvbS9idWlsZHJvb3QvYnVpbGRyb290LmdpdCIgcmVs
PSJub3JlZmVycmVyIG5vZm9sbG93IG5vb3BlbmVyIiB0YXJnZXQ9Il9ibGFuayI+aHR0cHM6Ly9n
aXRodWIuY29tL2J1aWxkcm9vdC9idWlsZHJvb3QuZ2l0PC9hPiBidWlsZHJvb3Q8L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj5tYWtlIG9yYW5nZXBpX3plcm9fZGVmY29uZmlnPC9zcGFuPjwvZGl2Pjxk
aXY+PHNwYW4+bWFrZSBtZW51Y29uZmlnIChhZGRpbmcgYWxzYSBhbmQgamFjayk8L3NwYW4+PC9k
aXY+PGRpdj48c3Bhbj5tYWtlPC9zcGFuPjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+
VGhlIGJ1aWxkIGdvZXMgd2VsbCBhbmQgdGhlIGJvYXJkIGJvb3RzIGZpbmUuPC9zcGFuPjwvZGl2
PjxkaXY+PHNwYW4+PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+VGhlIFNPQyBoYXMgYW4gb24tY2hp
cCBJMlMgYXVkaW8gY29kZWMuPC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+PHNwYW4+SG93ZXZlciwg
dGhlcmUgaXMgbm8gc291bmQgZGV2aWNlIGRldGVjdGVkLjwvc3Bhbj48YnI+PC9zcGFuPjwvZGl2
PjxkaXY+PGJyPjwvZGl2PjxkaXY+PHNwYW4+IyBhcGxheSAtbDwvc3Bhbj48L2Rpdj48ZGl2Pjxz
cGFuPmFwbGF5OiBkZXZpY2VfbGlzdDoyNzQ6IG5vIHNvdW5kY2FyZHMgZm91bmQuLi48L3NwYW4+
PC9kaXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5JIGhhdmUgdHJpZWQgYSBkaWZmZXJlbnQg
Ym9hcmQgT2xpbWV4IE9saW51eGlubyBBNjQgd2hpY2ggYWxzbyBoYXMgYW4gQWxsd2lubmVyIFNP
Qzwvc3Bhbj48L2Rpdj48ZGl2PjxzcGFuPndpdGggb24tY2hpcCBhdWRpbyBjb2RlYy48YnI+PC9z
cGFuPjwvZGl2PjxkaXY+PHNwYW4+U2FtZSBzdG9yeTsgbm8gc291bmQgY2FyZC48L3NwYW4+PC9k
aXY+PGRpdj48YnI+PC9kaXY+PGRpdj48c3Bhbj5BbSBJIG1pc3Npbmcgc29tZSBidWlsZCBzZXR0
aW5nIGluIG1lbnVjb25maWc/PC9zcGFuPjwvZGl2PjxkaXY+PHNwYW4+SSBhbSBuZXcgdG8gYnVp
bGRyb290IGFuZCBMaW51eCBpbnRlcm5hbHMgaW4gZ2VuZXJhbCBzbyBJIGFwcHJlY2lhdGUgYW55
IGhlbHAuPC9zcGFuPjwvZGl2PjwvZGl2Pg==


--b1_S34oHn5P0qKyXeuXlAp5vaJVSaHsnQiHGdcqPKoYbhk--


--===============6110837264799907615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6110837264799907615==--

