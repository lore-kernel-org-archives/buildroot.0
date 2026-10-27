Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 456FB606A321
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=EF00SMz9
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1978340572;
	Tue, 27 Oct 2026 20:45:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMimNDGvYOQa; Tue, 27 Oct 2026 20:45:18 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 3331F4055E
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793133918;
	b=Ep/OjPj3q+Ampl7KcJCTmeQRnUzAIXoJafXnoOyHldngtEKoAcUn2gZBCKoe0aE/0n/X
	 +gCsNm72xCnNdU9ltQkhr8UuqLkGGWcoQp4HLOvZgV/dWEdz+AGz/a1d8u5lCDCpokOdB
	 fguj6Iey3z+tP+lNlE6ajZKAullC8bxdz4bqRwjcUQC+OU4k12ybVmPiyw+fE6u/MHHsI
	 s7W104Kf0T/No63OrQdFM6WruNHQsx59qqj9FdMSdBMnJl89brnbwib/1NGIzbmgRyN3h
	 CqF/2KjohV3rzEGzLcup2pCdglWUKlayPzh9h0MdYfIMzOALcn02EUaIh2UT+SJVN9w==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793133918;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YJAaeHVx//BqTi27DPbZ3v3W2gMfXt8uQjWP93GnXsw=;
	b=prZ3yQPzvkolXnKYBLBdy0KlHOfEIwC+W8a1FAbX31ia9p3yYzghAvk0KvsSBGSpte5A
	 M5h+sYzsTA77cgVq6swY/9Xs+C71YGCCcYhVVbTcxJVBLtBvbDd5LVMV9HKS0gS5iDsR5
	 OYSkqb8oGRFDLiCB3c/ipJSm901nI662Wz5dLFupkmIhgsQ0dLVnfKvx7wJjKGCOmvdVp
	 g4jFN2Vgxl5N5vNRW5P4m5huqYpgaKM4xiAGCadPCoxAGLr2U3ktVG6xC2VaUpJ86tUVq
	 AfWyMlRw3m87rBdcgdSPfkdhMbs7vW/NlM0WZo60CStgdc+syo77XNnDA0q+0vYoQWg==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793133918;
	bh=YJAaeHVx//BqTi27DPbZ3v3W2gMfXt8uQjWP93GnXsw=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EF00SMz9aPF4UfsVzGhOwwjlB7BKqHxAVoKew+0/NuyNapSciFvdNrvHWGxaYzF08
	 az4O8TKclcVOPl3pPYH/P4IZrni2obZp9SJFiMaotLS7pZLlhYWd7x1dqfKKKBbRyq
	 m1MLvJ8PGnHrufmBwzvhXTf/MVwUJ0bYbeqVRRmmXEaS882UF8n4Fz+zXwXd6Z8+th
	 ixKNia17II5FzS+H3Fh2hJlJyg7h8cA2Wot4tn1NeNb19+eMUyvNkn/6g5MIphPiq9
	 4/K2x43vxgqypR8cDldFz5SU91WHirNHe7uzuZ8QE3nTIoRshXPiMqrMeIWFgf+12a
	 Ge/1GLaZ1pX3g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3331F4055E;
	Tue, 27 Oct 2026 20:45:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 4D41C279
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:45:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F4BD606A0
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:45:17 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lVyPrm31GPHm for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:45:16 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 98629605E5
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793133916;
 b=G54hj25WpRWk7d55sFDwBykF8JGkDqS4WtaHPxAzVwruHRkV8pp9tbukr+W580EShPbJ
 zJvel8BcFXIPMxKkPVgQQ6uIYjMfxINQsPX9SFwQEsdS3sr7qoxoJSDe81MTwRloRLORu
 SoHEsRA8yBAqvhir733jTXgUO69tAkI73MWaOznpvDZoKAKh+jwtZ6UB4OshCqEI5bs5B
 W9xcxBMs08lCDN+0mF1Le5fP+z/YLPk69Df1G0OBTeae3/BdJNiwpka0ohzkF/qPzs8yy
 TLRyLp9+lMcYRk1tt/rmSobQNzg3VR++3hczSGcHfJHO3D8l/t7NJwCC/pNxt39c4OA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793133916;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=5VUhhOtmw75afTYpGIOmDsvhw/OKW/WtAy5gUJ2ioVs=;
 b=osrfHYyk/Q+qHFQGojUeUj0Y4YjGb5AGHVKnMkZnukeSs27jVCFm74EvK8ct+tuLCzfX
 3lAiem0yg/LzIQbCnE9HPgADZFZBB/EPKUH13WABZSX55uSkGqVCP+L4FYugl5OHhYyMH
 OFGkc5GrFcTVVwr4NZAhtsa95+GC02bALZRoPOSLQY0ahjSFEHcOzM0AlWEkqVXXVdCap
 5yNOG7n30hj6Ev2Qeb3zoJL4LVt4pZ2ALnoZ2eRkhAFLJ4ggw++se8ois0RH0azUDotFb
 FoYjSt1UN0AKyk9CF8PSGwsa8ZRL9ZuuH7i1tjRJZYYHsXUU/q++IfL+pPkQBwCHVlA==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 98629605E5
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:45:16 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 02BC39D166; Tue, 27 Oct 2026 20:43:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 21:45:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 073c81c8cd233fa6e3a7067e3542ef0f56f28621
X-Git-Newrev: 89edeb496639cefa67eff6cecc8c6f9ad612305b
X-Patchwork-Hint: ignore
Message-Id: <20261027204350.02BC39D166@busybox.osuosl.org>
Subject: [Buildroot] [git commit] test_mender/post-build.sh: add rootfs
 image checksum for bootstrap artifact
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/89edeb496639cefa67eff6cecc8c6f9ad612305b
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Just like the generate_mender_bootstrap_artifact method in
board/mender/x86_64/post-image-efi.sh, calculate the rootfs-image checksum.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 support/testing/tests/package/test_mender/post-build.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/support/testing/tests/package/test_mender/post-build.sh b/support/testing/tests/package/test_mender/post-build.sh
index 76698fb7d9..db075628e0 100755
--- a/support/testing/tests/package/test_mender/post-build.sh
+++ b/support/testing/tests/package/test_mender/post-build.sh
@@ -4,11 +4,15 @@ COMPATIBLE_TYPE="buildroot-arm"
 ARTIFACT_NAME="RUNTIME_TEST_ARTIFACT_NAME"
 
 generate_mender_bootstrap_artifact() {
+  img_checksum=$(sha256sum "${BINARIES_DIR}"/rootfs.cpio |awk '{print $1}')
+
   "${HOST_DIR}"/bin/mender-artifact \
     write bootstrap-artifact \
+    --compression none \
     --artifact-name "${ARTIFACT_NAME}" \
     --compatible-types "${COMPATIBLE_TYPE}" \
     --provides "rootfs-image.version:${ARTIFACT_NAME}" \
+    --provides "rootfs-image.checksum:${img_checksum}" \
     --clears-provides "rootfs-image.*" \
     --output-path "${TARGET_DIR}"/var/lib/mender/bootstrap.mender \
     --version 3
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
