Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 724F5EB64DA
	for <buildroot@archiver.kernel.org>; Fri, 16 Jun 2023 09:31:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21C7E83F4B;
	Fri, 16 Jun 2023 09:31:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21C7E83F4B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PUb8yE5AFDRG; Fri, 16 Jun 2023 09:31:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C92083F9E;
	Fri, 16 Jun 2023 09:31:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3C92083F9E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 499021BF2F6
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 09:31:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A53840181
 for <buildroot@lists.busybox.net>; Fri, 16 Jun 2023 09:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2A53840181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1u8dP5GynPvL for <buildroot@lists.busybox.net>;
 Fri, 16 Jun 2023 09:31:16 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4528F40B2E
 for <buildroot@buildroot.org>; Fri, 16 Jun 2023 09:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4528F40B2E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3405983A36; Fri, 16 Jun 2023 09:31:16 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 16 Jun 2023 11:29:54 +0200
X-Git-Refname: refs/heads/2023.05.x
X-Git-Oldrev: 6e89b3838638f0f2852b3a028849255236c3c1ec
X-Git-Newrev: d918568a15cc00a0c718a475b6c755fcdc8e0d1e
X-Patchwork-Hint: ignore
Message-Id: <20230616093116.3405983A36@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.05.x] package/python-docker:
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

commit: https://git.buildroot.net/buildroot/commit/?id=d918568a15cc00a0c718a475b6c755fcdc8e0d1e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.05.x

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
