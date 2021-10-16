Return-Path: <SRS0=a1j9=PE=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24293C433F5
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:49:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 86849610D2
	for <buildroot@archiver.kernel.org>; Sat, 16 Oct 2021 07:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 86849610D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 36DCC6060E;
	Sat, 16 Oct 2021 07:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PDVCJEA44Dke; Sat, 16 Oct 2021 07:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id DE6486063E;
	Sat, 16 Oct 2021 07:49:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B70021BF369
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:49:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A5AFA401DF
 for <buildroot@lists.busybox.net>; Sat, 16 Oct 2021 07:49:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JjjA8_hNbKIR for <buildroot@lists.busybox.net>;
 Sat, 16 Oct 2021 07:49:30 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8555740124
 for <buildroot@buildroot.org>; Sat, 16 Oct 2021 07:49:30 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 0562B8A25A; Sat, 16 Oct 2021 07:46:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 16 Oct 2021 09:43:17 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 05d734e0b9fbfb23a2a6fdd1db75af03ebf3e9ac
X-Git-Newrev: 613953f8217bf5b27489e0a939147ef7c74c3f7a
X-Patchwork-Hint: ignore
Message-Id: <20211016074632.0562B8A25A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/lightning: ignore not applicable
 CVE-2020-7747
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

commit: https://git.buildroot.net/buildroot/commit/?id=613953f8217bf5b27489e0a939147ef7c74c3f7a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

CVE-2020-7747 applies to the Javascript lightning-server project, and
not to the GNU Lightning project:

    https://nvd.nist.gov/vuln/detail/CVE-2020-7747

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
[yann.morin.1998@free.fr: reword commit log; add URL]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/lightning/lightning.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/lightning/lightning.mk b/package/lightning/lightning.mk
index 3bd17bef56..38b132e082 100644
--- a/package/lightning/lightning.mk
+++ b/package/lightning/lightning.mk
@@ -12,6 +12,10 @@ LIGHTNING_INSTALL_STAGING = YES
 # We're patching include/Makefile.am
 LIGHTNING_AUTORECONF = YES
 
+# CVE-2020-7747 is for the Javascript lightning-server project, and not for
+# GNU Lightning.
+LIGHTNING_IGNORE_CVES = CVE-2020-7747
+
 ifeq ($(BR2_PACKAGE_LIGHTNING_DISASSEMBLER),y)
 LIGHTNING_DEPENDENCIES += binutils zlib
 LIGHTNING_CONF_OPTS += --enable-disassembler
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
