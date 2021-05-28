Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F32FFC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:52:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BE36960F41
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 22:52:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BE36960F41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C42C608A1;
	Tue,  3 Aug 2021 22:52:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WS3Xf4dvjoIf; Tue,  3 Aug 2021 22:52:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D8C5960862;
	Tue,  3 Aug 2021 22:52:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DB8251BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:12:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A70440612
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:09:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PJT7xS6NaVpS for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:09:55 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8154405B1
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:09:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 45D1985F62; Tue,  3 Aug 2021 21:09:46 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 28 May 2021 14:36:39 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: eae15d62c6a857f43d6f21af9a30f38994b3efc5
X-Git-Newrev: ab9ceea782c770acdb9a25d8601b12af261c8ccb
X-Patchwork-Hint: ignore
Message-Id: <20210803210946.45D1985F62@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/nginx: add upstream
 CVE-2021-23017 security fix
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=ab9ceea782c770acdb9a25d8601b12af261c8ccb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fixes the following vulnerability:

- CVE-2021-23017: 1-byte memory overwrite in resolver

For more details, see the advisories:
https://mailman.nginx.org/pipermail/nginx-announce/2021/000300.html
https://www.openwall.com/lists/oss-security/2021/05/25/5

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[yann.morin.1998@free.fr: annotate the patch, that it is a backport]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...xed-off-by-one-write-in-ngx_resolver_copy.patch | 40 ++++++++++++++++++++++
 package/nginx/nginx.mk                             |  3 ++
 2 files changed, 43 insertions(+)

diff --git a/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch b/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
new file mode 100644
index 0000000000..ba47768fe5
--- /dev/null
+++ b/package/nginx/0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
@@ -0,0 +1,40 @@
+From 9f1dcb0c0473641730b871dee984016ff19d2c53 Mon Sep 17 00:00:00 2001
+From: Maxim Dounin <mdounin@mdounin.ru>
+Date: Tue, 25 May 2021 15:17:36 +0300
+Subject: [PATCH] Resolver: fixed off-by-one write in ngx_resolver_copy().
+
+Reported by Luis Merino, Markus Vervier, Eric Sesterhenn, X41 D-Sec GmbH.
+
+[peter@korsgaard.com: backport from upstream]
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+---
+ src/core/ngx_resolver.c | 8 ++++----
+ 1 file changed, 4 insertions(+), 4 deletions(-)
+
+diff --git a/src/core/ngx_resolver.c b/src/core/ngx_resolver.c
+index 79390701..63b26193 100644
+--- a/src/core/ngx_resolver.c
++++ b/src/core/ngx_resolver.c
+@@ -4008,15 +4008,15 @@ done:
+             n = *src++;
+ 
+         } else {
++            if (dst != name->data) {
++                *dst++ = '.';
++            }
++
+             ngx_strlow(dst, src, n);
+             dst += n;
+             src += n;
+ 
+             n = *src++;
+-
+-            if (n != 0) {
+-                *dst++ = '.';
+-            }
+         }
+ 
+         if (n == 0) {
+-- 
+2.20.1
+
diff --git a/package/nginx/nginx.mk b/package/nginx/nginx.mk
index 8a371a2cc8..e93e802fd3 100644
--- a/package/nginx/nginx.mk
+++ b/package/nginx/nginx.mk
@@ -13,6 +13,9 @@ NGINX_DEPENDENCIES = \
 	host-pkgconf \
 	$(if $(BR2_PACKAGE_LIBXCRYPT),libxcrypt)
 
+# 0010-Resolver-fixed-off-by-one-write-in-ngx_resolver_copy.patch
+NGINX_IGNORE_CVES += CVE-2021-23017
+
 NGINX_CONF_OPTS = \
 	--crossbuild=Linux::$(BR2_ARCH) \
 	--with-cc="$(TARGET_CC)" \
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
