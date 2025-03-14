Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8320C2D0CD
	for <buildroot@archiver.kernel.org>; Mon, 19 May 2025 10:41:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E08442478;
	Mon, 19 May 2025 10:41:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I4CQ-fCTM9bL; Mon, 19 May 2025 10:41:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46173411E5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46173411E5;
	Mon, 19 May 2025 10:41:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 185BDE4
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2126C40D4F
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cL9SZUqBVbyF for <buildroot@buildroot.org>;
 Mon, 19 May 2025 10:39:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A409C40D62
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A409C40D62
 for <buildroot@buildroot.org>; Mon, 19 May 2025 10:39:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A28158725C; Mon, 19 May 2025 10:39:42 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Fri, 14 Mar 2025 20:58:04 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a79c862fa193d4f0685a1619f391fe228346d8ea
X-Git-Newrev: fc690631caa3f061adc22c1f7dc4def226a80194
X-Patchwork-Hint: ignore
Message-Id: <20250519103942.A28158725C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/fio: explicitly
 control libnfs dependency
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============5602874739319776729=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5602874739319776729==
Content-Type: text/plain

commit: https://git.buildroot.net/buildroot/commit/?id=fc690631caa3f061adc22c1f7dc4def226a80194
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The upstream uses pkg-config to detect and enable libnfs usage if it
is found [1]. This can get confused by the host configuration so at the
least we should disable detection if we are not planning to build with
it.

Note: the fio configure script accept both --enable-libnfs
and --disable-libnfs since upstream commit [2], first included
in fio v3.31. In Buildroot, this is supported since [3].

[1] https://github.com/axboe/fio/blob/fio-3.38/configure#L2360
[2] https://github.com/axboe/fio/commit/98ab12629c6a98fb53e28a4a70f53ce594cca858
[3] https://gitlab.com/buildroot.org/buildroot/-/commit/256395d8e5e7258df830dc19b47dc9ef19e48535

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
[Julien: add extra info in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/fio/fio.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/fio/fio.mk b/package/fio/fio.mk
index 10fafb8a0e..57a54dc34a 100644
--- a/package/fio/fio.mk
+++ b/package/fio/fio.mk
@@ -16,7 +16,10 @@ FIO_DEPENDENCIES += libaio
 endif
 
 ifeq ($(BR2_PACKAGE_LIBNFS),y)
-FIO_DEPENDENCIES += libnfs
+FIO_OPTS += --enable-libnfs
+FIO_DEPENDENCIES += host-pkgconf libnfs
+else
+FIO_OPTS += --disable-libnfs
 endif
 
 ifeq ($(BR2_PACKAGE_LIBISCSI),y)

--===============5602874739319776729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5602874739319776729==--
