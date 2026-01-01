Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 594CBEEB57E
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:43:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 236B481EBB;
	Thu,  1 Jan 2026 09:43:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O4OBF1ehmFBb; Thu,  1 Jan 2026 09:43:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4C2C181EB4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260584;
	bh=AfwDMgW6jI+MtnGXHMgu6qSh/mCXr/VdRi+MVy4wjEg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Gwh9/3rt1xKZaGtlORNLbIY1V7W2QW0Y8yRuPcDEqp3ppwAu3zrRJv0EIT5x5uaJL
	 7UmADRN8u093r7nSneN0s9sLCGj+PeAQnOFox/vdaYE/LiSw+I6gxjbs7XvAYWQZYz
	 nqYLghRfl42/2twjhICzJTkx5cu0smYA75feMjBQ/RpspShoQWsop9sEJOTf2bTLRu
	 TOxCbFdm8/nHkr3teWnfjjDQljKtn+r9YhHWE3tFlPS6K/TPmDTbga+K4pwbm/gJSj
	 /4v0XrYzSiMOKZyfI4XSAj/IlqAN2J9rxUcjSF9bwEzKzJ1JvOq6BIH0nsv85rnKJE
	 rSLVT4jOyn95A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4C2C181EB4;
	Thu,  1 Jan 2026 09:43:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 0FEA6351
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9FD58150C
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cpcCNJpiXWj2 for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7480E815C1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7480E815C1
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7373886FB6; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:42 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 02e6d7b60ff3db0461552c3cb51ef69010f6c2f2
X-Git-Newrev: fa7d482ffbaf760a873737179a1a86cc26c85622
X-Patchwork-Hint: ignore
Message-Id: <20260101094233.7373886FB6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pbr: bump to version 7.0.3
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fa7d482ffbaf760a873737179a1a86cc26c85622
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pbr/python-pbr.hash | 4 ++--
 package/python-pbr/python-pbr.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pbr/python-pbr.hash b/package/python-pbr/python-pbr.hash
index 58503eaf11..797e4ce94f 100644
--- a/package/python-pbr/python-pbr.hash
+++ b/package/python-pbr/python-pbr.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pbr/json
-md5  64cd498740ec05994ef0592c73c351c5  pbr-7.0.1.tar.gz
-sha256  3ecbcb11d2b8551588ec816b3756b1eb4394186c3b689b17e04850dfc20f7e57  pbr-7.0.1.tar.gz
+md5  5e6b4341677c4d330637add000f59fdc  pbr-7.0.3.tar.gz
+sha256  b46004ec30a5324672683ec848aed9e8fc500b0d261d40a3229c2d2bbfcedc29  pbr-7.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  5df2a0d87d6c562f0ea11c688ac52532aa28d744cabc7994ff0537f64b3b3320  LICENSE
 sha256  eb4a8c8791f6caab1cf36df26db2b6f4e2ddda52657b060ff7f02abc63910aef  pbr/tests/testpackage/LICENSE.txt
diff --git a/package/python-pbr/python-pbr.mk b/package/python-pbr/python-pbr.mk
index ec530ded04..9b3d34c4e8 100644
--- a/package/python-pbr/python-pbr.mk
+++ b/package/python-pbr/python-pbr.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PBR_VERSION = 7.0.1
+PYTHON_PBR_VERSION = 7.0.3
 PYTHON_PBR_SOURCE = pbr-$(PYTHON_PBR_VERSION).tar.gz
-PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/ad/8d/23253ab92d4731eb34383a69b39568ca63a1685bec1e9946e91a32fc87ad
+PYTHON_PBR_SITE = https://files.pythonhosted.org/packages/5e/ab/1de9a4f730edde1bdbbc2b8d19f8fa326f036b4f18b2f72cfbea7dc53c26
 PYTHON_PBR_SETUP_TYPE = setuptools
 PYTHON_PBR_LICENSE = Apache-2.0 (module), BSD-3-Clause (test package)
 PYTHON_PBR_LICENSE_FILES = LICENSE pbr/tests/testpackage/LICENSE.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
