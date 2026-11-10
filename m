Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1FB1606A331
	for <buildroot@archiver.kernel.org>; Tue, 10 Nov 2026 16:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=m85GcxFg;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256 header.s=20170329 header.b=S6fn6Wcl
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C5E42408A2;
	Tue, 10 Nov 2026 16:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mxx4WT2AQQ5V; Tue, 10 Nov 2026 16:58:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6D217408AD
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1794329925;
	b=YAhXFn41q7gfK5y65iMPLaLhouoXKlT0dCyvm6nwjdINU+K74I6eax3nCxcxErT/0c8X
	 I5KidvUH8FOQeCwiBLAAey7KkIMmad8hrrEheIs3ll2ypTpFo33kwVaa1Ezv0P3tm/Rl+
	 OAnpM2mK45fPoy+Q/bf+fYeLXV4rW1jwM43bdRDfCeWygtuF/I5KMUBYVQ0UN+5cyxCyf
	 Wpt1g7+OQYkyEFt4Zv4FJkQHzIy4QxD+ZUvn9NOpvZm06INBq951rch3Uz7VBQBl4UVvd
	 9lXhETanDlH8SIsxG6zGm5W5e/phzaWxHjD+dl9N78MdF3b0zJuXKGy3k5v1i4DCBBw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1794329925;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:X-Greylist:Received-SPF:Received:
	 DKIM-Signature:Received:Received:From:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=kNAlTC1MmqfQnslSg6Tw49eGnbR0MFVm1iEA1NeKAiQ=;
	b=mAGsb4xdHvs3Q61O4DQOmJxQAQr266W77BkuWV/uvDNKTBezKse9C+ODJ4l/56JlP8XD
	 WIjTctQO19GwHGl71U7ZjCw0WJda+eWIUwMnXoxb4BXMwNWv200ZQmsv+M4sEleITY/L2
	 49zPYJPAwk0xnCeCmcB1aL20r0T1MF4BedFe+KIaxIiUKoX2nYXXziJBhLyP1N9xPl93E
	 J5a54MdZSmeAGoLTk28GiIcQK9bbEWg2/DeVBItBKjSibF/J+sLhYq6jsJUY2hQSlLxSq
	 /4UT7V0QetuUTum3FW1Hi1LSlVF05+OuGy1QW9u3dWlGf86h1qnuhn20SwUVSCZWoUg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1794329925;
	bh=kNAlTC1MmqfQnslSg6Tw49eGnbR0MFVm1iEA1NeKAiQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=m85GcxFg8TtXZnbhLFfR/0Cpg+e/9rIHCEgLPpkh1LTcjC8VicjqM0tP/SDtJqh99
	 PySillCRBdQP37LZpmv0LK5GUSep1vqb1no2Q8gAYOm+a86T/mHgfvbYxUtmgSt5iy
	 jgqyuo+uSC2XoJFdZr4iHZqY0CNi8FVhFFfata9eJakNt2Kt3VwPszdqMF6y62m0Bd
	 lmo7xV6sOXV3Lhyx0Nwx5LOwDCYdU3PimLEytr05eSizu81qzR/7qWWSer5HFjz2K5
	 HBRoDKlrX5Dejo8FQq7BKVZ8EKwShWHWHwJs1pQcljH18sY4wYz8Spy6nEJNV0vqKw
	 fuyEL3ptjsR2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D217408AD;
	Tue, 10 Nov 2026 16:58:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 477E91A6
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:58:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38F2160783
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:58:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xivzBpaCzyrV for <buildroot@buildroot.org>;
 Tue, 10 Nov 2026 16:58:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2AD9E60690
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=213.97.179.56
X-Greylist: delayed 472 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Nov 2026 16:58:41 UTC
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp3.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=igalia.com header.i=@igalia.com header.a=rsa-sha256
 header.s=20170329 header.b=S6fn6Wcl
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=213.97.179.56;
 helo=fanzine2.igalia.com; envelope-from=aperez@igalia.com; receiver=<UNKNOWN> 
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2AD9E60690
 for <buildroot@buildroot.org>; Tue, 10 Nov 2026 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
 Cc:To:From:From:Reply-To; bh=BBcCxhbrgSi7O59oBQjISyn4I5OcsPYLIEPeZj82GzY=;
 t=1794329921; x=2109689921; b=S6fn6WclpmQUGuM1GlfAx9vkGOSgpb3DsLTgeozf8jcK9Ia
 t7htQTpEi+NZX6zzx5W11FIHpo3S6SZ9RDT+A5X2tEQYz4TtSFU9DiWevsZrYE7I5XsRFNBd8JNTo
 51b55v4rSYJnfTlJVYav382bZJayIH95gS7NgR2uN8E2BfwzIyd6f3xUeCmuWts7aLCLhUa1owzSw
 FMxbJgXc205wke1VHWNYUm3CZHihuwjcWZIcPQKnZKWplN+CsWJD7p+ExvmNCCnp88w22jv+7gysq
 aUO5qMw5HbS+AQfmyF30NHZP4DBv7BSfGVuGSMx9IXdJOLTGpTRh7ZLgQmeLZHtg==;
