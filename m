Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1081E8B36B
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 22:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 83F8F83487;
	Tue,  3 Feb 2026 22:48:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CO4WpPanPmhq; Tue,  3 Feb 2026 22:48:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7FEC582352
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770158898;
	bh=cBaMokRjBXoexW520VWQki5MDrw3C+u17rWYiIjqDN0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=XNctLynlDcs0QIyhknAvuUBMpJuXtnPPT7BAD1K6ahHY0b1NCcJNePjOQiZGs/nPl
	 Fk1cV/0uwggB3h4G0AviVJXEj2rrhO+IthicbY0+FNQh+Qb2jW7XvkeZJXwlL6Lq/B
	 uMqOuVrhLYl9l5NaUwCENrVUOJhnTO3C4gG+MqMJ8vlxB5yk2dFmd8fcC5pxB8QX8X
	 yflxSHMohRTU/yt8ZBdnnVTGyJnMKc3yEB2ehITfG17cSEypD7nDZ9xIpJ17tVQXBg
	 W+jj5YhfHZSLe4UI/k/hgON+4ZiDlXFFi8miJbOGVrIAvPVGUOfq8JO5vXR0FWKWcP
	 NY8sHZogLOIEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7FEC582352;
	Tue,  3 Feb 2026 22:48:18 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 756E4F5
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:48:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 61D9B40B58
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:48:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u5bLcUJMYU17 for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 22:48:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AAAA40857
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AAAA40857
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 22:48:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D86A867A4; Tue,  3 Feb 2026 22:48:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 23:45:01 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 995196ea5ada97a76cf05cce4556ed8284f8063c
X-Git-Newrev: 533dd663554e413fb1823697933d3f0e9a2c9bbe
X-Patchwork-Hint: ignore
Message-Id: <20260203224816.6D86A867A4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/php-lua: add support for php >= 8.5
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=533dd663554e413fb1823697933d3f0e9a2c9bbe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Our php package was recently update to 8.5 version [1] but this version
removed some old function like zend_exception_get_default() [2].
But php-lua still uses zend_exception_get_default().

Replace zend_exception_get_default() by zend_ce_exception as suggested
by php project.

[1] aedf131da66d2f2ebce64788deab07be17ce33eb
[2] https://github.com/php/php-src/commit/a812a74c2e60a0ba080057067a7634e4da3f2b9b

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797268 (TestPhpLuaLua)
https://gitlab.com/buildroot.org/buildroot/-/jobs/12944797270 (TestPhpLuaLuajit)

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/php-lua/0005-add-support-for-php-8.5.patch | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/package/php-lua/0005-add-support-for-php-8.5.patch b/package/php-lua/0005-add-support-for-php-8.5.patch
new file mode 100644
index 0000000000..de0b00995d
--- /dev/null
+++ b/package/php-lua/0005-add-support-for-php-8.5.patch
@@ -0,0 +1,34 @@
+From 2c8b642b70edf5b0602b10a25d3f04874e175276 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@smile.fr>
+Date: Mon, 2 Feb 2026 22:12:48 +0100
+Subject: [PATCH] add support for php >= 8.5
+
+php removed zend_exception_get_default() and replaced by zend_ce_exception.
+
+[1] https://github.com/php/php-src/commit/a812a74c2e60a0ba080057067a7634e4da3f2b9b
+
+Upstream: upstream dead, custom patch
+Signed-off-by: Romain Naour <romain.naour@smile.fr>
+---
+ lua.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lua.c b/lua.c
+index 5889bc7..62f8f0a 100755
+--- a/lua.c
++++ b/lua.c
+@@ -871,7 +871,11 @@ PHP_MINIT_FUNCTION(lua) {
+ 
+ 	INIT_CLASS_ENTRY(ce, "LuaException", NULL);
+ 
++#if ((PHP_MAJOR_VERSION == 5) && (PHP_MINOR_VERSION < 5)) || (PHP_MAJOR_VERSION < 5)
+ 	lua_exception_ce = zend_register_internal_class_ex(&ce, zend_exception_get_default());
++#else
++	lua_exception_ce = zend_register_internal_class_ex(&ce, zend_ce_exception);
++#endif
+ 
+ 	return SUCCESS;
+ }
+-- 
+2.52.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
