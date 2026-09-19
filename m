Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99CEBC982D7
	for <buildroot@archiver.kernel.org>; Sat, 19 Sep 2026 21:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0EBB440CA8;
	Sat, 19 Sep 2026 21:36:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Aoa6NYu7vkZR; Sat, 19 Sep 2026 21:36:00 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp4.osuosl.org 58A6340746
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1789853760;
	b=Smixxdf8TxszJ/cZ9jessFGNkzcO9FhUTCzI2rRl7dCGbC1OfKFJET6YnE8Tr+yihtzf
	 SGp/Mi5uWG4XdCvJ3GkdQhQDPlsd3yWbzZZbG2cyUzXv2rk/OvE7lIyfG0Im7ygrxyC8H
	 lFRDxAo8PPWnuOEjvEDep60nvTet5owKABrwQH0u9PUOymMYkODyCjhKzh2xOtn72NJzL
	 8aNMLBRcLpBjMpa7NcUInK7QpO3qNgBiGd87/SeWuOz2hxjcpWBMLydY6QQeBHXcBBW5O
	 lG7IkYnMXUVFC/3zPdouDV2EUrF3rfybjpOflUX99hAiHtsuKXwlLOgJOtZK2IAFbnA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1789853760;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 X-UI-Sender-Class:Received:To:Cc:Date:Message-ID:X-Mailer:
	 MIME-Version:X-Provags-ID:UI-OutboundReport:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=bvnHCrt/GthxwqLg3mz4KG8c8C0hCIY6skAt5UdZH3g=;
	b=ZfsQOO3+uK3Stl465vL5efDfY4csCIFBjLffu867Bk1BNDBRq47XviqteG+VCCEI15jA
	 c1w4WcY2/+M7omstl6oelW/SRSwykUIBY+NDIBdjtIKlywf2kK/IB5cNCxcSMOrUliKHU
	 bhEmRAYFdJx0AahTFWNyHm1VnzdeCGXuF08+6qHztuLWPpqwi955DAx8kOifd4sPty/96
	 uZh13nvZ/8D0eZ1+3QRhmqv1Kzk8u80qQaEhUc7r3Szzgb8k5DhSuMhcbwQnIcI4AuXtx
	 jtbzLv87iZrgjFM1jlO6ofJ+CpQXxiMWYVyEKEVDqOr+MY21ZX8Qjm7BGsEXcDb4/sQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1789853760;
	bh=bvnHCrt/GthxwqLg3mz4KG8c8C0hCIY6skAt5UdZH3g=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=aLmMtNgIaQI/0yUjlxD9UzL/KPZOUBvNRzAHqOK/j9S28QnYcbc5TQ7/Hg9JOXGuV
	 VFphAQAG9ZpHAZAiiPBhRi2ikewbUYc61oLgIVmTagWSkqpwVqNxv99kkRWXR5zKSG
	 h13aVxReqnis/olMibR9s5at8IO+SJzI2+EgZ0XIhJNyUnTzKU9q2RldgKPY9kzilu
	 QDW4/mI3V1nMKqg6keiyknLOed6PnvCfiZOcNEPgOR1lEgxJgZUcFa9GRv57Boe+0p
	 8YqexNmNToNAx+mwyfwn5glKzXWc0ijbVqBoR4f8D0g5+LRMsFoOfVk9EGD4cypnM7
	 GL/mMmri3Kg8g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58A6340746;
	Sat, 19 Sep 2026 21:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5D79E422
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4F2D681089
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tJNRtjnf6TxP for <buildroot@buildroot.org>;
 Sat, 19 Sep 2026 21:35:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 6EF5C81082
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1789853758;
 b=TNCY33cQA28Ii3kkkSJ6JclWYmME+/mfi3uZecgWAqi4QforEYnlD0PL64IOP0Ti3ZiI
 nT3qjYYxEeP6c3MQFg+V0re5uWwH/lChoLTcS+cGSdaKGqPCgLMb5TZHTJKR9NsWFRlaD
 a8qkdmzm0XXWrwCiXBMGojXFwBZQq3t36BIJigYtJFF5MSfSYwB6Y8vDrBeP7Brk+9hXQ
 8tcddLEk7XECKD68G9560y/EhwmGPNZl/59oXUqOA3A+s/tJU3kGvU38raw9Yy0mzrdtE
 kigbNEGfmwEL4eR2GofX+ymdT/Lfgj/J8ED08vt4Fgp/eg8TMCe9KAbY/h5UTfkjOWg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1789853758;
 h=Received-SPF:DKIM-Signature:X-UI-Sender-Class:Received:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:MIME-Version:
 Content-Transfer-Encoding:X-Provags-ID:X-Spam-Flag:UI-OutboundReport;
 bh=t8BW5N1YKhN+omAUEbNrILv2RG6ONEGPDcOD2baBxRk=;
 b=jAycERM8ne0t6rYG62F8uMvRa5oYNepeh34ZdLyHCEdkn1ylUc/m4BVeXYRj9NW5Qz9S
 VZsinkKOS+/lsXnqIm/AfktQZ4fflUVxrmOOG+HH1iLPXqJ6e5LJGCkYXMTJdB/uqrcTj
 Ntzhb3ykn3OMIS4ppUoGTEp+EznF/utNbGDrWq4C9qqsCgmlglfyalfPeXpblTtGNVpdN
 yxTMlowKcE/q7qSMC/8wabBZaFugl9vsYWzncuseHFHTqQZEDn5cfcodAc0CIGYkciPpK
 kplZixkOQ3FcPlJ9dk9IbQN8KYmfD821TOPSlvZJdvJ5IV4POFrgoXY5Jsfj2RwqEzw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org;
 dmarc=pass header.from=gmx.de; 
 dkim=pass header.d=gmx.de header.i=fiona.klute@gmx.de header.a=rsa-sha256
 header.s=s31663417 header.b=CIUkeh9S; 
 arc=none smtp.remote-ip=212.227.15.18
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.18;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6EF5C81082
 for <buildroot@buildroot.org>; Sat, 19 Sep 2026 21:35:56 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from client.hidden.invalid by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MRTRH-1xSl483yhJ-00M4W7; Sat, 19
 Sep 2026 23:35:54 +0200
