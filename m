Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A6210ED640
	for <buildroot@archiver.kernel.org>; Fri, 27 Mar 2026 10:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EA90F612E0;
	Fri, 27 Mar 2026 10:01:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JwdmaHEJb72b; Fri, 27 Mar 2026 10:01:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C78DC6132B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1774605713;
	bh=MMGhFALugCeL9Tba2T1t0t3PZwKPtU/dkz818ahWcjg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=mE9o4JabrJGjUI4wEg6F6pB47KT+38kj4flLGgKM+8Ztj+Pj7T6U+RmQqayTaHH4A
	 dyhViHwSkBjilqpxEEGK8NfdQnDMpmV6VplxpQAjicYapZOZRYfvvfkzqQNhJd55ZB
	 gH0+UJy/xCzXNzkabSdVYLd4uvalrvJq9D9AKSbx7tsOjpu5TnZus/kFemgqO3Ia1M
	 xnlRVDSchfDUmWOTf6DDc3jTi6l0jP57tbQwt/DtFGi4av+Q789c9OE/ssDl3wmUyC
	 2jwtvkJQWshw4nn2L00N4Foi6xwZ+e5ZNrT3bGWJMTrxFR9iGSeY791L6jiT4eBQZR
	 brzOdCaiIUn/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C78DC6132B;
	Fri, 27 Mar 2026 10:01:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 315C8249
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CDF9340BD7
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HlMr2CU9sWWW for <buildroot@buildroot.org>;
 Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 273F640BDC
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 273F640BDC
 for <buildroot@buildroot.org>; Fri, 27 Mar 2026 10:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A4787FBBB; Fri, 27 Mar 2026 10:01:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 26 Mar 2026 17:07:50 +0100
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: 955a57bda71a5761f23040a5114cce7ca1811f35
X-Git-Newrev: e0772388533ba6cb26b0e515115878f42690c51e
X-Patchwork-Hint: ignore
Message-Id: <20260327100141.7A4787FBBB@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x] DEVELOPERS: add Manuel
 Diener to several packages
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e0772388533ba6cb26b0e515115878f42690c51e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

Add myself to packages recently orphaned which I am going to continue.

Signed-off-by: Manuel Diener <manuel.diener@oss.othermo.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit de7bd5034b38b69c631b1d1a3299942513051267)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 DEVELOPERS | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index e1fcfa6c26..2c96a612e9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2204,6 +2204,29 @@ F:	package/ffmpeg/
 F:	package/mpv/
 F:	package/rpi-firmware/
 
+N:	Manuel Diener <manuel.diener@oss.othermo.de>
+F:	package/pico-sdk/
+F:	package/picotool/
+F:	package/python-annotated-doc/
+F:	package/python-apscheduler/
+F:	package/python-crc/
+F:	package/python-diskcache/
+F:	package/python-django/
+F:	package/python-gpiod/
+F:	package/python-immutabledict/
+F:	package/python-jc/
+F:	package/python-log-rate-limit/
+F:	package/python-pydantic/
+F:	package/python-pydantic-core/
+F:	package/python-pydantic-settings/
+F:	package/python-typing-inspection/
+F:	package/python-tzlocal/
+F:	package/python-sdbus-modemmanager/
+F:	package/python-sdbus-systemd/
+F:	package/python-varlink/
+F:	package/python-waitress/
+F:	package/python-whitenoise/
+
 N:	Marcin Bis <marcin@bis.org.pl>
 F:	package/bluez5_utils/
 F:	package/cc-tool/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
