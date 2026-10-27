Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04682606A32C
	for <buildroot@archiver.kernel.org>; Tue, 27 Oct 2026 20:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=dUNoGD68
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CD9F440722;
	Tue, 27 Oct 2026 20:16:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aIJs5HAFXdHY; Tue, 27 Oct 2026 20:16:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org E7DA840712
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793132163;
	b=N/tqOXAaB5pqACyyoZNV2IiHHjo3sOJLF3w8XMt3YrDcNR1ND5xW8uUGo1NkGYGyC3Ou
	 uJYVuGP28vU71j7Y6w5fDpC/Yt5GUCSSr/D9GYQdcQyaaPaaEgNPXnJIrqo1tnGK94eO8
	 D6TfKOF7YAN1tbFpIh5A+BOtwgDnoy9jjr1Hph/AXwgdE8Qh0l7aBybe9pukcYtguWgR9
	 BvYRxyZxj3O2sG8v9gimUEzoBPG8JtUZ2LnILlXuY8hwumWKWRdqI2qZZ7UWESV2ggodz
	 L2Um33xi9cFH3F1JYYMZpnmbGqdz8wwq1OOXeitkTCTt44jxQb+UG5Dv0n9Olrti+XQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793132163;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=9X+oVS3zm4eo3ZX/NgjEV7Vj00EFX7hgo2unY8OKRf8=;
	b=DitiGhMCqjFKvfxqtftHmWeldR/N9RuGNijnKWBnRPVSyY8UoTC9sV/r73tK8glwAq7E
	 49xMM+x+vPhnbg6a+x2Zz0cGm9OFy0DapqMqhAB0eytQa51VDOSdiy1xFXoRfH4voN261
	 f6CTQkEgtDupKRl1lLDnkI28Z6Xriz1YnBd8Nuw55Ys16jqBgKTs68lgp20fZZ/oXbLvL
	 LbLgRQ72ittxZpq+HvpiLnE8G+HK43tboHPun4gfcwkVMoAtjKfcJwD7bnQ8Ipr4I2xzT
	 GNOpE/SgGXd8dXvat69Ucrmx6mu8Gc2kMJR66Pm95zIMx6v9f/FxyGkYYb782sE+dDw==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793132163;
	bh=9X+oVS3zm4eo3ZX/NgjEV7Vj00EFX7hgo2unY8OKRf8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=dUNoGD68uRxKecgVhzeNf5yrcYhU7vsv6qMB7qq/nH07CRpOcPTQ6l0L+6JbbdOOA
	 T6763ampE/Z4fhhY1JFD+dSKCV1x9tyRbwbDlvyKjcuqYtRNvhYrGxlEwCwrH98XVS
	 xBL4O3yMmNl1xGvpLrORO9J5ej87/Wln/rceWe9F8jmEvA24Gb2tKV4PxkuP8hocu9
	 k0eDpWOFAwVZogrDg/U7vZfTSzQulWRWZKoA1YVXfXakoJoz8/VOHa2D5NNJ1DrYq4
	 aVTo07NgZnR6c2RgoYRJLHA8Nxzd4VpGbXQG9doaPHbybxrlgM9dacDzV+JYqg8bz+
	 g7DXBXi47Lvbw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E7DA840712;
	Tue, 27 Oct 2026 20:16:02 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id BE0C1529
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:16:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AFE9640728
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:16:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wF95xgX8EiWz for <buildroot@buildroot.org>;
 Tue, 27 Oct 2026 20:16:01 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org DDCB240712
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793132160;
 b=d2jMMDkbnBBtBiNtBc3bGU7dny043mt4tBZ6E4omYGq6LqAryC/sS0gjFI9mh3yoaTR6
 71veYgFg+PWPY7x0OeGKMGL4zE4G3Ug1bwQFUqHuh/EfPrAJEFVBePLR+RzmQXWm9X1GZ
 odqU0SOWfTiGg6vEsXP2EMr7jmNnxUvd9dGvXzRdLc99ZWIXmejSDR1+j22Hlm69pUm5p
 oXfMp9U/uft/8CJxzpOtPI0VSaur3y6hLVkSKI+cWK0HeN2ZsoF/DC3wSwnSg1+V0DDVg
 MrSaIp8bR+klUNkBlaXg8q2otxFXtDBUIX+1T+kOmOG1xntCEfS7Zix8m/9g2MwuElw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793132160;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=SPC6Xy2JkPdN11NfSBC/LGOASMl3DvAIBQymJJhuXpA=;
 b=YRaydjwWylHpoLmW3PVbLEWQ5A+ujVF4kBVWiMVU/IH+jE53YO5/6/dvgcmixM+bx9Mp
 riydJif5RMZIL2l4Ea6NoZ7K5B44QTlELtsdE+pJhPtdFwsEWsnOfupRTbIokc1bvksX0
 XiidCSzg2J/LSYK2lFuz0jbejP57kBtn6mrKz0VQklj9V9/CXeOXnkRjEWueCA6Z8Ueyq
 Fnpkb8hPGT1Bz4P2S58D4wUsDIjJJlHJi4rxxommpx1JG+Xf5PJq2+egZ2LLCTTMEH4h7
 xiO88s8l8Fex/mfSzs/Fp3wDEMfmJXF72VtvNn5ExhUGX5og0l0IHcuDV0e9lY8kBTg==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DDCB240712
 for <buildroot@buildroot.org>; Tue, 27 Oct 2026 20:16:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5180B9D17B; Tue, 27 Oct 2026 20:14:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 27 Oct 2026 21:15:37 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 405f2ce36c6a4d2b43c1f2d79e5825e8d24afd96
X-Git-Newrev: 073c81c8cd233fa6e3a7067e3542ef0f56f28621
X-Patchwork-Hint: ignore
Message-Id: <20261027201434.5180B9D17B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/mender/x86_64/post-image-efi.sh: do
 not prepend artifact name to mender image
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/073c81c8cd233fa6e3a7067e3542ef0f56f28621
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Do not prepend ${COMPATIBLE_TYPES} to the user-specified artifact
name. Especially since compatible types can be added multiple times
to mender-artifact.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/mender/x86_64/post-image-efi.sh | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/mender/x86_64/post-image-efi.sh b/board/mender/x86_64/post-image-efi.sh
index a1dccb25b3..5f0b5a83ec 100755
--- a/board/mender/x86_64/post-image-efi.sh
+++ b/board/mender/x86_64/post-image-efi.sh
@@ -65,14 +65,14 @@ generate_mender_bootstrap_artifact() {
 
 # Create a mender image.
 generate_mender_image() {
-    echo "Creating ${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
+    echo "Creating ${BINARIES_DIR}/${ARTIFACT_NAME}.mender"
     "${HOST_DIR}/bin/mender-artifact" \
         write rootfs-image \
         --compression none \
         -c "${COMPATIBLE_TYPES}" \
         -n "${BR2_VERSION}" \
         -f "${BINARIES_DIR}/rootfs.ext2" \
-        -o "${BINARIES_DIR}/${COMPATIBLE_TYPES}-${ARTIFACT_NAME}.mender"
+        -o "${BINARIES_DIR}/${ARTIFACT_NAME}.mender"
 }
 
 generate_image() {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
