Return-Path: <SRS0=hSOo=MZ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F101C4338F
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 10:04:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A3CD60F41
	for <buildroot@archiver.kernel.org>; Mon,  2 Aug 2021 10:04:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A3CD60F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=green-communications.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6326080D;
	Mon,  2 Aug 2021 10:04:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DlQUhjA0tyOL; Mon,  2 Aug 2021 10:04:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BDA816080A;
	Mon,  2 Aug 2021 10:04:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 13C701BF396
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 10:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 014CB4029A
 for <buildroot@lists.busybox.net>; Mon,  2 Aug 2021 10:04:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O0Tj_k0bXQ4O for <buildroot@lists.busybox.net>;
 Mon,  2 Aug 2021 10:04:38 +0000 (UTC)
X-Greylist: delayed 00:07:36 by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5FC7940270
 for <buildroot@buildroot.org>; Mon,  2 Aug 2021 10:04:38 +0000 (UTC)
Received: from houde.tangerine ([141.98.255.145]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.184]) with ESMTPSA (Nemesis) id
 1N3sVq-1n9ux9133Y-00zrls; Mon, 02 Aug 2021 11:51:55 +0200
From: Thomas Claveirole <thomas.claveirole@green-communications.fr>
To: buildroot@buildroot.org
Date: Mon,  2 Aug 2021 11:51:42 +0200
Message-Id: <20210802095142.281076-1-thomas.claveirole@green-communications.fr>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:6HneldHOkhgBJj9ZcD+PJbBlPsH5XZYB/mUWgLg/kW9wbue82RT
 MzAjHVcoFlEIE/2o85aDKYWe7rqS+yGsv4ki+1wcsinsgUq02ODdsDb4tJ1JmpyiCqITAhd
 zOPOGI397bZvPv8IWF2npCnKc4nqBfnpXfa9KTLSRI2kUUuSmmqrKo1HlXYuxUtTq0c4hYS
 0Wxgb4YLFK8DyYcSYdGVA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:m4H8Rh4oqv0=:qCwAoiZRvaHuoo8UAlXHUE
 HL5N25HKzEzPzjrALfR02OBFqI6X9gIgtdAt2YHCKFUKveFcCQmRBN5AzPuIEYsLxdxa33JlO
 Iyh7v0RiyvWHbdQgXUyWi0we8TiQAEl9+bi9yXtprcAB+NRzJJl/58MzoaWo+ucjEwLy76UYo
 fBVnm1PRNiE+55T9N9EiM+StEngPTW5UI38pCOtqyfOQ3J2NyUZhc8gA7o5W4rHdmhHc7c0aH
 fQN7IvWY6MnAiVnezDQry6MjPPq4/5pDMr3KsCmF9IwwluTo0qYy6dfnxSEoxfqZ2XotM59Um
 7nOhbdxmeJkvFBX4fpMJmMa0Cacls6A6Y48wNK1XL1NyLjDdEaiGFCmzTSbeoStAYsAMocrv3
 2tTbzd3PGj1qEpPXJQTadRx88P+cpqXCQ3sQmtxn3PRhS5DEPyZKVq58J5cwQ9Ys2chJoF7Qn
 EwYPLj1Zr1a7FURbNbGzSOPNqRRJr4jiaJeNglxhXyUS6jJeYm8gEjyE8FahhYya+j6tWehID
 mxu1OEk2AFP8GutBLNxsqP9+WpEfn6WEHqkCyku/LOgFZ3OrqOTIMDFMJLifIZ1d2Ov6bhjLX
 KEMQoPPigjEpkQfrc3XKKklq4sD47qv19vbuVjKkCiEzA9YB13aRAMkrLl3ags5DxOUC5h8uJ
 Xb/25wwoDkeh8okTFbGOfo9f2iTFEKO7yzK2lh4XLjyoii9zyOfkMeLGM9CZywYo9hgJHGE5V
 NgovuR9/ckD0VDSG7xAv+ng6DbMYOT1B0im2ZDMlm8lQeOrFoE0pNak5Ma7atfPt/wukQ3rDJ
 /T/QAW53ySTcMd8S6sv/I1IXLd8cZwmznNerdgextfxezT5UUF8k6x5VSE2NDQBrZsLKM+XR6
 Ap6HH7AFU6fY0n2hNwam9BpaNbP+cfiky1+AUYx4g=
Subject: [Buildroot] [PATCH 1/1] package/openlayers: bump to version 6.6.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Thomas Claveirole <thomas.claveirole@green-communications.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Thomas Claveirole <thomas.claveirole@green-communications.fr>
---
 package/openlayers/openlayers.hash | 2 +-
 package/openlayers/openlayers.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/openlayers/openlayers.hash b/package/openlayers/openlayers.hash
index 23683bd6e9..e6debd49ba 100644
--- a/package/openlayers/openlayers.hash
+++ b/package/openlayers/openlayers.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256	ab80014b15963404ec269a71f563fd3568581c55de160d5663600ea0787cf568	v6.5.0-dist.zip
+sha256	c8695a15c3570ca0c8f84c79391f81a89b925a5fcca28dc5cd60942c0dade247	v6.6.1-dist.zip
diff --git a/package/openlayers/openlayers.mk b/package/openlayers/openlayers.mk
index db464ef8a6..c8d2c07ee7 100644
--- a/package/openlayers/openlayers.mk
+++ b/package/openlayers/openlayers.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPENLAYERS_VERSION = 6.5.0
+OPENLAYERS_VERSION = 6.6.1
 OPENLAYERS_SOURCE = v$(OPENLAYERS_VERSION)-dist.zip
 OPENLAYERS_SITE = https://github.com/openlayers/openlayers/releases/download/v$(OPENLAYERS_VERSION)
 OPENLAYERS_LICENSE = BSD-2-Clause
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
