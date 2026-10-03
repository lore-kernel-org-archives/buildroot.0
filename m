Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2A78CA5FDD
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 07:25:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B87D605D9;
	Sat,  3 Oct 2026 07:25:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BhC7efpUdc9E; Sat,  3 Oct 2026 07:25:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A2D9C60DA1
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791012320;
	b=TG+3W4TObMLmNUKGvy5W7sHSTug79H+u5YUfOb9lUx/1W+lNCCRHcixbSeeZxr+ZVyyp
	 4WT3ViZLG6OyqeI5PvQTDhVEAq1U1UgGHwxGkidSbA+etAF4ltQrS69E4B/mtlg45kGR3
	 AhviSFmFltmDruyDz16kcejlUJsR/0ErWPMuMNWuAA4fL4aPyYeT+RTvTxs+msqXQRrxZ
	 yNXPeydErp/F1nR63rVjSfna8soxa+Fo36zLWVupMfSlhXvFoeYkC+1NaPiVn3fcDZxU8
	 jbjcJSgJ3VQIV7c/eBzrc7ylngeiFcz4vDi4IyM+n5ds6GzWg8jHd4BEZIMS0cYEeYg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791012320;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:Date:Message-ID:
	 X-Mailer:MIME-Version:X-Spamd-Bar:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=gX9WewsI1tD5/6or5/J9abS2Hls562Nul4A3ymZJDvY=;
	b=c02d4cBawwmklZqvjWc+qIX5HE+eXPjgLZMHVxn1Bw908WKSPcFcBR/NXb+OYbA9HGTz
	 9eN33HnXYt5G+Mth4tzzhKYxc/vv990g59PW2bwIai6XSkwqKhg46pPDl0LY1t19fFCgx
	 qix99rksi5EOvMSgpTvVWtbK47tyt6tvLh6Xo1b/K7Ws1j46h1S6e0GSAyj/i+2qVFkhj
	 qZd/Czxv7zh0PzOhiu9LgazR9YiaX8og/1q2zaAaMih1XawrXd33j8xwafDlOg/OdOqh1
	 F++L9JMiqvwE5BZ5G24JMEP6ab+rhYfhLPMuyRoLVKhWluXlwD43pvzXmTchC3fIPlQ==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791012320;
	bh=gX9WewsI1tD5/6or5/J9abS2Hls562Nul4A3ymZJDvY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=hdzWWNcu6kdTlcch7voN429/Ln66qwRJ90oBN38b1ZIX5VeLVexN3IqHX97FLhCxN
	 yv8Ut6/q/cNNTjgP2l0kpb7p/LoT8mprC0+kJeDLXRIKOTJfiRFth2SdQIJjqiP36W
	 cF174bwyP2ebaICqU3lTF6auoGzShbzc2JcLLdsOfem6YRsbmSCNSs8TVue9jSbATs
	 CLpZRMZ2k+nLBTDU9TXk9Pp5D4wT4DbMiTZWBcFShKTAkix+Lgqn7+VJqQPJvdoPLk
	 ifo36qieM+nNKK0PdYOfd16aZDkxNXl6I0R4YWWXjbbZbzH2bsloobPcL2M4BW/1Gk
	 RKGdWwb67tpMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2D9C60DA1;
	Sat,  3 Oct 2026 07:25:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 92657179
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 789EF811A1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:25:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2xBDj-ttito for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 07:25:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 7C4B180F03
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791012318;
 b=drSEW+eDNHR9oJqowi6LPhFT35lcAKAEPJfkpxdM/bU9+Grs24eWUgtx7XNW3rND9ij8
 CCGQ3NtebBZpko2/8AjtJZgf1cWSo6mmjHQ8Vay9wGIizRQ9hOznGKQlwVqsY9Xi1HSxc
 PpCBuQE2cvJeXJnmBCdlEmVCUtZWOto7DAIg61FEPDG0HRBnK7NGXBo7f71Qg7TH/Oste
 PrdEdDsos2aXhUCQrKtmWAu2YlZF2QtOCiZ6zqwh8B45OFg6NOSJR2dPoD2R88gZT9LnU
 G+WBDPkPhpBAZfML734SufAlNjYhk99YpRjjmmD4RcApCj2BJtX0Ye5SVvsiBq/k0rg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791012318;
 h=Received-SPF:DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Spam-Score:X-Spamd-Bar;
 bh=5My5Xr4iMZgGK3fV3Usm0O6hjUnc9ovmuksnN4Liq0Q=;
 b=IWCX0oCaA1gAFZQy/HqAg9XFb/Vk1NqtFrkq+ApinXeOWiVH/0N1Trt5mKrzY+HBZBri
 B40RnGieg4ULPLbfZxxu9TdpJjpGFJ2CMxdbc0PatI68rpQtl8OkgJifi9SvU5P4ndGsv
 rXA/JBtDOWCDZgPqUDszGg/Hw/x2BygkJm+/6smUDz3E7JFD9E43Ufjrf1v9fhvK+Iq6n
 Vap7rjAMG+1mNsGyFBFdwPdGAa5NdJXduJdESwBY/zL6Dw6v20J/cydFYdoVMTDeOTSyN
 eKtyaqnx8vhOh5SlZ/jjw2XU+Rksolgptb3XNpuhOfwqu2e2V03pmIKXTHgbN/G8Gsg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=kuhls.net; 
 dkim=pass header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=HDtaFJzD; 
 arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=HDtaFJzD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7C4B180F03
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 07:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1791011559;
 bh=5My5Xr4iMZgGK3fV3Usm0O6hjUnc9ovmuksnN4Liq0Q=;
 h=From:To:Cc:Subject:Date:From;
 b=HDtaFJzDYZbt9XCNNN/3FouQ+mu2sK6KlKVLUfk/MqWvkMxI4FEHZsDiYddc2Fy9y
 bCHtkM/aZTA6SCFPup0548PNAM24pBX4Uki+Tr3ST3YBomdbmapaI1AnNt5217VbAD
 9feDPaI7UzaFLddi18M1+SrEpnx8sgejK9qIYemgD3keiqvSf+y8R8XCmQzXKxS8cT
 MSE4FuBs8xreQylCmtokfGUGN7XHlCEbLws7KgjSkKMC8xYHpEG3mOTmfcput0CwEk
 U47br1F9Lid4ovkTAUXcKgtIV4j4F+LuGSnEu9qvYzjC3LbLgoTQOGKyP5oRVaSlhi
 +NRpyGFux+oWQ==
