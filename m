Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDFEE83065
	for <buildroot@archiver.kernel.org>; Tue,  3 Feb 2026 09:10:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B746E60DE2;
	Tue,  3 Feb 2026 09:10:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m9Me6H0hNGpb; Tue,  3 Feb 2026 09:10:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F02D60DCE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1770109814;
	bh=85VxGUb3JbfvUGc/TgI5cue0ENf1Fq2UmN9qCMnyP+g=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Mr/Pj/fL5fBQ3CHX9enjRVOAVcj7aIz5wMXXtFcGjPVgdPze1HbE3KzJXB4GgNM4S
	 t9X3xtw8SEGk3gi3/IDdhu897EV4+1cvUgyQYwXsScnQTpiW0mXu2BKtyFZhM72vu+
	 +gFwfBAv9D7eYC4W2gSHeK4OFHCuGpwi621ogWK1/OfFkPzn12ZQgm5pE8RnT2zcI3
	 2mLxOg1ADvI0O1F2SvAsTbt3iNav+iKNnJW4EOWgTbjY4GF6962EwMFAyCI7OhoIKI
	 mpoAFzTLygt9IZ4FK4AWf1yWYTVCkQON/5+6OmnmX2S0TJjThjI8BJs5oQM4V/0LB1
	 O00aRCjx8IYrw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F02D60DCE;
	Tue,  3 Feb 2026 09:10:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C1D3EF4
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A4A8B40B9F
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UH9u1-NOBBaM for <buildroot@buildroot.org>;
 Tue,  3 Feb 2026 09:10:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D743940439
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D743940439
 for <buildroot@buildroot.org>; Tue,  3 Feb 2026 09:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6A36865B3; Tue,  3 Feb 2026 09:10:09 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Feb 2026 10:09:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e258607bc9dcc87ffb85e5679d2628967a8deeff
X-Git-Newrev: 5bfea99b11e34862f1527bd9d823c580fab5a66d
X-Patchwork-Hint: ignore
Message-Id: <20260203091009.C6A36865B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python3: add optional zstd support
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

commit: https://git.buildroot.net/buildroot/commit/?id=5bfea99b11e34862f1527bd9d823c580fab5a66d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Python 3.14 introduced a new zstd module [1][2] that requires zstd
package as dependency.

Packages that requires this new module should select
BR2_PACKAGE_PYTHON3_ZSTD.

[1] https://docs.python.org/3.14/library/compression.zstd.html
[2] https://peps.python.org/pep-0784/

Signed-off-by: Romain Naour <romain.naour@smile.fr>
[Julien: change link [1] to use 3.14 specific version]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python3/Config.in  | 6 ++++++
 package/python3/python3.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/python3/Config.in b/package/python3/Config.in
index cfc08bad86..423e5daabb 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -127,6 +127,12 @@ config BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  zlib support in Python3
 
+config BR2_PACKAGE_PYTHON3_ZSTD
+	bool "zstd module"
+	select BR2_PACKAGE_ZSTD
+	help
+	  zstd support in Python3
+
 endmenu
 
 endif
diff --git a/package/python3/python3.mk b/package/python3/python3.mk
index 31b5a4500e..8195f4fd83 100644
--- a/package/python3/python3.mk
+++ b/package/python3/python3.mk
@@ -170,6 +170,12 @@ else
 PYTHON3_CONF_ENV += py_cv_module_zlib=n/a
 endif
 
+ifeq ($(BR2_PACKAGE_PYTHON3_ZSTD),y)
+PYTHON3_DEPENDENCIES += zstd
+else
+PYTHON3_CONF_ENV += py_cv_module__zstd=n/a
+endif
+
 ifneq ($(BR2_PACKAGE_PYTHON3_OSSAUDIODEV),y)
 PYTHON3_CONF_ENV += py_cv_module_ossaudiodev=n/a
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
