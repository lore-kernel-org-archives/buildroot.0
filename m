Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17350C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D324D611BF
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 14:22:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D324D611BF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 256E540830;
	Sat, 11 Sep 2021 14:22:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6MJBXtL3uDl0; Sat, 11 Sep 2021 14:22:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0BB8C406BA;
	Sat, 11 Sep 2021 14:22:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 00B5B1BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F17C961BDA
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id k4MLIZWoY-JK for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5CB05607FD
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 14:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 3E01789019; Sat, 11 Sep 2021 14:20:32 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 16:17:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 36be5e230559bd9e9b78dc6f38419b950572f38c
X-Git-Newrev: 30ed82827c7862f4763d8f63723690f9e40aade6
X-Patchwork-Hint: ignore
Message-Id: <20210911142032.3E01789019@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libiio: fix python build
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=30ed82827c7862f4763d8f63723690f9e40aade6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

python bindings needs setuptools since bump to version 0.23 in commit
50b6d7d69f880e940d7c281c493a6a6694d6ebe3 and
https://github.com/analogdevicesinc/libiio/commit/21023a538b125dee966bf496dcad019ee20967bd

Fixes:
 - http://autobuild.buildroot.org/results/a26cce9760c75c44ebdcf21dfb4a69aad5702de4

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libiio/libiio.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/libiio/libiio.mk b/package/libiio/libiio.mk
index b36ea3bafe..4ce933a0cd 100644
--- a/package/libiio/libiio.mk
+++ b/package/libiio/libiio.mk
@@ -69,9 +69,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBIIO_BINDINGS_PYTHON),y)
 ifeq ($(BR2_PACKAGE_PYTHON),y)
-LIBIIO_DEPENDENCIES += python
+LIBIIO_DEPENDENCIES += host-python-setuptools python
 else ifeq ($(BR2_PACKAGE_PYTHON3),y)
-LIBIIO_DEPENDENCIES += python3
+LIBIIO_DEPENDENCIES += host-python3-setuptools python3
 endif
 LIBIIO_CONF_OPTS += -DPYTHON_BINDINGS=ON
 else
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
