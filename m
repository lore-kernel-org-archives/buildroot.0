Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D068A606A31F
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 12:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=hmwdgsYd
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5DA6814C2;
	Fri, 23 Oct 2026 12:24:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024)
 with UTF8SMTP id D_H3yXJejbfe; Fri, 23 Oct 2026 12:24:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 264C48125F
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792758286;
	b=LVoGUWpp12Q3NNqsb9C4sykaEhmUv/6j0zSnAudaT/2qwTu0i5/nBEE9ziGaF60HJrB8
	 MlfsXHKG76s0iJQYqLT0bacgRe+zInG22tWcpYEUe0bjl+J5NsmyYPr3ZRvzgXj1nQtwn
	 35j31b5mfYgjWPlqb8hL8fqAVwi4Cf7hScEduXYSjzIggVPfIQCzFknUHmKMy0M/qZ48l
	 ql6i4/NyZIBupWRGBMKmeHjzOpDYmtPYdqfRcD01ZXTirl3NIjipFJ77/7lPDjFg9iyab
	 NOgViw2tz0E+rVN3B6Cu1vVEvxUVBB/9WC4dfLzHQNHM6GuptWhRx6E4sXrWOGKdluA==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792758286;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:Errors-To:
	 Sender;
	bh=tJUn0SB4kQ0ifJnIjt7Yhr1JSYON1v68vJQQ5zlXBJ0=;
	b=rnQBFNIinNDQnaLdPcpsQZHy7IEz+W5xWIt/HKwgRFoUkYgjeJYkSy7YrLDWqjXzltyS
	 EHo00DfKLgNvM/8cFUAGXJgdqpbhGHI/puFGCE4PoLiWSbcBaYRP9PS/Pn/AkwkgwD6BJ
	 5DI2DMFpg1PkwDvzQGahE7Vkp4JiAuRKv8pGvMcBN6Utz6jqvHQBSfRvqNtt/fU2n5IrC
	 vmv9CutXqi4T0Vyq+qEpfQUhS0Wti1U+ak3h8g7QxGQCNWHLTXMUlb4bSXNQ5+MYe3mu4
	 zuXcHmYijZxw6+KuipKJv0rxaTvbUksFxec7glcJ6AFVieccWMQVomfBLlN1mK85swQ==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792758286;
	bh=tJUn0SB4kQ0ifJnIjt7Yhr1JSYON1v68vJQQ5zlXBJ0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=hmwdgsYdwto6gIVBzTJZLaPZVvGPKAK0BV0iVPOUtzYoDZM4yQa7vHTWZ6hfHrPBS
	 3Y7pCa7OWic3sWLZYJ1/L4siCRG30KiZEyyomH+dB/zorL6lR3Ho1EjUM0bv86GY+J
	 ir4PL4iMb6mAmw2KuHC0cRYwL+QzvUhAqlg3iITYlwFzMROP3s8BQagB4v8v94iiA7
	 HrLttXGG0q7+BwVhimdKvQUbPTlS7akfCELLQyTCyR0vRiMZv6dQclrX1FoDuGfoDD
	 V1oCwaJp7qQkSxWEMmIZi+VV78Xow5EMEck0lGt7w5mWimXwm4kK5ey7xpKi32qWOS
	 /ngAY9kl5MwJw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 264C48125F;
	Fri, 23 Oct 2026 12:24:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0019023A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E5DBE40810
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6wc0xo_uoIH7 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 12:24:35 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 4D9244072E
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792758275;
 b=mjxocRgJB7Qy+OWvZHuiHYdiUqhfaXhVAyjfYVGb2uLdQd7vZbpw2MYWDxJHLb5AwAQ3
 yW65FmCCxilOa0u0F+tv54aJd5LQXX52RKZaYQnOqu8MZZxaDce82juPf0zT1BaUzS6lV
 SqHuDuDfNBX0ACDSektVyrbXsl0waiAbAnIeST9pV1uvGUSkuACFNE6+1iKxE7BkHVU+0
 SYvbaJOQFP1+N02OENDtn8MbibPvP+wY10rZJSlXcmn7rQOyS3s+t39N3dfOx3azGfUYE
 c79/kKMD6lVwRjpCGEPAVDBoR3NSJO6SrgJbGs+Q5OYiyFUcSXmG31ooZF5dcvTT+jA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792758275;
 h=X-Comment:Received:From:To:Date:Subject:X-Git-Refname:X-Git-Oldrev:
 X-Git-Newrev:X-Patchwork-Hint:Message-Id;
 bh=fD6BjJtDxFlWa8XwQBxVtef8oLfSnXqf62IUT/3s1iU=;
 b=PV1pf+61HaREJg48qJOMaeR3ePutg+IeeWlUATlODIG4UJaYjUvMsTv2Ph7zdbcoPLSq
 u2gUGk0k0ib97LaljpLTyXNCpugLXa+QOmL0H7Um7ARx4PEbvzdhRUbClD8LyG7YZ0heN
 5ARx/4s/lOMMVeq+KFcQeMGLeuKgJyisZx6UfSqO4jFLxOMEH2zs8c72yP3ZwbYm0CxuB
 BTZmaMg/OAlJ40S2XqpWzV4PBhFh8oNnASZnX7jj68B4hzy865i4qEoTBa67Oz6VtYDDe
 B3FcIJCAmPcQ1ptvqn7HceplsukaM3BmzcLgSTheopjyHNPeZQu3Gjnwfymrm8WMgUw==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
 arc=none smtp.remote-ip=140.211.167.122
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4D9244072E
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 12:24:35 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C8FB99C669; Fri, 23 Oct 2026 12:23:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 22 Oct 2026 20:49:52 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 6fd4d25da2f48ead295fe8a5e3658fba7f558d4d
X-Git-Newrev: c13a5feeaf1cea3e233af2f6adfe3df23f912a0e
X-Patchwork-Hint: ignore
Message-Id: <20261023122310.C8FB99C669@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 board/librecomputer/lafrite/readme.txt: document SPI flash dependency
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?b?UmFwaGHvv73vv71sIE3vv73vv71sb3R0ZSB2aWEgYnVpbGRyb290?=
 <buildroot@buildroot.org>
Reply-To: Raphaël Mélotte <raphael.melotte@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============7193815521450734099=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	PP_MIME_FAKE_ASCII_TEXT,SPF_HELO_NONE autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7193815521450734099==
Content-Type: text/plain

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c13a5feeaf1cea3e233af2f6adfe3df23f912a0e
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

Running a modern kernel with old A-TF/U-Boot leads to various issues.  Add a
note about updating the bootloader in the SPI flash.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
(cherry picked from commit 37ef3af415a830a2eb136704816b3d9735d2945d)
Signed-off-by: Raphaël Mélotte <raphael.melotte@mind.be>
---
 board/librecomputer/lafrite/readme.txt | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
index 86afa855e6..8747a9a23f 100644
--- a/board/librecomputer/lafrite/readme.txt
+++ b/board/librecomputer/lafrite/readme.txt
@@ -6,6 +6,14 @@ s805x SoC (quad A53), 512MB/1GB DDR4 and a 16MB SPI NOR flash:
 
 https://libre.computer/products/boards/aml-s805x-ac/
 
+Ensure the the bootloader in the SPI flash is up-to-date. Updates are
+available at:
+
+https://boot.libre.computer/release/aml-s805x-ac/
+
+To update, write aml-s805x-ac-spiflash.img to a USB flash drive and
+boot it as described below.
+
 How to build it
 ===============
 

--===============7193815521450734099==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7193815521450734099==--
