Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D292C001B0
	for <buildroot@archiver.kernel.org>; Sat, 15 Jul 2023 15:09:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 44D9660E84;
	Sat, 15 Jul 2023 15:09:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 44D9660E84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 09kgN2h7MPlQ; Sat, 15 Jul 2023 15:09:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6E6E360DFF;
	Sat, 15 Jul 2023 15:09:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6E6E360DFF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 60E9F1BF408
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4798881285
 for <buildroot@lists.busybox.net>; Sat, 15 Jul 2023 15:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4798881285
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLTK1x1kOhvM for <buildroot@lists.busybox.net>;
 Sat, 15 Jul 2023 15:08:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5838480BC7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5838480BC7
 for <buildroot@buildroot.org>; Sat, 15 Jul 2023 15:08:44 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0896.dip0.t-ipconnect.de [91.58.8.150])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 01DF8A4C0FE0;
 Sat, 15 Jul 2023 17:05:38 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41982)
 by fli4l.lan.fli4l with esmtp (Exim 4.96)
 (envelope-from <bernd@kuhls.net>) id 1qKgq1-0002tE-2y;
 Sat, 15 Jul 2023 17:05:37 +0200
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 15 Jul 2023 17:05:32 +0200
Message-Id: <20230715150536.2959313-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230715150536.2959313-1-bernd@kuhls.net>
References: <20230715150536.2959313-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202306131828; t=1689433538;
 bh=+sGiv8Igphy5aplHjq4R2lLcIa0u+repDH/3sNAdMDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=VCQw4/hoKcmK0R/v1RLOrjcM6Csh2gfLexVpOAz2sEFYX6oTti5njsLyJF/dp/xkn
 lSZ8HzmizAdpLK9uF8g0V6W1xFbBCVnsFEHNkSGnhmQmtmHVpbvVO0Lx6bCpsP7jHA
 fPWnjkRXcglJeTQz+0h0YARSax3WQ5uNBo1/2yM0pBxXZP/1zqssM7kPjBc1tZv6Pp
 D1Dkmxt49aQV7RiG80GR99XevFN1lG0lxZtjZb/d9I71CFxnrp7aIiROsRbKC7eWMz
 AVPYg0Y8Vf1iwneVYSHhGMMQseJ5Cp7S3tN6fQWKJtNAUaJDv8R64PoUsa3ybebc5z
 6iEjORtfW79Sg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202306131828 header.b=VCQw4/ho
Subject: [Buildroot] [PATCH 16/20] package/erlang-p1-yaml: bump version to
 1.0.36
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
Cc: Will Newton <will.newton@gmail.com>,
 Johan Oudinet <johan.oudinet@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog:
https://github.com/processone/fast_yaml/blob/master/CHANGELOG.md
[1.0.36 just updated a github workflow file]

Removed paths added by upstream
https://github.com/processone/fast_yaml/commit/de7687901d1c89b9b03dcfb5a44d1af5edb2d95c
which break cross-builds.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/erlang-p1-yaml/erlang-p1-yaml.hash | 2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk   | 9 ++++++++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.hash b/package/erlang-p1-yaml/erlang-p1-yaml.hash
index 89123dfd83..0138f82047 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.hash
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  6d5c823dd895b736b98325d88893a63c054964d7bde9a8e150fc4df5f4165065  erlang-p1-yaml-1.0.32.tar.gz
+sha256  6794470ef35fb3985c4e9aa0ed8d3a0b44e7a5c7bf4c5a1efbeca42060db6806  erlang-p1-yaml-1.0.36.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE.txt
diff --git a/package/erlang-p1-yaml/erlang-p1-yaml.mk b/package/erlang-p1-yaml/erlang-p1-yaml.mk
index 6acb6fe059..17f4910ee1 100644
--- a/package/erlang-p1-yaml/erlang-p1-yaml.mk
+++ b/package/erlang-p1-yaml/erlang-p1-yaml.mk
@@ -4,10 +4,17 @@
 #
 ################################################################################
 
-ERLANG_P1_YAML_VERSION = 1.0.32
+ERLANG_P1_YAML_VERSION = 1.0.36
 ERLANG_P1_YAML_SITE = $(call github,processone,fast_yaml,$(ERLANG_P1_YAML_VERSION))
 ERLANG_P1_YAML_LICENSE = Apache-2.0
 ERLANG_P1_YAML_LICENSE_FILES = LICENSE.txt
 ERLANG_P1_YAML_DEPENDENCIES = libyaml erlang-p1-utils
 
+define ERLANG_P1_YAML_REMOVE_PATHS
+	$(SED) "s/ -I\/usr\/local\/include//" $(@D)/rebar.config
+	$(SED) "s/ -L\/usr\/local\/lib//" $(@D)/rebar.config
+endef
+
+ERLANG_P1_YAML_POST_PATCH_HOOKS = ERLANG_P1_YAML_REMOVE_PATHS
+
 $(eval $(rebar-package))
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
