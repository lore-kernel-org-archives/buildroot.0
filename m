Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BDFBC61DD6
	for <buildroot@archiver.kernel.org>; Wed,  2 Sep 2026 19:33:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8DD240A30;
	Wed,  2 Sep 2026 19:33:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Up0LKbvrgKjK; Wed,  2 Sep 2026 19:33:54 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org E128740A51
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1788377634;
	b=lpIJ2jClcjgmkl8nEjbO2AI8X/Y4joCgmgYWZ4WGWQnERqZqQePTJbfxA91HQT7fA+4n
	 tG4PMhl5KmfbuBKkKMqUp+r7vWt47D4e76Z42qxge/TJkuAPunW3doyR1N8iBTTYmN1go
	 +UdFlDL+wy2CatAJ4viZIUMNk7U1p6nrqyeTywDS6qWMNuaBL8B290+I4LY3AyyTflzsW
	 /w4mZ8eBleJ1VJ01x0DxYUkyw9bEr/2Pqe9weIVuoG1DRWUNzDtfqfG6SnO0B4Krr2yYV
	 5X0zcATAJ1HIp6zFbCbDqy91BKc1fJS3sfby36d3JtsMRZW3DxpWSlNH5X5S/6kb58Q==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1788377634;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=C2/bL0yU2/pCEJS/33M9l3+/quOm6spU77ahyVVyTiY=;
	b=dnydB6vzmBwS9chayuPNIGZho1DamCB3O0IT7DDUFU7RhUDSNV3XtulNDvFLLxBmdeoY
	 Syl15iDF8fiyvndjhchujOewtbxs7OPkiHssprV5yzwCcl2X8N6chi5AthSCJr/+jFaMY
	 rZXm3KS2q0CvgwFG4uOu4IFTO6ftRw//f5gRW8Bfw9aLdjX3q84KzLAJC9H0pu1Yk+y2W
	 kLvVEzdhprVIDiGvZTzNSQT/2NjSMPNWR/8r9iS/8tuR0e/XCFiGp1vpkUp4mFwx79T7i
	 +FWPO4sHy6EuZpiKYS0QYrjmP5GO1gY98vH7BKjBs3yNlFwIRAtUBBJv6ERshvX47SQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1788377634;
	bh=C2/bL0yU2/pCEJS/33M9l3+/quOm6spU77ahyVVyTiY=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=msU31R2JFMJw9r2GaFtKJm8WvxuEGBrxBX08Kvcr0oNrLewaFhgjInqNKiHvGbPQi
	 l2jjzk2OCWGIT6pwl/9EuG9DkoYIa3GS6Lwj/ZFrjUDfhFAC5i4cXTzeAEghnSFwL3
	 XFdb0kcgQojNyFpIzHr5/Jhw8BwqpTWdoBCs25pQSjooXGBZRTLZ8jfYwEM37wQ1QT
	 Pq5WizhDXefaWxnK9Gk+XzmrQAwjpBB08ky3sILq0RSLEGwWlsHS4zW/6micG8MmPR
	 PDNBIdtxYba9PQqWTe3eIRSQ0hxdUyHBdHNrt9yrh4/eeDmICfiR42waSHHNFoxtAM
	 6PqOzM246gpUw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E128740A51;
	Wed,  2 Sep 2026 19:33:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05B111D9
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EB6C680DC5
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:33:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oEL6IKH00cju for <buildroot@buildroot.org>;
 Wed,  2 Sep 2026 19:33:52 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 5190880D8A
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1788377632;
 b=tUbFPBdjmkPAihYRTETIL7e+kSsWwFe2HXMbPi4VbvHklsgdJ2mwFh5fsv5CmC1MErTt
 2qNIFW+rnRdhmGTKtXW1HxCCxDEH9ww2FoPV9PeaIIyiEGerTekNiUhdyVFjGoOv7nH/W
 Y3Z06hPvVDomSXjSd+3RRIKC0nLsQStg1aBTPHC9Ni1/GLa+QQnJBinmrEw7vtlt4l/sG
 8oP998AMfxBv4EN0JpXlOd/t/7zEQ6qKF3TnKMVzcyPvd7sJ3J9LY3b2CfEBAnApDIVRu
 4M0QsvNQXm8KrOB6mIATIc1RCUjqHPMpL2lRRQqo31xB8WzD7jdRNoY0R8ife2v5Jzg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1788377632;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=M58ZLa4m17Vu2vgUud/ky/WGxuFD3fCWfvDArTRZ79w=;
 b=ntYZHinKqBx+tbq4gEiUAtQAl5TRgrdtfiiBjAoaXnPCP6E1Xf7STS0w8Icrsh1AJM8I
 kRB2kGfuxjeQ3BFpT3WyD0BzgUuFUwjQpeFdqFZZ03EahQeTJj6puh0Lz/ouOhI8bR/2t
 +IzP6CuDFV+ucYAdbt8CZYIpCOE4c4+SV9rhoqDxO+Ez6kJYcic/1DL2iRRHZYYH4+8Xr
 VE84aMPrObqItPG8b4MtmvBer+WDzLHP3LeTxM+/uKWyblJxnXzClQCBTVUuqT8Skxx4I
 LVHAJ8q7osmhLVRoofGNZC9OmACKHgnAhjTxehZ+XoLNlZiCRxqwB2S3HwZg8n09FBw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5190880D8A
 for <buildroot@buildroot.org>; Wed,  2 Sep 2026 19:33:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A3CD28E244; Wed,  2 Sep 2026 19:32:52 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 2 Sep 2026 21:28:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 672b5f9213841bd79f1596e755bbffa7e4f39d2a
X-Git-Newrev: 8f38b17f76cc5963e69371c51d4915cb6ee221a6
X-Patchwork-Hint: ignore
Message-Id: <20260902193252.A3CD28E244@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/mpd: update to version 0.24.15
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8f38b17f76cc5963e69371c51d4915cb6ee221a6
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Version 0.24.15 change log:

* protocol
	fix crash on "sticker delete" and "sticker find"
* database
	upnp: fix crash bug
* input
	alsa, curl, nfs: fix stalled transfers
* playlist
	asx, pls, rss, xspf: limit to 16 MB
	cue: fix problem playing CUE tracks in music directory root
* player
	fix noise with replay gain and cross-fade

Signed-off-by: Andreas Ziegler <br025@umbiko.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/mpd/mpd.hash | 2 +-
 package/mpd/mpd.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
index bf9ed653fd..7d0c2072d8 100644
--- a/package/mpd/mpd.hash
+++ b/package/mpd/mpd.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  367e85debb4427605cccb5415f2858ebb401d849a80615553f59520f4640811e  mpd-0.24.14.tar.xz
+sha256  524c70bce3fcd268016156bdc97abcf5be1904f0c6fd622688999123e3c4c457  mpd-0.24.15.tar.xz
 sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
index d063d509f4..4db0aee7cb 100644
--- a/package/mpd/mpd.mk
+++ b/package/mpd/mpd.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MPD_VERSION_MAJOR = 0.24
-MPD_VERSION = $(MPD_VERSION_MAJOR).14
+MPD_VERSION = $(MPD_VERSION_MAJOR).15
 MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
 MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
 MPD_DEPENDENCIES = host-pkgconf fmt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
