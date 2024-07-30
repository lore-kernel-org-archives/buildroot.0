Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DED3C3DA64
	for <buildroot@archiver.kernel.org>; Thu,  1 Aug 2024 20:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1E7D681F5B;
	Thu,  1 Aug 2024 20:56:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UfwA_s-W5I95; Thu,  1 Aug 2024 20:56:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6D23F81EDC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6D23F81EDC;
	Thu,  1 Aug 2024 20:56:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 462D01BF990
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 31F774029F
 for <buildroot@lists.busybox.net>; Thu,  1 Aug 2024 20:56:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4jL-YDAy_IGt for <buildroot@lists.busybox.net>;
 Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 460E940153
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 460E940153
 for <buildroot@buildroot.org>; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 310A4838A7; Thu,  1 Aug 2024 20:56:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 30 Jul 2024 23:46:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8850a30673393f1d456be0e3c1cb5e4f8cdde457
X-Git-Newrev: f376a7509577b88790fbf9ca77049c46da9a252c
X-Patchwork-Hint: ignore
Message-Id: <20240801205639.310A4838A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-cbor2: enable host build
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f376a7509577b88790fbf9ca77049c46da9a252c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This will be required for the upcoming python-uswid package.

Disable c extensions for host package to speed up build.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-cbor2/python-cbor2.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/python-cbor2/python-cbor2.mk b/package/python-cbor2/python-cbor2.mk
index 5040301867..423670047e 100644
--- a/package/python-cbor2/python-cbor2.mk
+++ b/package/python-cbor2/python-cbor2.mk
@@ -12,5 +12,8 @@ PYTHON_CBOR2_LICENSE = MIT
 PYTHON_CBOR2_LICENSE_FILES = LICENSE.txt
 PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
 PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=1
+HOST_PYTHON_CBOR2_DEPENDENCIES = host-python-setuptools-scm
+HOST_PYTHON_CBOR2_ENV = CBOR2_BUILD_C_EXTENSION=0
 
 $(eval $(python-package))
+$(eval $(host-python-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