Received: from 68.171.94.90.dynamic.jazztel.es ([90.94.171.68] helo=kodama)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1xQpB7-008HHO-Kb; Tue, 10 Nov 2026 17:58:37 +0100
Received: from localhost (kodama [local])
 by kodama (OpenSMTPD) with ESMTPA id 4dd5a1f8;
 Tue, 10 Nov 2026 16:58:37 +0000 (UTC)
From: Adrian Perez de Castro <aperez@igalia.com>
To: buildroot@buildroot.org
Cc: Adrian Perez de Castro <aperez@igalia.com>
Date: Tue, 10 Nov 2026 17:58:34 +0100
Message-ID: <20261110165837.3684633-1-aperez@igalia.com>
X-Mailer: git-send-email 2.56.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/xdg-dbus-proxy: security bump to
 version 0.1.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This release solves vulnerabilities that resulted in bypassing message
filtering. Release notes:

  https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.9

Fixes:

  https://github.com/flatpak/xdg-dbus-proxy/security/advisories/GHSA-2cgv-pwcq-wvpq

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/xdg-dbus-proxy/xdg-dbus-proxy.hash | 4 ++--
 package/xdg-dbus-proxy/xdg-dbus-proxy.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
index bbc1762acb..fdc14b1121 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.hash
@@ -1,5 +1,5 @@
-# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.8
-sha256  b6630bd24f8161b0e2546d2acbb014a3b3249f5c0d75f2a863ade898b9034d3d  xdg-dbus-proxy-0.1.8.tar.xz
+# From https://github.com/flatpak/xdg-dbus-proxy/releases/tag/0.1.9
+sha256  5450dda586ec3bb3ca709d311e845487883faa3b09cf562608d7e84f4311dced  xdg-dbus-proxy-0.1.9.tar.xz
 
 # Hash for license files:
 sha256  dc626520dcd53a22f727af3ee42c770e56c97a64fe3adb063799d8ab032fe551  COPYING
diff --git a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
index 7f9fe16f28..4a8ae661a3 100644
--- a/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
+++ b/package/xdg-dbus-proxy/xdg-dbus-proxy.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-XDG_DBUS_PROXY_VERSION = 0.1.8
+XDG_DBUS_PROXY_VERSION = 0.1.9
 XDG_DBUS_PROXY_SITE = https://github.com/flatpak/xdg-dbus-proxy/releases/download/$(XDG_DBUS_PROXY_VERSION)
 XDG_DBUS_PROXY_SOURCE = xdg-dbus-proxy-$(XDG_DBUS_PROXY_VERSION).tar.xz
 XDG_DBUS_PROXY_DEPENDENCIES = host-pkgconf libglib2
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
