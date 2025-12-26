Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56571E8FDB8
	for <buildroot@archiver.kernel.org>; Fri, 26 Dec 2025 20:07:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2826980A9A;
	Fri, 26 Dec 2025 20:07:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UOw6RiYUnAqu; Fri, 26 Dec 2025 20:07:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 440B980A9E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766779642;
	bh=Q6TAqP5yVDrKpfb99JZEhS6YtVbftTkN58g8+fnaqwg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=pZg+FehRvl7tSVliXVAzwE7xVdkcqk7bDmhsVyVOpz+K+yvjW/K6q5QZyZ/A4Bu17
	 Tn4MdvCUS9l3nnIFT0Gn1guyZ0+3BL0mo3TxQVhZRuVfb4BBq5eS3RIs6Y0jNej2La
	 k+N2VOxQL28+uBwc1+u12bYP3XMI/LwWqecsmzYSIzEUrEkrQr1X/zjKSyAkUeffNX
	 Z0z86L59mtyPNDJGYwC/tienHxbQi8WTKFedfMi15dvluFSCy1uwFJtuixPIY5QZaG
	 PnvKpas/IkdPL0wqqZNGm2HYA686Gaip0RWdVNNa65TkRHSht/vBOv+bGCzXYcjVw5
	 kNe1tZohqJfbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 440B980A9E;
	Fri, 26 Dec 2025 20:07:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E322F255
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D55A24058C
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vSnBN4PhJOxJ for <buildroot@buildroot.org>;
 Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C68140528
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C68140528
 for <buildroot@buildroot.org>; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BEF3876F7; Fri, 26 Dec 2025 20:07:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 26 Dec 2025 20:53:17 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65ae2ad62babd8fb7267fd6ab45e5b67765c89c3
X-Git-Newrev: 4b31541a840cdcd6d44b8243d535e5d4c93a0c27
X-Patchwork-Hint: ignore
Message-Id: <20251226200719.1BEF3876F7@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/grout: bump to 0.14.3 version
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

commit: https://git.buildroot.net/buildroot/commit/?id=4b31541a840cdcd6d44b8243d535e5d4c93a0c27
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

See the release note of the new versions:
https://github.com/DPDK/grout/releases/tag/v0.14.3

Signed-off-by: Maxime Leroy <maxime@leroys.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/grout/grout.hash | 2 +-
 package/grout/grout.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/grout/grout.hash b/package/grout/grout.hash
index 8c4a84cfe6..bf3d6b87ec 100644
--- a/package/grout/grout.hash
+++ b/package/grout/grout.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  9b8ccf87c4d003dde276f904616f8ca61e4618cbedfd2d6e02fd39781713757c  grout-0.14.2.tar.gz
+sha256  4ccceea87ead25dfbee7d44d25283abc61173caf6bae08c9644fa9a6cb6b9ade  grout-0.14.3.tar.gz
 sha256  1e412aae8da58b718c78b3d7a52eb547004384d4347e4746a22ca6af7522930c  licenses/BSD-3-clause.txt
diff --git a/package/grout/grout.mk b/package/grout/grout.mk
index 7b0fbac4cf..39bdc7f824 100644
--- a/package/grout/grout.mk
+++ b/package/grout/grout.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GROUT_VERSION = 0.14.2
+GROUT_VERSION = 0.14.3
 GROUT_SITE = $(call github,DPDK,grout,v$(GROUT_VERSION))
 GROUT_LICENSE = BSD-3-Clause
 GROUT_LICENSE_FILES = licenses/BSD-3-clause.txt
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
