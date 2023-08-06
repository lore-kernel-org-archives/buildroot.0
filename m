Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EF2C001DE
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 10:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1B739408AE;
	Sun,  6 Aug 2023 10:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1B739408AE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nxnVPHqUYIDF; Sun,  6 Aug 2023 10:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1E11B4096D;
	Sun,  6 Aug 2023 10:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1E11B4096D
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 457BD1BF44A
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AD165401F9
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 10:28:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AD165401F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id of06oubqx_RO for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 10:28:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADF0540457
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 10:28:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADF0540457
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9B5AA8429A; Sun,  6 Aug 2023 10:28:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Aug 2023 12:28:32 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 7aea64c843590fb8dc3640d4ccc6851b114cdd30
X-Git-Newrev: 6d37bf0509aa163154c7b8723ce653afb8810e6c
X-Patchwork-Hint: ignore
Message-Id: <20230806102847.9B5AA8429A@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/acpica: rename HOST
 make variable override to ACPI_HOST
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6d37bf0509aa163154c7b8723ce653afb8810e6c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The HOST Makefile variable was renamed upstream to ACPI_HOST in [1].

This commit was first included in tag R02_14_20 (version 20200214).
See the change log [2].

This no longer correct use of HOST did not introduced any
compilation error, as the code uses constructs like:

    #if defined(_LINUX) || defined(__linux__)

This patch change the variable name to follow upstream, just for
correctness.

[1] https://github.com/acpica/acpica/commit/98753481f7321a7c8f2a79ff0158cdc5e73acace
[2] https://github.com/acpica/acpica/blob/R02_14_20/documents/changes.txt#L25

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/acpica/acpica.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/acpica/acpica.mk b/package/acpica/acpica.mk
index b932941369..bbabd9de69 100644
--- a/package/acpica/acpica.mk
+++ b/package/acpica/acpica.mk
@@ -14,7 +14,7 @@ HOST_ACPICA_DEPENDENCIES = host-bison host-flex
 
 define ACPICA_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(MAKE) -C $(@D) \
-		HOST=_LINUX CC="$(TARGET_CC)" \
+		ACPI_HOST=_LINUX CC="$(TARGET_CC)" \
 		NOWERROR=TRUE \
 		all
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
