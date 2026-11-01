Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D98EE606A324
	for <buildroot@archiver.kernel.org>; Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=aGMauET2
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A76734060E;
	Sun,  1 Nov 2026 13:52:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dbRfBB6vCzvO; Sun,  1 Nov 2026 13:52:47 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org B482D405F1
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793541167;
	b=Wp6lYVGPCP6a3PFdvqmaU4HsPT3mFK8b96SXWYL6HefM4SR+hmT5ApPWoqa8rg9XMGbT
	 Gn/kky/GjyTi8ncw3C4A2iten/lN/WTXWT21qGxOcgrqrDX/4UUaKUZPBo7/M6UqKYThu
	 nvaa69oRaSgH5Aufo50OCKsbFQX0K5nqWv7TjfZnmZTxc1EnLUQbsjtmPNeVc/At6/LKm
	 QZmcjYZv65pLD4l2RpAyUOQ/yscUDVKRSqYKq9cyM/GOT4R4WctgyEub9jKiFoH0AtI6/
	 Ko5G40p/iAUCUKUXJ9k6YaR2niAGZB/vW58AfqjkicfrifDwyKyxjPe3Ammtd6jYlTA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793541167;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=t+4ycY73Z4aPRlI/uIFaXfAAdqjJn92Ioyo0qqPNwRA=;
	b=d6iOA5yb2a41eMCU03fys12otQ/5dGuF1fexhEoqbHab5GUJfVSq6NvyXOqgH4UtHsZM
	 3z4Pj6sG9h71kJ3e6aPMEEKgyqFFyjRK4X3A0i0Wn8miS9OfPluGLYBT3qQwIpiEsj3mw
	 Bu23ufWW0HIunjl2DD++k5Bg0fkM+Cmv5Tg1fYuU0ntrTA67Qt65onE7kPOW3ZQ3krAn5
	 NoS3rerk3Ix7ouOfkL07xYlvwkyVKQD/1dpT6+1xHmR21XG6vbXVEUFZ4BOZwt4pVwex6
	 fMkCtw9l7/LxjAkFOst3AQYkDHukAEf2doD5CVWhedIE0/7mJwEZKmogRNHDXsLOcAA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793541167;
	bh=t+4ycY73Z4aPRlI/uIFaXfAAdqjJn92Ioyo0qqPNwRA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aGMauET2gSP81V3FfpMe08iKKa4FfjLWPDI/yOhwM32uuuDH2XLb+ICeUG0iA5VS9
	 Ds3ge5028TqqL0JOOXUg5AZ9EAcUV/CkOn1sNENmRqGkCMr7s/u0fROE0IoDT3AxAn
	 OndCxl8nx0GCfB3kPwIveMjtiYCdTCOI6UQFLs2pTvN5P+uNAtxi/UIpIipJsldrFG
	 C/yw/biidKAU4+PmJZtUFPcJ3d2q1A4E0gSVQ9wNoruL9WbIemJkrxQwClXvvH9cxt
	 CflPs4YZ+7VwQAhLE2j0BzXu4h+/1+6UDVM1CcesGSPEwOZqPwJ+SktW3uMbug4vT1
	 e/wQjedlDsA3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B482D405F1;
	Sun,  1 Nov 2026 13:52:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 33CE64B7
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 19C014009B
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cEyTgxT5aebl for <buildroot@buildroot.org>;
 Sun,  1 Nov 2026 13:52:45 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org E5ECE4004D
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793541164;
 b=A4z68/7JB2cXCsejcmc3BLx47dJTPaAYA+fH7mCz7PUCzHoiqG3l/1qj1svXtnW4hws9
 f0tBN6w6ao6OhmZsF98ua05vYeAcCONeh7zaooW6Rx6VM0I2iksycFIDH40rAipQrRmsG
 3meSB9GDKi+LQyDHuSFCIGBrA2SmgC9ZQzccQrS89X0VUi/CiRRgKu4k7/iwTWpiOdbQm
 A+bINta+C6sL0npo3A+Kva7iS7h37rlN65i9I6S1IfxPEf4e9JE7RaF6kwC7S5KN6NGny
 C4uYn1L/f2kLFIpHuUiMDVhZVRtZi9TwRb9zgAW6JzkzZOfOR/7GbOSeP2/NF7DRgPg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793541164;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=hAQQ9Vi8Z7RuvGvYCadx5XzE67F9ubOxfkuCcCju214=;
 b=UvgZaDo4051R1ZhtyxmHkIt8DqIy7cx6mtR91J85Mc1y14g0n1IGJtzdIxuncPxo3KkB
 AAsyJzRRU3wQfrby0alUXeD8hh/ndeRwHiOepYbLUUF/G01pPv6u4IB3ku4XIva5Xj9ci
 Us2afYG52WI/uT9scT0K3KbCu9QaX+8Wx60AuWP73jCavuVff19nDZ0GL6LA1a7XtyWuN
 RKQYlxotkRwW2INe9o6Er8TRtMjpIOElW8oSOVhborc+wGa1QiGRJY3Y0WGhus1ds64cw
 oH3yZbKcmh9u7I2ptJpWrWp5xk000nFaqES+fUqJmPgcIP6UKTdfH5MNtWOE6lbXFZQ==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E5ECE4004D
 for <buildroot@buildroot.org>; Sun,  1 Nov 2026 13:52:44 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A4F999D460; Sun,  1 Nov 2026 13:51:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 1 Nov 2026 12:50:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2b8e5fe2c7ace7b89d02d9d4203d716a1bf54ed8