X-KAS-Sym: v3:f51bdf72230551df:aVgxUaefb2XNQFO0sfjJTvNA+04+6xREWB5fwyxIKrqIY
 6mJlf5GbhMRhP5Jnqgg94HEG4oSJHBZUEj3pzOFxN/McRfattdsa6NBLywrBnxY+KWMKE2sOvUc
 nU/+eKAmLkXa+D46Y+oYAZD+V89Q+FKq5aD43fDzo8WKS6l0bp9akCcVXdaIIhc9z9+3gnnKCGt
 OBszBNTRwHh0nJG8/FCsT4RXH+Gx/HVdM4tuKBs/uQXCnJeHcogqFiMT1ikgAOnY3Tva7M9KsGY
 toqQdT+BXuFPjy0yfbdvI/7OyQImwr3wNnVdyBer8Net9rm+Q1frXMACTc0O6xQpA2mHlYhA==:
 7LTCCrx4mW1JVbHQrOZbsu623jcEDPvlggMA1blv8/efcgsGUGjeVdPMfdY19QSeea8mIoLuW6f
 8AvJD+ScbXsurjGDa8KrI/+CaZ+Owp+RVWFhbPaT8cBGE6XnEeA2LvgHDHKHvVEFp2O5voEomNb
 b/vDj1/OU0Pj+8QxRirW11u4FeMc1WtWU5D+vdJ86eaKsbyABqPqnFNaDcFRMk9WFdF7YSzGgH0
 +2ffByoh3XGLzWYVMg/OgFWgwo2fYipibo22xbW/gQ9eZWoLyFqkbeYtJx3vNFJRwGkqL+/Zxu+
 Bie2wXpA6QzSvxkrDgego0+zrt4hrY5n0qcOXaf4wzlZfD/3cUuBUEOQLg4Z1z0AvPwse6kfRl3
 EX5NF13YF10f2588rqpoR/BUfXMN3KEm/ErvClpbtF44NWemS78qMeLR0KPnCfEcPrlJm32MwOE
 rybOJQ7wAUz1yhZ7hEs7wky+yh24cFy0sjOdMnkzrSwbqbjB+V2RDvZJBCSHEBRE6qrwg+WfZOZ
 +2xO3pb1y/KCS9Iq1MAyEZNWqO6DM5s/y12qG+oPHEQEV9KqOhzLEk7nL7rHdn1cdVYseglx/T/
 Eh0U/JR4BKxpG9tkFOIpKklTMSjPqxIX76lo0RZXQJtaL2t8hjycN5o85/ysvcE=
