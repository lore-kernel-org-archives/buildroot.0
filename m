Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AADEB64D7
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 09:52:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AD1D483EE1;
	Fri, 16 Jun 2023 09:52:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AD1D483EE1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id maoqsx-IQxRq; Fri, 16 Jun 2023 09:52:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2C7E83EEB;
	Fri, 16 Jun 2023 09:52:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2C7E83EEB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5CF531BF97A
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 09:52:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3495A60AA4
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 09:52:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3495A60AA4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qBN8NrVewE7p for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 09:52:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FE9F60FCF
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 09:52:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE9F60FCF
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EE0383A8A; Fri, 16 Jun 2023 09:52:12 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 11:29:43 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 4d816fecc16bf9ba226b31ce50050899d6832ca9
X-Git-Newrev: 837561824e954a6cd28fd4274de14f7179018841
X-Patchwork-Hint: ignore
Message-Id: <20230616095212.2EE0383A8A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/python-docker:
 needs python-packaging after bump to 6.0.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=837561824e954a6cd28fd4274de14f7179018841
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

Commit d680db0ba77dab (package/python-docker: bump to version 6.0.1) forgot
to add the new dependency on python-packaging, leading to runtime errors:

  import docker
    File "/usr/lib/python3.11/site-packages/docker/__init__.py", line 2, in <module>
    File "/usr/lib/python3.11/site-packages/docker/api/__init__.py", line 2, in <module>
    File "/usr/lib/python3.11/site-packages/docker/api/client.py", line 10, in <module>
    File "/usr/lib/python3.11/site-packages/docker/auth.py", line 7, in <module>
    File "/usr/lib/python3.11/site-packages/docker/utils/__init__.py", line 3, in <module>
    File "/usr/lib/python3.11/site-packages/docker/utils/decorators.py", line 4, in <module>
    File "/usr/lib/python3.11/site-packages/docker/utils/utils.py", line 9, in <module>
  ModuleNotFoundError: No module named 'packaging'

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 1dcabece6fb8755c7a2786bde8cc75040bc3fbcb)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-docker/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/python-docker/Config.in b/package/python-docker/Config.in
index b2296f42eb..ae5a7a5181 100644
--- a/package/python-docker/Config.in
+++ b/package/python-docker/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_DOCKER
 	bool "python-docker"
 	# docker-engine may be running on another host, so no other dependency
 	select BR2_PACKAGE_PYTHON3_SSL # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
 	select BR2_PACKAGE_PYTHON_REQUESTS # runtime
 	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
