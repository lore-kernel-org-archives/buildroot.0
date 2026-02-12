Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C420EF99D0
	for <buildroot@archiver.kernel.org>; Fri, 13 Feb 2026 19:36:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 486E061417;
	Fri, 13 Feb 2026 19:36:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VoVWKwu_wDiY; Fri, 13 Feb 2026 19:36:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0DA34613FB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1771011363;
	bh=SMp7PgXX+lpKTYEjAzm+ElQDRmeQX8gAEYnQug26/3Q=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Y9AzJ+gztRidt8SD0upKeXKWMBxQZklnhO6iIGJsM9pPHY7o5PVpkQzPvy1ZKsXlj
	 KGLMGoKosjwV69+ctU+B15E6YzQlzKzvzEIIv8kt+jvu7uIfqgG+MVsPOyo6L7+cP5
	 rE7P6+MzxggH7QZnuICZG5JRHZErGjg8b7aOdtpGtC888LCvPT2aiqrATLPgiMDaoH
	 n+zCgUWcCcHP1/HORxh5PRhr/Plk0co8HZQmwVpfMIUdlBQwFd5k2f5Qsdkvm0HEcg
	 iNsb71kJaEifSEhMnkIUsULzqkkiVY7xuKdWGHpsBA93PW2LQZ8Hl7tp4RlMyWNriP
	 43amapXZAa2bg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0DA34613FB;
	Fri, 13 Feb 2026 19:36:03 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 9696BEC
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7710D40407
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OLybEdHt5_Ug for <buildroot@buildroot.org>;
 Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AA07741280
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id AA07741280
 for <buildroot@buildroot.org>; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9F1A381EB5; Fri, 13 Feb 2026 19:35:28 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 12 Feb 2026 15:04:55 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: f64ce221a5e4b502f8fd29a233b07e72ec98944c
X-Git-Newrev: afb87a21422d6c9846c10dfb333c6d343ed247da
X-Patchwork-Hint: ignore
Message-Id: <20260213193528.9F1A381EB5@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/util-linux:
 always disable man pages and translations
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/afb87a21422d6c9846c10dfb333c6d343ed247da
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

When the host system has asciidoctor and po4a/poman installed,
util-linux detect them and automatically enable manual pages and
their translations. This can significantly increase the package
build time (in my case, from 20s to 1m50s). See upstream
commit [1] and [2].

Since manual pages are not needed in Buildroot, this commit adds in
_CONF_OPTS for host host and target variants the options to always
disable the detection of those programs (--disable-asciidoc
--disable-poman). This will always disable the generation of manual
pages.

Note: Buildroot attempts to globally disable documentation for
autotools packages by passing various --disable-docs configure
options (see [3]), but those are not recognized by util-linux.

This commit also reorder the options for UTIL_LINUX_CONF_OPTS.

[1] https://github.com/util-linux/util-linux/commit/9acfc349e0ea68a92baf818cc659121f40ab9c04
[2] https://github.com/util-linux/util-linux/commit/236421a49103ea510bcba1e7ef90b57d24aeab76
[3] https://gitlab.com/buildroot.org/buildroot/-/blob/2025.11/package/pkg-autotools.mk#L184-186

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
(cherry picked from commit dd81c1766e1470b61f5e8d4461a066f64ce60c5e)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/util-linux/util-linux.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/util-linux/util-linux.mk b/package/util-linux/util-linux.mk
index ed30c0b107..763d3872be 100644
--- a/package/util-linux/util-linux.mk
+++ b/package/util-linux/util-linux.mk
@@ -46,8 +46,10 @@ UTIL_LINUX_DEPENDENCIES = \
 # system is not Y2038 compliant. util-linux will support year2038 if
 # the system is compliant even with this option passed
 UTIL_LINUX_CONF_OPTS += \
-	--disable-rpath \
+	--disable-asciidoc \
 	--disable-makeinstall-chown \
+	--disable-poman \
+	--disable-rpath \
 	--disable-year2038
 
 UTIL_LINUX_LINK_LIBS = $(TARGET_NLS_LIBS)
@@ -56,6 +58,8 @@ HOST_UTIL_LINUX_DEPENDENCIES = host-pkgconf
 
 # We also don't want the host-python dependency
 HOST_UTIL_LINUX_CONF_OPTS = \
+	--disable-asciidoc \
+	--disable-poman \
 	--without-systemd \
 	--with-systemdsystemunitdir=no \
 	--without-python
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
