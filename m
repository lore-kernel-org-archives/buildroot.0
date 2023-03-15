Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7389AC61DA4
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:09:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 12BDF4098E;
	Wed, 15 Mar 2023 14:09:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 12BDF4098E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ewFu4auDobZ9; Wed, 15 Mar 2023 14:09:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 594F040B85;
	Wed, 15 Mar 2023 14:09:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 594F040B85
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AC751BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:09:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10D7860BD2
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:09:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D7860BD2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PtXJJVpqXFrG for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:09:29 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 57A0160BA3
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:09:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57A0160BA3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 46ADC873D7; Wed, 15 Mar 2023 14:09:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:08:33 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 4c80481fad3c67e9f7f4e31a49685abf1396e20b
X-Git-Newrev: 6771ba24d8a0f197b491c2e011471f9e33fea6d3
X-Patchwork-Hint: ignore
Message-Id: <20230315140929.46ADC873D7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/proftpd: add
 libidn2 optional dependency
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6771ba24d8a0f197b491c2e011471f9e33fea6d3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

libidn2 is an optional dependency which is enabled by default since
version 1.3.8 and
https://github.com/proftpd/proftpd/commit/5f61ac028e0930e7de9ea2a00864ccb6dc048f64

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b3b2ef030263d275d1bfcdf7db41a5faa93339ca)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index 8e7d108c9e..d3b6308185 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -27,6 +27,10 @@ PROFTPD_CONF_OPTS = \
 	--with-gnu-ld \
 	--without-openssl-cmdline
 
+ifeq ($(BR2_PACKAGE_LIBIDN2),y)
+PROFTPD_DEPENDENCIES += libidn2
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_CAP),y)
 PROFTPD_CONF_OPTS += --enable-cap
 PROFTPD_DEPENDENCIES += libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
