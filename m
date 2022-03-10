Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1BF8C433F5
	for <buildroot@archiver.kernel.org>; Thu, 10 Mar 2022 10:05:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8D96940B11;
	Thu, 10 Mar 2022 10:05:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id POnel9PChmVw; Thu, 10 Mar 2022 10:05:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5CA0840B05;
	Thu, 10 Mar 2022 10:05:31 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 412E41BF293
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 10:05:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30A36418E7
 for <buildroot@lists.busybox.net>; Thu, 10 Mar 2022 10:05:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=bootlin.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gjcLxjaIuLvh for <buildroot@lists.busybox.net>;
 Thu, 10 Mar 2022 10:05:03 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0546941899
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 10:05:02 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (unknown [217.70.183.196])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 43B20CCE42
 for <buildroot@buildroot.org>; Thu, 10 Mar 2022 09:56:14 +0000 (UTC)
Received: (Authenticated sender: kamel.bouhara@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 12606E0005;
 Thu, 10 Mar 2022 09:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1646906169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bigdgS0BtiKN6QQMtmQqlSo8PJyompxlLb6vUIdEX2Q=;
 b=DhlGpL/VVLeRPAKHfV5gBcZy6iAfzBa2RCpft+A1oxVarVGmRMpKfkmdaF326zrz6o1cFt
 X4TeWl2isix6sKrUGdLmbSQS2zCB8EKmKqzjRU7PURESzuOvK4cSGu6dPjdQl+oJ2bO+Eb
 I49V3lUQWYDw+odzaZ1tN0T4RWUBJJzfRHtTCCzRmJ91ClAHthPwvCH1ar43lvFrnP1QwO
 1nBCiil9tNIba3D4nS8t5/gqucFuQHityHCA7oSfh96XYxvN26KpUDyVmfw4DScX2TgmDf
 0lOjrWEsSFHjgPtEX51Hm6XPvVr7YmhiNQ9MAtnGgFW33OZFIG5YiyzZMND7RQ==
To: buildroot@buildroot.org
Date: Thu, 10 Mar 2022 10:56:02 +0100
Message-Id: <20220310095602.2435745-5-kamel.bouhara@bootlin.com>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
References: <20220310095602.2435745-1-kamel.bouhara@bootlin.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 4/4] package/odb: add dependency on
 host-libodb
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
From: Kamel Bouhara via buildroot <buildroot@buildroot.org>
Reply-To: Kamel Bouhara <kamel.bouhara@bootlin.com>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

host-odb installs the ODB compiler, which when executed at runtime,
needs access to the libodb headers. In order to have them installed,
add a dependency on host-libodb.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Kamel Bouhara <kamel.bouhara@bootlin.com>
[Kamel: Add optional host-libodb-boost dependency]
---
 package/odb/odb.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/odb/odb.mk b/package/odb/odb.mk
index 85c7ccb8bb..a234069952 100644
--- a/package/odb/odb.mk
+++ b/package/odb/odb.mk
@@ -10,7 +10,13 @@ ODB_SOURCE = odb-$(ODB_VERSION).tar.bz2
 ODB_SITE = https://www.codesynthesis.com/download/odb/$(ODB_VERSION_MAJOR)
 ODB_LICENSE = GPL-3.0
 ODB_LICENSE_FILES = LICENSE
-HOST_ODB_DEPENDENCIES = host-libcutl
+# host-libodb is not needed to build host-odb, but it is needed to use
+# the ODB compiler, as it install header files that are needed at
+# runtime by the odb compiler.
+HOST_ODB_DEPENDENCIES = host-libcutl host-libodb
+ifeq ($(BR2_PACKAGE_LIBODB_BOOST),y)
+HOST_ODB_DEPENDENCIES += host-libodb-boost
+endif
 HOST_ODB_CONF_ENV = CXXFLAGS="$(HOST_CXXFLAGS) -std=c++11"
 
 # Prevent odb from trying to install the gcc plugin into the hosts
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
