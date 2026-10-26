Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1DF606A31B
	for <buildroot@archiver.kernel.org>; Mon, 26 Oct 2026 21:33:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=GHqv6iBj
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6C39C605EF;
	Mon, 26 Oct 2026 21:33:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bk4zLyQV2e2N; Mon, 26 Oct 2026 21:33:43 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 92BC460607
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1793050423;
	b=NqArEptYZmWE2lI1TsbcXxgAdqmsiZenthpMTouig3rjISZzx0Yr6VDop3iCtra3Xg9W
	 gN80IqWgCRQyxatsmggFzdyhcoyUsMHabg9+Dm0IO7m1ijk0chSP3O5v2eGsYl9RTWou8
	 XGT0qkZZN1mwJgUtHe8o0QBPs09o7qUSbq834EFhbGQLEjZOpcYzFOoL6NoFYM/AeAGMi
	 6F5dizHQBjVITA2H5ok6l8I38Nsfi4y8qC3WgZgQbOUDBmZ8nEX2flSpecTfCaIkzwtNI
	 H9DGMn9rJbLMtxaZaF+DRoO7aqvSCd68hYs9T0PjOqtBYZPar6xYtOGNE/2L/eRjDWQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793050423;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=dWtY3F4+nAK7tg2u36MIk/gqvqGjvw+44h1Jq4+zEDA=;
	b=a+/dTfnd0P9qqLMf/H47BIwslJtjcf2eKLuYWDOHnIHkrexzpwEFxthY7IgGETyUhEag
	 Ox+KFwwE0Q4paWgy3bUoQnC5fikmPJNC20kUtUY4euV8KHgaZZML7R5nne5bdHE3KYe/h
	 /Sa8NIETkIM2z1AEFcpo3IgjxVTnzQx2Zw7mVTF5gioN+O/2T0akaAp8MVc/Ku1kBmUeW
	 vH+eQWZZBHyV8k+C8W+5joHYZQcljQDYxqJxQO7ooDKOZSnsguTuky9y7vvkGuVSb9Z6Y
	 IagMtxBMbzsxJEtyyQWFAbRBmnjeyS4Udxv/6Ob+Ckiqrh5+n5h4x0WaBgHK44MEvrg==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793050423;
	bh=dWtY3F4+nAK7tg2u36MIk/gqvqGjvw+44h1Jq4+zEDA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=GHqv6iBj49bJuD0Vwus1zQIUZtPoiXUnv9CMzvuuEREq3LgBwWp37fgdK8+3NZmRZ
	 ooQcrz/LtU8XcaSoTBa8Zkr2vVfnFcbT3MZ9wOe8FyTcWNPRKRe6xhnopoDDvKcDqV
	 Ezms1DQyTCT1M0LrEcTqhc+yREuP68Q6XXab9WzLz17W3tQclFh6wC8yCZp4m7uSco
	 aFehBNPdPzcNMhxrlbZwltKTD+IFz7jVuOZ4GqlHb9Sm64ol1RINQlgdxCmFF1SrRt
	 8ZYVV08cYlyFb4Otey7CaT4+YwuC5hCIEVvU+JyVOX22BEwU4hYzIWX0BjTA/ikBe5
	 5sH5W7vBR2w+A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 92BC460607;
	Mon, 26 Oct 2026 21:33:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B35503421
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A52FB40607
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RmG14V0sQj1s for <buildroot@buildroot.org>;
 Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 0B21340603
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793050422;
 b=tGVe8Gkyn6KjJuPSCHVtju631lPA2SwEjistPavqfoppchfRkyzSoTE80r6I0KKC0+be
 n4fhwjSUQ8Tr6gKHAELZzDUQeEmlyzrHV60rj4cQietdZON6PvvY+Cl7tBx/uTSZzTKvw
 nEfrtJD0klfhbqCNUQ9kT/oSKpmvQ/ytslOGxdpYY8B4vKId/p6213bsia35+wVDgSL8W
 Tdabe+qlbmAbNbw+zOUxdgtu+X3PHpsTezsNSE38l6aPwWTW4hniWLlP4o/J1qpPdH4my
 xU1YgiPh3nvAB4RbCUkqQTaJDqelxSSp/MnPWaz7NxPOIYh0Q6pn95Fpdv3pxg2FF8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1793050422;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=Tj8ODJBvtM6n6qvwWRQ2oaLcyJIZDqei24GI8q7NX64=;
 b=s2xyoJShiOk2+FMBUZJpGezwM0ihzXTTfboRv9XuT2dnmhwLAaQLmU6S9vDc4luCNQq8
 3iqbNE36mjF1Yo+RARmDmQfVtq2rtEovIYP7S0VTtn4d5+79IoYyA46Ncjad+5NURRHA6
 z+PQn5uNqqVjE3nXfsLfIr8h8PRJpdDJqGbaorUc2g4s3V/GOzO9NeV5VlPlnNPT3mtjO
 TG5fM2VJmG+L2r9RkIb42d0QngUDQSIJwk+xZq0nJJ1MlFurdfqlio5Z7NrA+2UVmd40a
 KEPH+W81YirMzYZ86RW0MUoWTTbV73ARQuDZLhS0S2sLhW3v6tFcC8lmxh0xKtGvqyQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B21340603
 for <buildroot@buildroot.org>; Mon, 26 Oct 2026 21:33:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EB8099D011; Mon, 26 Oct 2026 21:32:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 26 Oct 2026 22:33:16 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ffa18619fb2ed5820c1e89828fb5eac41cbe114f
X-Git-Newrev: 6ce28c57eb5f92cce815491fc463f168945daab3
X-Patchwork-Hint: ignore
Message-Id: <20261026213215.EB8099D011@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/engicam_px30_core_defconfig:
 require pkg_resources for binman
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6ce28c57eb5f92cce815491fc463f168945daab3
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The defconfig uses U-Boot 2025.04, so binman fails without
pkg_resources.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/engicam_px30_core_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/engicam_px30_core_defconfig b/configs/engicam_px30_core_defconfig
index be5c56e19f..d59effa96f 100644
--- a/configs/engicam_px30_core_defconfig
+++ b/configs/engicam_px30_core_defconfig
@@ -36,6 +36,7 @@ BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31=y
 BR2_TARGET_UBOOT_NEEDS_ATF_BL31_ELF=y
 BR2_TARGET_UBOOT_USE_BINMAN=y
+BR2_TARGET_UBOOT_BINMAN_NEEDS_HOST_PYTHON_PKG_RESOURCES=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.itb"
 BR2_TARGET_UBOOT_SPL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
