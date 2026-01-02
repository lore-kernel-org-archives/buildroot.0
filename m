Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0899EFA3758
	for <buildroot@archiver.kernel.org>; Fri,  2 Jan 2026 20:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D00028176F;
	Fri,  2 Jan 2026 20:55:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dadQVbK1WdW0; Fri,  2 Jan 2026 20:55:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2E5A814B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767387308;
	bh=c3pDyaig5OArA0neDDO1Nj3RGqiJjkxOz/GIukYHxiM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=ZPCV1kSyqJpL/gI53gyFd6d+OP5QA5CYOy8dFMTiPzEcid3srl4mzVfNtdUNlc05Z
	 DrRqnlf4KZckFxg+tp0/nfRH5EHbYJMDTpXlVReGCyg4OCiRAQnOZS4JO++R6eugdF
	 Ro63THG/QF+p4/VP/2RV3wWd0BDgoGX8rN5b5+UNDU9A+4DlJxELY3OWJ0nVrRorVW
	 6uj7lIVTLoho9/ph5hObMcle0r0WwqN6lfneEwzwGwpvc90oQAM8oM+wGKLof5FgKZ
	 jWuF1gXLJlWSims609tbongbf8Dq0mm4wByK9dD6omCq5MltHoJ+/q57zRz9Iso2LW
	 ZC62TPrUTEO4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2E5A814B5;
	Fri,  2 Jan 2026 20:55:07 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B519A19D
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A761B608FD
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nSSb-aDWkxvs for <buildroot@buildroot.org>;
 Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7E9608F7
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8D7E9608F7
 for <buildroot@buildroot.org>; Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7EB2688058; Fri,  2 Jan 2026 20:55:04 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Jan 2026 21:52:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 675f31751f2683a1c36e168c3e66aba56c5cb045
X-Git-Newrev: ce8409fda58d7799463645b981043adccf4ec7a6
X-Patchwork-Hint: ignore
Message-Id: <20260102205504.7EB2688058@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pynacl: bump to version
 1.6.2
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

commit: https://git.buildroot.net/buildroot/commit/?id=ce8409fda58d7799463645b981043adccf4ec7a6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pynacl/python-pynacl.hash | 4 ++--
 package/python-pynacl/python-pynacl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pynacl/python-pynacl.hash b/package/python-pynacl/python-pynacl.hash
index de54fdeafb..0a76de10dc 100644
--- a/package/python-pynacl/python-pynacl.hash
+++ b/package/python-pynacl/python-pynacl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pynacl/json
-md5  0225d0ec3dfe729ee2a52a52ffc81d09  pynacl-1.6.1.tar.gz
-sha256  8d361dac0309f2b6ad33b349a56cd163c98430d409fa503b10b70b3ad66eaa1d  pynacl-1.6.1.tar.gz
+md5  4443a25f6c2f27fa47962a75b1ecb968  pynacl-1.6.2.tar.gz
+sha256  018494d6d696ae03c7e656e5e74cdfd8ea1326962cc401bcf018f1ed8436811c  pynacl-1.6.2.tar.gz
 # Locally computed sha256 checksums
 sha256  d3174ad63e721d4c9dccb8ad4320848992d314369bc46319720b5802c9153fe9  LICENSE
diff --git a/package/python-pynacl/python-pynacl.mk b/package/python-pynacl/python-pynacl.mk
index a3d7dd98d8..38484717f6 100644
--- a/package/python-pynacl/python-pynacl.mk
+++ b/package/python-pynacl/python-pynacl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYNACL_VERSION = 1.6.1
+PYTHON_PYNACL_VERSION = 1.6.2
 PYTHON_PYNACL_SOURCE = pynacl-$(PYTHON_PYNACL_VERSION).tar.gz
-PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/b2/46/aeca065d227e2265125aea590c9c47fbf5786128c9400ee0eb7c88931f06
+PYTHON_PYNACL_SITE = https://files.pythonhosted.org/packages/d9/9a/4019b524b03a13438637b11538c82781a5eda427394380381af8f04f467a
 PYTHON_PYNACL_LICENSE = Apache-2.0
 PYTHON_PYNACL_LICENSE_FILES = LICENSE
 PYTHON_PYNACL_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