X-Git-Newrev: 377dee2baf89d9b41c35097a3eb128761097f5ad
X-Patchwork-Hint: ignore
Message-Id: <20261101135115.A4F999D460@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/docker-engine: Fix go module
 version information
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/377dee2baf89d9b41c35097a3eb128761097f5ad
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

When using Docker engine built by Buildroot, the BuildKit version
information appears as "v0.0.0+unknown" instead of the actual version
(e.g., "v0.22.0").

This occurs because Buildroot's build process doesn't preserve Go module
version information that Docker reads at runtime via debug.ReadBuildInfo()
(see builder/builder-next/worker/worker.go).

Docker's own build system (hack/make/.binary) uses "-mod=vendor
-modfile=vendor.mod" flags, which are crucial for preserving module
dependency information. Adding these flags makes the previous vendoring
workaround obsolete for modern Docker versions.

Note: Use "docker buildx ls" to verify the BuildKit version. This requires
a Docker client with the buildx plugin installed.

Patch downloaded from
https://github.com/home-assistant/buildroot/commit/eb49dd0b3e7cbf00ec3849349251b9798a7d7f43

Signed-off-by: Stefan Agner <stefan@agner.ch>
[Bernd: rebased]
Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/docker-engine/docker-engine.mk | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index bf2dc588fb..5502284dc3 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -25,6 +25,7 @@ DOCKER_ENGINE_LDFLAGS = \
 
 DOCKER_ENGINE_TAGS = cgo exclude_graphdriver_zfs
 DOCKER_ENGINE_BUILD_TARGETS = cmd/dockerd cmd/docker-proxy
+DOCKER_ENGINE_BUILD_OPTS += -mod=vendor -modfile=vendor.mod
 
 ifeq ($(BR2_PACKAGE_LIBAPPARMOR),y)
 DOCKER_ENGINE_DEPENDENCIES += libapparmor
@@ -61,15 +62,6 @@ else
 DOCKER_ENGINE_TAGS += exclude_graphdriver_vfs
 endif
 
-# create the go.mod file with language version go1.19
-# remove the conflicting vendor/modules.txt
-# https://github.com/moby/moby/issues/44618#issuecomment-1343565705
-define DOCKER_ENGINE_FIX_VENDORING
-	printf "module $(DOCKER_ENGINE_GOMOD)\n\ngo 1.19\n" > $(@D)/go.mod
-	rm -f $(@D)/vendor/modules.txt
-endef
-DOCKER_ENGINE_POST_EXTRACT_HOOKS += DOCKER_ENGINE_FIX_VENDORING
-
 define DOCKER_ENGINE_INSTALL_INIT_SYSTEMD
 	$(INSTALL) -D -m 0644 $(@D)/contrib/init/systemd/docker.service \
 		$(TARGET_DIR)/usr/lib/systemd/system/docker.service
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
