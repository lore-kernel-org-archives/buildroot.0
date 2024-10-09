Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36C8CEE34F
	for <buildroot@archiver.kernel.org>; Wed,  9 Oct 2024 21:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 837B6812FE;
	Wed,  9 Oct 2024 21:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27mVHrW-jgGG; Wed,  9 Oct 2024 21:26:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8013481351
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8013481351;
	Wed,  9 Oct 2024 21:26:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 89C0E1BF3D4
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:26:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 78E8281351
 for <buildroot@lists.busybox.net>; Wed,  9 Oct 2024 21:26:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHTrCGAjYq8f for <buildroot@lists.busybox.net>;
 Wed,  9 Oct 2024 21:26:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A063C812FE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A063C812FE
 for <buildroot@buildroot.org>; Wed,  9 Oct 2024 21:26:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9692285C36; Wed,  9 Oct 2024 21:26:35 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 9 Oct 2024 23:23:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4f22abb934c3ba3de92d468b36d719057755a4f
X-Git-Newrev: 800ec5dd7f8087622fdd5ea0294c0cfad58ebb6f
X-Patchwork-Hint: ignore
Message-Id: <20241009212635.9692285C36@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/go: bump version to go1.22.8
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

commit: https://git.buildroot.net/buildroot/commit/?id=800ec5dd7f8087622fdd5ea0294c0cfad58ebb6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

go1.22.8 (released 2024-10-01) includes fixes to cgo, maps, and syscall.

https://go.dev/doc/devel/release#go1.22.8

Signed-off-by: Christian Stewart <christian@aperture.us>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/go/go-bin/go-bin.hash | 14 +++++++-------
 package/go/go-src/go-src.hash |  2 +-
 package/go/go.mk              |  2 +-
 3 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/package/go/go-bin/go-bin.hash b/package/go/go-bin/go-bin.hash
index d979bada11..4d18e0cd2e 100644
--- a/package/go/go-bin/go-bin.hash
+++ b/package/go/go-bin/go-bin.hash
@@ -1,9 +1,9 @@
 # sha256 checksum from https://go.dev/dl/
-sha256  66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f  go1.22.7.src.tar.gz
-sha256  810e4d9f3f2f03b2f11471a9c7a32302968fc09d51f666cecacedb1055f2f873  go1.22.7.linux-386.tar.gz
-sha256  fc5d49b7a5035f1f1b265c17aa86e9819e6dc9af8260ad61430ee7fbe27881bb  go1.22.7.linux-amd64.tar.gz
-sha256  ed695684438facbd7e0f286c30b7bc2411cfc605516d8127dc25c62fe5b03885  go1.22.7.linux-arm64.tar.gz
-sha256  0fd55519819922f51d13503f2c9b1294730be7ffa0ead8dd36c0e540c2a27508  go1.22.7.linux-armv6l.tar.gz
-sha256  a6441d5da40a961039ec22b0aadbc8b513f52b31bb8919c359a7e2c3c5bcf26a  go1.22.7.linux-ppc64le.tar.gz
-sha256  08dc28de0dafb175501b9d1623c9b11a9b734eb4b3a35c9c658cc91d4dfce3f3  go1.22.7.linux-s390x.tar.gz
+sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
+sha256  0c8e9f824bf443f51e06ac017b9ae402ea066d761b309d880dbb2ca5793db8a2  go1.22.8.linux-386.tar.gz
+sha256  5f467d29fc67c7ae6468cb6ad5b047a274bae8180cac5e0b7ddbfeba3e47e18f  go1.22.8.linux-amd64.tar.gz
+sha256  5c616b32dab04bb8c4c8700478381daea0174dc70083e4026321163879278a4a  go1.22.8.linux-arm64.tar.gz
+sha256  5191e87a51a85d88edddc028ab30dfbfa2d7c37cf35d536655e7a063bfb2c9d2  go1.22.8.linux-armv6l.tar.gz
+sha256  c546f27866510bf8e54e86fe6f58c705af0e894341e5572c91f197a734152c27  go1.22.8.linux-ppc64le.tar.gz
+sha256  fabb3adc241474e28ae151a00e1421983deb35184d31cc76e90025b1b389f6bf  go1.22.8.linux-s390x.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go-src/go-src.hash b/package/go/go-src/go-src.hash
index f5727390f7..40cb5c801a 100644
--- a/package/go/go-src/go-src.hash
+++ b/package/go/go-src/go-src.hash
@@ -1,3 +1,3 @@
 # From https://go.dev/dl
-sha256  66432d87d85e0cfac3edffe637d5930fc4ddf5793313fe11e4a0f333023c879f  go1.22.7.src.tar.gz
+sha256  df12c23ebf19dea0f4bf46a22cbeda4a3eca6f474f318390ce774974278440b8  go1.22.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 215c5fe965..68fd359ed0 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.22.7
+GO_VERSION = 1.22.8
 
 HOST_GO_GOPATH = $(HOST_DIR)/share/go-path
 HOST_GO_HOST_CACHE = $(HOST_DIR)/share/host-go-cache
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
