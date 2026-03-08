Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD420EA8545
	for <buildroot@archiver.kernel.org>; Sun,  8 Mar 2026 20:36:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F17A608FA;
	Sun,  8 Mar 2026 20:36:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vCgl4juCiNCZ; Sun,  8 Mar 2026 20:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3CE24608A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773002161;
	bh=/2r+/wU/YihtxxHGqlNv9hBS3tM5Lhdx39J5QThyIMs=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GxJLqP5WUzKoduRmhiuRSK6ym33wuRY+I9PXXygRqVEUT3mUocWgSOxvvkQlEhJxm
	 NyYT5mxsgcTHkWVPbGgAIUwls2FhxC+tGGkKB8L00tcDDGE8twzfgh/rfIb+A0LeLl
	 /Qe8ZVLZSbZFF6kxg9Ji6oI6j49TyIK5nG4lbUH9tZiufM8e1kArGk7iVOFc7bkNA0
	 1tly0d1HQdfVy+Ssj9NeqIO5oSdTleeSE0LlJvP4gbzbgUNt0Nq+2k3VyToUXb+UeY
	 t7NfUy8a/91WGX21eQUw/qv50UY0Bp5/7EODH8+C7WtGcaacdcHTM4r2j24NCW1NgX
	 haAdnFvm+M9hQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3CE24608A4;
	Sun,  8 Mar 2026 20:36:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B955D158
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:35:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AB0184005E
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:35:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l34E36dw80iq for <buildroot@buildroot.org>;
 Sun,  8 Mar 2026 20:35:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B78A340028
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id B78A340028
 for <buildroot@buildroot.org>; Sun,  8 Mar 2026 20:35:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C4F0E84E3D; Sun,  8 Mar 2026 20:35:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 8 Mar 2026 21:34:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d32b12b54833a237096fce58739044b8e5ef23bf
X-Git-Newrev: dcc0707c1b2d78bda9409aa8e8f60e5f180e3cd7
X-Patchwork-Hint: ignore
Message-Id: <20260308203558.C4F0E84E3D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/jasper: bump version to 4.2.9
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/dcc0707c1b2d78bda9409aa8e8f60e5f180e3cd7
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

https://github.com/jasper-software/jasper/releases/tag/version-4.2.9

Switch to sha256 tarball hash provided by upstream.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/jasper/jasper.hash | 3 ++-
 package/jasper/jasper.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/jasper/jasper.hash b/package/jasper/jasper.hash
index 3bda474dfa..d5c619e4a0 100644
--- a/package/jasper/jasper.hash
+++ b/package/jasper/jasper.hash
@@ -1,3 +1,4 @@
+# From https://github.com/jasper-software/jasper/releases/tag/version-4.2.9
+sha256  f71cf643937a5fcaedcfeb30a22ba406912948ad4413148214df280afc425454  jasper-4.2.9.tar.gz
 # Locally calculated
-sha256  98058a94fbff57ec6e31dcaec37290589de0ba6f47c966f92654681a56c71fae  jasper-4.2.8.tar.gz
 sha256  4ad1bb42aff888c4403d792e6e2c5f1716d6c279fea70b296333c9d577d30b81  LICENSE.txt
diff --git a/package/jasper/jasper.mk b/package/jasper/jasper.mk
index 9ed54989e2..5370479328 100644
--- a/package/jasper/jasper.mk
+++ b/package/jasper/jasper.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-JASPER_VERSION = 4.2.8
+JASPER_VERSION = 4.2.9
 JASPER_SITE = https://github.com/jasper-software/jasper/releases/download/version-$(JASPER_VERSION)
 JASPER_INSTALL_STAGING = YES
 JASPER_LICENSE = JasPer-2.0
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