Received: from fli4l.lan.fli4l (p5b3a03df.dip0.t-ipconnect.de [91.58.3.223])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 07577A4C52BD;
 Sat,  3 Oct 2026 09:12:39 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41416)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xCtvB-00000000180-2P1g;
 Sat, 03 Oct 2026 07:12:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat,  3 Oct 2026 09:12:37 +0200
Message-ID: <20261003071237.1471628-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
Subject: [Buildroot] [PATCH 1/1] package/{glibc,
 localedef}: security bump version to 2.44-57-g34106fee6
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fixes CVE-2026-97399:
https://gitlab.com/gnutools/glibc/-/commit/34106fee698c83eb0af71d4d0381e66b399be746

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/glibc/glibc.hash       | 2 +-
 package/glibc/glibc.mk         | 5 ++++-
 package/localedef/localedef.mk | 2 +-
 3 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 439fe1f140..51e29673c3 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from git)
-sha256  2ba6ee9ed5177a792fcce4da13225800f0cb3a2413a459e7864b8843eb5cb790  glibc-2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891-git4.tar.gz
+sha256  902d628994c2f3b30af4a7f507835079852cc8ed21d8a7f340e45dc5dae148bf  glibc-2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746-git4.tar.gz
 
 # Hashes for license files
 sha256  edaef632cbb643e4e7a221717a6c441a4c1a7c918e6e4d56debc3d8739b233f6  COPYINGv2
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index a838ac1a81..435a97361b 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+GLIBC_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
 GLIBC_SITE = https://gitlab.com/gnutools/glibc.git
 GLIBC_SITE_METHOD = git
 
@@ -46,6 +46,9 @@ GLIBC_IGNORE_CVES += CVE-2026-8674
 # Fixed by 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
 GLIBC_IGNORE_CVES += CVE-2026-89092
 
+# Fixed by 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
+GLIBC_IGNORE_CVES += CVE-2026-97399
+
 # This CVE is considered as not being security issues by
 # upstream glibc:
 #  https://security-tracker.debian.org/tracker/CVE-2010-4756
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index e4bfce1a3a..becbdfae7f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION, SITE, and LICENSE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.44-55-gc90398e00571476711792baacb6d92bd2a7b6891
+LOCALEDEF_VERSION = 2.44-57-g34106fee698c83eb0af71d4d0381e66b399be746
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION)$(BR_FMT_VERSION_git).tar.gz
 LOCALEDEF_SITE = https://gitlab.com/gnutools/glibc.git
 LOCALEDEF_SITE_METHOD = git
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