To: buildroot@buildroot.org
Cc: Julien Olivain <ju.o@free.fr>,
 "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>
Date: Sat, 19 Sep 2026 23:35:40 +0200
Message-ID: <20260919213542.1294729-1-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:JnwQ4+Vz1QirTSe6Gk+f2hiQRuaRglomVLCEM9ZH1Lj7Nozju5j
 OQNORvMCz4at8H7cS4HyE+7XqwFrJCoqV8Wbz8SaGieWBFyulmjbHsXT7oeC/QomZf4Jkxq
 lMr5c66QNBdLdvSdYYpNnvUxtfuoFd/nUxx04RY35RJUPsfOOcfpSnuhkmbroX0yPUHLk6N
 GGIgFd7U2BIxho1uHLlRg==
UI-OutboundReport: notjunk:1;M01:P0:NIM/BeC+LZE=;Kid8EM9fb3Meepsfj0L7wt3HAuj
 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
 spMA
Subject: [Buildroot] [PATCH v3 1/3] fs/common.mk: add optional hook to build
 a verity hash tree
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: "Fiona Klute (othermo GmbH)" <fiona.klute@gmx.de>

Using dm-verity may be useful for any read-only filesystem read from a
block device, the new hook will build the required hash tree if
enabled by a per-filesystem config option.

To use this hook, the filesystem config must define a boolean option
BR2_TARGET_ROOTFS_<FS>_VERITY, and a string option
BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS. The latter option allows
users to override veritysetup defaults, e.g. to set a fixed hash
algorithm.

In the filesystem .mk file ROOTFS_<FS>_VERITY_EXTRA_ARGS must be
defined as the value of BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS
without surrounding quotes, because utils/check-symbols warns about
the _EXTRA_ARGS symbol being unused if fs/common.mk uses
$(qstrip $(BR2_TARGET_ROOTFS_$(2)_VERITY_EXTRA_ARGS)) directly.

Signed-off-by: Fiona Klute (othermo GmbH) <fiona.klute@gmx.de>
---
Changes v2 -> v3:
* require processing of BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS in
  <fs>.mk to avoid utils/check-symbols warning

Changes v1 -> v2:
* add BR2_TARGET_ROOTFS_<FS>_VERITY_EXTRA_ARGS to allow users to
  override veritysetup defaults

 fs/common.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/fs/common.mk b/fs/common.mk
index 2f3f8bcc7e..4b4a0995df 100644
--- a/fs/common.mk
+++ b/fs/common.mk
@@ -215,6 +215,15 @@ TARGETS_ROOTFS += rootfs-$(1)
 PACKAGES += $$(filter-out rootfs-%,$$(ROOTFS_$(2)_FINAL_RECURSIVE_DEPENDENCIES))
 endif
 
+ifeq ($$(BR2_TARGET_ROOTFS_$(2)_VERITY),y)
+ROOTFS_$(2)_DEPENDENCIES += host-cryptsetup
+define ROOTFS_$(2)_VERITY_FORMAT
+	@$$(call MESSAGE,"Generating verity hash tree $$(@F).verity")
+	$(HOST_DIR)/sbin/veritysetup format --root-hash-file $$@.verity.root-hash $$(ROOTFS_$(2)_VERITY_EXTRA_ARGS) $$@ $$@.verity
+endef
+ROOTFS_$(2)_POST_GEN_HOOKS += ROOTFS_$(2)_VERITY_FORMAT
+endif
+
 # Check for legacy POST_TARGETS rules
 ifneq ($$(ROOTFS_$(2)_POST_TARGETS),)
 $$(error Filesystem $(1) uses post-target rules, which are no longer supported.\
-- 
2.55.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
