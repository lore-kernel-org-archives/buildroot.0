Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F970CD8CA4
	for <buildroot@archiver.kernel.org>; Tue,  9 Jun 2026 13:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 623AE85BB1;
	Tue,  9 Jun 2026 13:04:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id af-ulH5R4h33; Tue,  9 Jun 2026 13:04:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9A92485B96
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1781010254;
	bh=/GDeubVNcU4sE7Ge1gF9LaQ8eyB+ckk5ftqnqg0Te9c=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=XbZX1BSyy9u6WKEvAVkYCD8yhFAQ1BARzGylMxcyr7yG7foknev3qQpWVsycPa3VW
	 78CdvYFyouFukKr7qM8xFxDblmUkZ2w5dNUm4fhBUrFEDjmqoZXXXcny/JUwClzjRC
	 MZqVNtKF7408iSvPyKtsjPb8aLlgHcWv3BbUk7j9+a4P8o+i42n8b2HA4C+4hU0Pmm
	 +iB4T/pySPamJsaDpDeD5vxx+YYzfMsYOjv0PEqVm147gEGRbChtAuhbfdmfmTyHIT
	 h/YNkAvXkFmlLcdTj47xEi/MTMnv25nv3fCkjKjWhYm4MSQ7sTlLsCEWaWTfU1qukX
	 39uykMYsJ80WQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9A92485B96;
	Tue,  9 Jun 2026 13:04:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 90A91196
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:02:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C1B6C42717
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ifs758BikpAi for <buildroot@buildroot.org>;
 Tue,  9 Jun 2026 13:01:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E92E1426EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E92E1426EE
 for <buildroot@buildroot.org>; Tue,  9 Jun 2026 13:01:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3160C87E7E; Tue,  9 Jun 2026 13:01:22 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 30 May 2026 15:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7e160efb087edcbfc33072a138b24f074155a020
X-Git-Newrev: e4ac5015b994205f9b879912e703e5ab2a36a424
X-Patchwork-Hint: ignore
Message-Id: <20260609130122.3160C87E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/redis-plus-plus: disable -Werror
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/e4ac5015b994205f9b879912e703e5ab2a36a424
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Fixes build error with gcc 16.x:

output/build/redis-plus-plus-1.3.15/src/sw/redis++/reply.h:
 In constructor 'sw::redis::ParseError::ParseError(const std::string&,
 const redisReply&)':
output/build/redis-plus-plus-1.3.15/src/sw/redis++/reply.h:54:60: error:
 '<unknown>' may be used uninitialized [-Werror=maybe-uninitialized]
   54 | const redisReply &reply) : ProtoError(_err_info(expect_type, reply)) {}
      |                                       ~~~~~~~~~^~~~~~~~~~~~~~~~~~~~

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/redis-plus-plus/redis-plus-plus.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/redis-plus-plus/redis-plus-plus.mk b/package/redis-plus-plus/redis-plus-plus.mk
index 0ee9f091fb..acd3a81f3d 100644
--- a/package/redis-plus-plus/redis-plus-plus.mk
+++ b/package/redis-plus-plus/redis-plus-plus.mk
@@ -11,6 +11,11 @@ REDIS_PLUS_PLUS_LICENSE_FILES = LICENSE
 REDIS_PLUS_PLUS_INSTALL_STAGING = YES
 REDIS_PLUS_PLUS_DEPENDENCIES = hiredis
 
+define REDIS_PLUS_PLUS_NO_WERROR
+	$(SED) 's/"-Werror"//' $(@D)/CMakeLists.txt
+endef
+REDIS_PLUS_PLUS_POST_PATCH_HOOKS += REDIS_PLUS_PLUS_NO_WERROR
+
 REDIS_PLUS_PLUS_CONF_OPTS = \
 	-DREDIS_PLUS_PLUS_BUILD_SHARED=$(if $(BR2_STATIC_LIBS),OFF,ON) \
 	-DREDIS_PLUS_PLUS_BUILD_TEST=OFF
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
