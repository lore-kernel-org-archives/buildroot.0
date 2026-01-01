Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3185EEEB57D
	for <buildroot@archiver.kernel.org>; Thu,  1 Jan 2026 09:42:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 091B040863;
	Thu,  1 Jan 2026 09:42:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AKYFLDcMjRYC; Thu,  1 Jan 2026 09:42:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 19E6140855
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1767260576;
	bh=k40A9vPFx6utWrGmtaXfgT9t3hokAQMQo9P5bPfsk7M=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hHehIVX4LQKdKpfdAw1oZJgjxAarcKsQPPeUVPz1AMxAZekpck+MMPQv9Vj2zSTBI
	 DQQLFxI2OZog+y5dmavI8bbZNPap+ZNJ6Bj3/AkuhSx5xdGZ4wjK+ADJ+PCBjOa4LX
	 YWb4krKKmBKBZRScOsLWyFJdc/C8Evfv6PcsjwL2ZkddmZ5YTTATrxbj0a04GNSfIy
	 VUFADHtl5D0Lmn2CBGR9CArVkrI0uLV17rSmr6m7IATpo0Z4Q+Ktf+Q115mrXL+G32
	 JN0YlrJeEsm6lQIe8e7HvpgsKLE81E+//r3c1w54anTtbk6lPIUKNTGVOoQoafIQ+g
	 J5rhylydTotsA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E6140855;
	Thu,  1 Jan 2026 09:42:56 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05A2D206
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D87A281498
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id etiYiPfnz6zW for <buildroot@buildroot.org>;
 Thu,  1 Jan 2026 09:42:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3132A81434
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3132A81434
 for <buildroot@buildroot.org>; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F44A878FB; Thu,  1 Jan 2026 09:42:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 1 Jan 2026 10:33:24 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a8d489a5bdae34b2084acc1de198ae80d2472059
X-Git-Newrev: 9cfcacae0f30530f345f2d3502475b35f7480a54
X-Patchwork-Hint: ignore
Message-Id: <20260101094233.2F44A878FB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-pyalsa: bump to version
 1.2.14
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

commit: https://git.buildroot.net/buildroot/commit/?id=9cfcacae0f30530f345f2d3502475b35f7480a54
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-pyalsa/python-pyalsa.hash | 4 ++--
 package/python-pyalsa/python-pyalsa.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-pyalsa/python-pyalsa.hash b/package/python-pyalsa/python-pyalsa.hash
index 206107d29a..89e50bda7f 100644
--- a/package/python-pyalsa/python-pyalsa.hash
+++ b/package/python-pyalsa/python-pyalsa.hash
@@ -1,4 +1,4 @@
 # Locally computed, after checking pgp signature from:
-# https://www.alsa-project.org/files/pub/pyalsa/pyalsa-1.2.12.tar.bz2.sig
+# https://www.alsa-project.org/files/pub/pyalsa/pyalsa-1.2.14.tar.bz2.sig
 # with key F04DF50737AC1A884C4B3D718380596DA6E59C91
-sha256  8abeaf41e5f48f617a52d1078932da89ab303d4a1d8f9919f947bdb1b7d03f50  pyalsa-1.2.12.tar.bz2
+sha256  4603736f40648684196fb826c97704c93ca80b32ec17d066b3276a9ed1a30939  pyalsa-1.2.14.tar.bz2
diff --git a/package/python-pyalsa/python-pyalsa.mk b/package/python-pyalsa/python-pyalsa.mk
index 19d2c91d23..4128ca089d 100644
--- a/package/python-pyalsa/python-pyalsa.mk
+++ b/package/python-pyalsa/python-pyalsa.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYALSA_VERSION = 1.2.12
+PYTHON_PYALSA_VERSION = 1.2.14
 PYTHON_PYALSA_SOURCE = pyalsa-$(PYTHON_PYALSA_VERSION).tar.bz2
 PYTHON_PYALSA_SITE = https://www.alsa-project.org/files/pub/pyalsa
 PYTHON_PYALSA_SETUP_TYPE = setuptools
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
