Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E322AEB64DD
	for <buildroot@archiver.kernel.org>; Fri, 21 Jul 2023 21:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9B6BB4185A;
	Fri, 21 Jul 2023 21:05:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9B6BB4185A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8TcKN3UG9J-P; Fri, 21 Jul 2023 21:05:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D26A14055E;
	Fri, 21 Jul 2023 21:05:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D26A14055E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 05C2E1BF82F
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:05:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AF71140128
 for <buildroot@lists.busybox.net>; Fri, 21 Jul 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AF71140128
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gV3FA9OGFPd6 for <buildroot@lists.busybox.net>;
 Fri, 21 Jul 2023 21:05:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0507D4055E
 for <buildroot@buildroot.org>; Fri, 21 Jul 2023 21:05:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0507D4055E
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E4DA587522; Fri, 21 Jul 2023 21:05:41 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Jul 2023 23:00:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e356dada43183f658b8dab1b3d83c94e3cac2ad5
X-Git-Newrev: 7ccdeeb213ec04551237414e9bc7cb9aa52b2851
X-Patchwork-Hint: ignore
Message-Id: <20230721210541.E4DA587522@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openssh: security bump version to
 9.3p2
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

commit: https://git.buildroot.net/buildroot/commit/?id=7ccdeeb213ec04551237414e9bc7cb9aa52b2851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes CVE-2023-38408: https://www.openssh.com/txt/release-9.3p2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/openssh/openssh.hash | 4 ++--
 package/openssh/openssh.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/openssh/openssh.hash b/package/openssh/openssh.hash
index 2be54431ec..df472e087d 100644
--- a/package/openssh/openssh.hash
+++ b/package/openssh/openssh.hash
@@ -1,4 +1,4 @@
-# From https://www.openssh.com/txt/release-9.3 (base64 encoded)
-sha256  e9baba7701a76a51f3d85a62c383a3c9dcd97fa900b859bc7db114c1868af8a8  openssh-9.3p1.tar.gz
+# From https://www.openssh.com/txt/release-9.3p2
+sha256  200ebe147f6cb3f101fd0cdf9e02442af7ddca298dffd9f456878e7ccac676e8  openssh-9.3p2.tar.gz
 # Locally calculated
 sha256  05c30446ba738934b3f1efa965b454c122ca26cc4b268e5ae6843f58ccd1b16d  LICENCE
diff --git a/package/openssh/openssh.mk b/package/openssh/openssh.mk
index 26d6bd504d..e14d752290 100644
--- a/package/openssh/openssh.mk
+++ b/package/openssh/openssh.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 OPENSSH_VERSION_MAJOR = 9.3
-OPENSSH_VERSION_MINOR = p1
+OPENSSH_VERSION_MINOR = p2
 OPENSSH_VERSION = $(OPENSSH_VERSION_MAJOR)$(OPENSSH_VERSION_MINOR)
 OPENSSH_CPE_ID_VERSION = $(OPENSSH_VERSION_MAJOR)
 OPENSSH_CPE_ID_UPDATE = $(OPENSSH_VERSION_MINOR)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
