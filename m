Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C918CA5FEC
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 15:55:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F7081568;
	Sat,  3 Oct 2026 15:55:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ezF7gbo8pus9; Sat,  3 Oct 2026 15:55:57 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 3826A8156F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791042957;
	b=N0yquRIKOaVordMwo77eQKIOAx6p2TR8OU/NfN0/i0h/b+OeLKmzXSU5Ievd7UWIgKtT
	 ykCr2NNlGbknWXHyGgFtzakhwz0e8sJzqQWVqBDxvtV0XY1uMdswjsZTCcPstYRu97eTz
	 QdcR56/ZBCW+lwJG8mmLafFBCePWb19XUiMLEzy+Kc1+T9eFLOVu8gtgjbEXhhEFJtefK
	 IS4jRMGFhSFQIVQbltRu0DwaEaXQql8WoN5DWqjfxnBVaIDwkHAcAUtBpTykoA0mDvfhY
	 Sj5nkzzKP5Mn//RDrZq52FBJLG+L+57w18EzCeyJoF6PgmAuGsRL08OwS4wuCgc1kZA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791042957;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=LOI6f/EKrrlLfL4TkhAoqdGj++ddegLdlYNSUgFGWfQ=;
	b=MvvJ/HM/RgvlygZexfdt9CMRgKWOhrAEUo85v290YN2VOhH9fDadHecYLWGgU6FqyssT
	 xGsPM6YU0DlZPjdDHaJk3lGAldG4A36vmh1sy5kffla+68vpJpYtvNyvCLoNpOeh7ifeb
	 2ldIz5dFCsXdv6wW0Qa3Olw7FRbuM27QKB5tGzsQiOG37DzNMXNWCxg7eoB4KcphLpOzY
	 CUXCpI2/PVWBeENqZVnBvw9cg24mRl0/oIKVdXJzkuc165F3GzdVVlo6fohBeKCK+yxJP
	 v2efyi39CQ8LQsgu4b6IXI3WqbBkJe86R6A3ib8B44ceKaiyOGbPy/fW70zOxvgL2CA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791042957;
	bh=LOI6f/EKrrlLfL4TkhAoqdGj++ddegLdlYNSUgFGWfQ=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XcXIerLo02OLd8O5xPUwe3+bGBX3f/ZlC2u+910O7Bj638joU3ZJfAef333aD4TTa
	 YxHC17A+QlI7qvaZnUPtoFz/DlOMmkWmVRgtD9qvU30dToi9fufLT9YwVtndns0krG
	 NYr/sEItUvSD/Tg2tnGw/nzAe8ptiKJM1kl1OhdCA4bt6PRYQvSQIeHHGnWqllcHFy
	 4P4XcqvNnmWUcz9cpL10n2EXPHVYNbfNKHIEjTdhbuB5OfXw7WcIg2mvisQlQJGV+W
	 AsKVvMbs2LfB9fUrdHwQcUKXo5/QB+YgcUrQRhuGblSDbe+RCJnG0SkqCWu/mVZ3P8
	 gyxkBRWUoFCMQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3826A8156F;
	Sat,  3 Oct 2026 15:55:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 29B76335
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DC3B6606B1
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2IdzZHG-UH_O for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 15:54:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp3.osuosl.org A8FDF606AE
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791042845;
 b=H8BOTCG8KNkUiWDxc6XB64CpZrmM8JPLV0A7/uTT8a6go8wBXUOoQWy/BEV2gJXpV8al
 jRhO0gMOkSLSlRJujzQAroGiDxjdAEJlVNPnEwtZ6BXI+vq5S8GHaNN+nE95EPpr1KdYv
 dXyw6SX81AxNaHhJ1sI0tZvtF2i4BjFnYaHvfvBxSFRxCrQDYYHeQFEiflK+gKSZRhLOV
 1qYinW/mV4Ge06CpiRFTazSo0O8besUK/VRP9sKY6/gotC5jEBYhQWYGBYEmnXUzk5IMU
 lq4sPrpzZuEdxkVgfzUTpLqRazjh/+yInikis4tnlpTvwBsINnLSCK+ocusrvSPqF8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791042845;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=9KigyFgmew4mNnFNHtZ3gSV06hTDyFvV8zv2uZxjb24=;
 b=gOZZ5fhI3dj8VqLZWJoG9vAau1JQ0YWuxj47SWdbTfCuAEqvTl1FJLlB7NEFdG+P4hQs
 soPZKkw/Ki9YpifjmyrNOr3IKJm02eEoDHWKByEZsvGrTnOOWF3mY21dihLjROqkLL5G3
 yUzrB9Q6zl8JiR0beZAaAEUnm1R2pdn3hDJkJDFq6Jo7TLOva8aQuQ601Rlg44ZQyI3CZ
 OL0fnQztxn1hzm029i/bhKKNi27HB4ul5VpMdnqIPjyiRowHzFGQlPkYf5gTQTu1zP694
 FQ5RZ2XJcXYmIzb4r111WMW8PFGPugvBZi9F9rDAPy9VldRmdFHHc8OwfbvJlNJAShw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org;
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id A8FDF606AE
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 15:54:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA761886D0; Sat,  3 Oct 2026 15:52:50 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 3 Oct 2026 17:43:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 690a8eb266d79436f60c0cc2d70970d5d42786ac
X-Git-Newrev: 38fb68732c0a7a586893e29831b6f6847138e536
X-Patchwork-Hint: ignore
Message-Id: <20261003155250.EA761886D0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/python-traitlets: bump version to
 5.16.1
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38fb68732c0a7a586893e29831b6f6847138e536
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>
Cc: James Hilliard <james.hilliard1@gmail.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/python-traitlets/python-traitlets.hash | 4 ++--
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 56fc569436..215eb344c9 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5  f6e6529cca4cbe3299e3f07ce24d3fdc  traitlets-5.14.3.tar.gz
-sha256  9ed0579d3502c94b4b3732ac120375cda96f923114522847de4b3bb98b96b6b7  traitlets-5.14.3.tar.gz
+md5  bbf948ab08b87c41b51e3aeefbf7d110  traitlets-5.16.1.tar.gz
+sha256  ed900c2b631aa3a112811139fa97b8d2c3bad5e989656bba4b7e52c7852c18c1  traitlets-5.16.1.tar.gz
 # Locally computed sha256 checksums
 sha256  2f51727d9063b54856773cb51388bdb79f2936ee4a1b692ef553d8c4201311ab  LICENSE
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index f0f99e3dfb..b40b23a5ff 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 5.14.3
+PYTHON_TRAITLETS_VERSION = 5.16.1
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/eb/79/72064e6a701c2183016abbbfedaba506d81e30e232a68c9f0d6f6fcd1574
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/2c/2e/a7fbfe268c8a3b32546930c0297c101d65a4a14c304ad5790a9f478f0e4e
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = LICENSE
 PYTHON_TRAITLETS_SETUP_TYPE = hatch
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
