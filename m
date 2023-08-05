Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3461DC0015E
	for <buildroot@archiver.kernel.org>; Sat,  5 Aug 2023 23:06:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0EA0409C9;
	Sat,  5 Aug 2023 23:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C0EA0409C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cl5MBF8MQT35; Sat,  5 Aug 2023 23:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BE396410BA;
	Sat,  5 Aug 2023 23:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BE396410BA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6056F1BF591
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 23:06:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10AAF60B23
 for <buildroot@lists.busybox.net>; Sat,  5 Aug 2023 23:04:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10AAF60B23
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XqnlFHpDNxml for <buildroot@lists.busybox.net>;
 Sat,  5 Aug 2023 23:04:41 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0912F60BC9
 for <buildroot@buildroot.org>; Sat,  5 Aug 2023 23:04:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0912F60BC9
Received: from home.juju.sh (unknown
 [IPv6:2a01:e0a:485:b220:64fe:9015:874f:9d44])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8816613F84C;
 Sun,  6 Aug 2023 01:04:35 +0200 (CEST)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Sun,  6 Aug 2023 01:04:10 +0200
Message-ID: <20230805230410.107850-2-ju.o@free.fr>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230805230410.107850-1-ju.o@free.fr>
References: <20230805230410.107850-1-ju.o@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691276679;
 bh=cTLs/rk81h6TrCcyAWL3F2FAS26nyY66CURw0Zm3oGw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=vCkxZCMMbJUjwNSTUWFlBu3LvzR4pfV/ceuc6DR7g8cTVdrOoA3cNaXNqoZGZyC23
 9XnXPx+fnDlSAuWjAmVnltPOKFjdcXnBVLfto2VTNqCZLXY77IOIiVprLvXVvsi1lf
 dR9hQT4/+D1/f5ZoMwLbSRG74gnJbZHdP2zd8fK20yxYpO9DblG9uzX8gj7WdGCxeq
 1rwpfWDyCnMqMll1VDk8HXw8fmUWx9SJghEXadaAX9IdvdcxUscGLcV+SmXgcQ4Nct
 xuIpkJsjn1+5apxUKN4C01T4DoINZ67kfwgLdkfiRlR+eZ/dqnUrEba36UTddPHCOE
 O3ONBst3Uw4jQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=vCkxZCMM
Subject: [Buildroot] [PATCH 2/2] package/acpica: rename HOST make variable
 override to ACPI_HOST
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
