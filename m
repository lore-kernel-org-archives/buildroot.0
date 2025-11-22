Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ABECCFC536
	for <buildroot@archiver.kernel.org>; Sat, 22 Nov 2025 13:37:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C263C84E46;
	Sat, 22 Nov 2025 13:37:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ft9vb7zx2qU4; Sat, 22 Nov 2025 13:37:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EA9F384E47
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA9F384E47;
	Sat, 22 Nov 2025 13:37:09 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BEAC734E
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:37:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5C7560A80
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:37:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zxdo2OzqzDCP for <buildroot@buildroot.org>;
 Sat, 22 Nov 2025 13:37:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E0EDA60647
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E0EDA60647
 for <buildroot@buildroot.org>; Sat, 22 Nov 2025 13:37:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D9B2A85CC8; Sat, 22 Nov 2025 13:37:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 22 Nov 2025 14:29:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6e8686912256971f27eee6dcb2908617d365e145
X-Git-Newrev: ce861801c08da9f639d1d64d807ec7e3ece838fd
X-Patchwork-Hint: ignore
Message-Id: <20251122133706.D9B2A85CC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] python-flask-restx: re-add dependency to
 BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce861801c08da9f639d1d64d807ec7e3ece838fd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit 2ecb2d2847701795d384ee9e4eaeb0669dcc2bef removed the
dependency to BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS while still
selecting packages which depend on it:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_JSONSCHEMA
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]

WARNING: unmet direct dependencies detected for BR2_PACKAGE_PYTHON_REFERENCING
  Depends on [n]: BR2_PACKAGE_PYTHON3 [=y] && BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_PYTHON_FLASK_RESTX [=y] && BR2_PACKAGE_PYTHON3 [=y]

Seen with defconfig:
https://autobuild.buildroot.org/results/ebf9a81f7e225ecdab20bbad8ad8daa136fddb46/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/python-flask-restx/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-flask-restx/Config.in b/package/python-flask-restx/Config.in
index c98dd74d5b..efae7a0aeb 100644
--- a/package/python-flask-restx/Config.in
+++ b/package/python-flask-restx/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_FLASK_RESTX
 	bool "python-flask-restx"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-jsonschema, python-referencing -> python-rpds-py
 	select BR2_PACKAGE_PYTHON_ANISO8601 # runtime
 	select BR2_PACKAGE_PYTHON_FLASK # runtime
 	select BR2_PACKAGE_PYTHON_JSONSCHEMA # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
