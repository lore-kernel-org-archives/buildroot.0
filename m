Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34C47C6FD1D
	for <buildroot@archiver.kernel.org>; Wed, 15 Mar 2023 14:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBCCC40B6B;
	Wed, 15 Mar 2023 14:11:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBCCC40B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Of_oVGAfSZAw; Wed, 15 Mar 2023 14:11:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 445D440B5C;
	Wed, 15 Mar 2023 14:11:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 445D440B5C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A37F21BF3C5
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:11:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B17280BF4
 for <buildroot@lists.busybox.net>; Wed, 15 Mar 2023 14:11:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B17280BF4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vELJ0OAd5bP3 for <buildroot@lists.busybox.net>;
 Wed, 15 Mar 2023 14:11:49 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C6FE680BF0
 for <buildroot@buildroot.org>; Wed, 15 Mar 2023 14:11:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6FE680BF0
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B718887400; Wed, 15 Mar 2023 14:11:49 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed, 15 Mar 2023 15:09:44 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: 6771ba24d8a0f197b491c2e011471f9e33fea6d3
X-Git-Newrev: fb1ba8f28064e5329d74096495ce29e54103e842
X-Patchwork-Hint: ignore
Message-Id: <20230315141149.B718887400@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x] package/proftpd: add
 pcre2 optional dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=fb1ba8f28064e5329d74096495ce29e54103e842
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

pcre2 is an optional dependency since version 1.3.8 and
https://github.com/proftpd/proftpd/commit/e63cf016f574890c4096d587b8b1f55d87ac05d5

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 091655d9ad3a3b3f05be4216b5936b644a596267)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/proftpd/proftpd.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/proftpd/proftpd.mk b/package/proftpd/proftpd.mk
index d3b6308185..398155222d 100644
--- a/package/proftpd/proftpd.mk
+++ b/package/proftpd/proftpd.mk
@@ -31,6 +31,13 @@ ifeq ($(BR2_PACKAGE_LIBIDN2),y)
 PROFTPD_DEPENDENCIES += libidn2
 endif
 
+ifeq ($(BR2_PACKAGE_PCRE2),y)
+PROFTPD_CONF_OPTS += --enable-pcre2
+PROFTPD_DEPENDENCIES += pcre2
+else
+PROFTPD_CONF_OPTS += --disable-pcre2
+endif
+
 ifeq ($(BR2_PACKAGE_PROFTPD_MOD_CAP),y)
 PROFTPD_CONF_OPTS += --enable-cap
 PROFTPD_DEPENDENCIES += libcap
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
