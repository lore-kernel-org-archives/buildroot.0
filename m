Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488B3C001E0
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 21:23:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EA9E040BD9;
	Wed, 26 Jul 2023 21:23:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EA9E040BD9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VjMgC_aJx46x; Wed, 26 Jul 2023 21:23:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A37540BCC;
	Wed, 26 Jul 2023 21:23:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3A37540BCC
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C1D7B1BF423
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:23:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8E6FC40BCC
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 21:23:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E6FC40BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RZPzOjuwUfhc for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 21:23:11 +0000 (UTC)
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::229])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7E35C40BC2
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 21:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E35C40BC2
Received: by mail.gandi.net (Postfix) with ESMTPSA id 63827FF804;
 Wed, 26 Jul 2023 21:23:09 +0000 (UTC)
Date: Wed, 26 Jul 2023 23:23:08 +0200
To: Yair Ben-Avraham via buildroot <buildroot@buildroot.org>
Message-ID: <20230726232308.684470d7@windsurf>
In-Reply-To: <3BZE266B89j-Oimbd_8h4tun1G60GrejVfGJajLoDnLBoJ56dpXbbiDB5cz75lracrEQCyPa8GTVynXu27sk3-16XX72SRO_X-dJ8cmJXLs=@protonmail.com>
References: <3BZE266B89j-Oimbd_8h4tun1G60GrejVfGJajLoDnLBoJ56dpXbbiDB5cz75lracrEQCyPa8GTVynXu27sk3-16XX72SRO_X-dJ8cmJXLs=@protonmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1690406589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rfQ+W1ne0paSDOSVLzWj9QmJQudbHUPqcc9YcmBLwpA=;
 b=B0wmv18WlmJbxizhB59U2HBNqu+2U8KzLv9RsbRXkHcL6Qs4bDwa4dcNqse0ht7O46AQC2
 lrbQbZla9RYRnJZJkGEMhASrlCHr/jKiVxppDTDmb0fOGxF9vsoDK2/3cXwKg3Niu1dDKP
 eU55rjwPWG7EE6/gRy6n9EF5F/sABkED3qSjXwa9f+ho24O4hhamQ7cxDExshMFs4amQ1M
 QT6HRkoXSFap0a/v12g4+Z9uxRaz+vUmYcNNFRSAhDpz/rQs8yQ6CL3FmPUZ4sLSaGZN3N
 4g1K9IRrtFTvg8Rp0jQO2h5LYKOfjAOeq5L2uTfebgLcwO8PHnZTFns0XpXg/Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=B0wmv18W
Subject: Re: [Buildroot] [PATCH 1/1] package/tpm2-pkcs11: bump version to
 1.9.0
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
Cc: Yair Ben-Avraham <yairba@protonmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Fri, 09 Jun 2023 03:37:43 +0000
Yair Ben-Avraham via buildroot <buildroot@buildroot.org> wrote:

> Signed-off-by: Yair Ben-Avraham <yairba@protonmail.com>
> ---
>  package/tpm2-pkcs11/tpm2-pkcs11.hash | 2 +-
>  package/tpm2-pkcs11/tpm2-pkcs11.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
