Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD69D10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA544402D5;
	Sat, 26 Oct 2024 14:29:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JfcPqGHE5Ae7; Sat, 26 Oct 2024 14:29:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B2414039B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B2414039B;
	Sat, 26 Oct 2024 14:29:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id A5E362318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:29:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 943CA40363
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:29:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8a2eOlbFV7Kh for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:29:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 60C3A402D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 60C3A402D5
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 60C3A402D5
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:29:00 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 11CDDE0005;
 Sat, 26 Oct 2024 14:28:56 +0000 (UTC)
Date: Sat, 26 Oct 2024 16:28:56 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Cc: buildroot@buildroot.org, Marcus Folkesson <marcus.folkesson@gmail.com>,
 Kamel Bouhara <kamel.bouhara@gmail.com>, Marcin Niestroj
 <m.niestroj@grinn-global.com>, Asaf Kahlon <asafka7@gmail.com>, Julien
 Olivain <ju.o@free.fr>, Woodrow Douglass <wdouglass@carnegierobotics.com>,
 Christian Stewart <christian@aperture.us>, Robert Rose
 <robertroyrose@gmail.com>, Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20241026162856.720a54b9@windsurf>
In-Reply-To: <20240924023919.1502635-2-james.hilliard1@gmail.com>
References: <20240924023919.1502635-1-james.hilliard1@gmail.com>
 <20240924023919.1502635-2-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1729952937;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Wx0YeefZVJ+Smid1HEkb3vTNTfUELvOu3ARLr1nNeXA=;
 b=aDfOA0/mJYAQSTiFI+nWt2Kd4c+gbmOX9EKsmC266Uk3n4AH3fCr/NA+wz+M4Z7Z7vn6Bx
 wyYyzLK2kFmiD4+RikcB2LEje/Cj642aQAShOZRCGaQA4DVBlmR12Nh3DvA8mVIegu+oqW
 bAY+PfARgJoT06/pL5S8IR1oLY/ivhZycQdjmjkSb1qXewm15WRwLrpWMk+8TT8cXyo7Ya
 Xp9/dInN1Prh6UgGf1yC+Fg0ZNKFEivKthygGMwax5zmprSZRHcvZC/u8wK48KyqW+/ELr
 2Klqh7B70nM48C1Yz+osqG5gvBycjMHpOxuNbfLyKQfrX6CQNxQW0tRluOdiZw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=aDfOA0/m
Subject: Re: [Buildroot] [PATCH v2 2/3] package/libabseil-cpp: bump to
 version 20240722.0
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Mon, 23 Sep 2024 20:39:18 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/libabseil-cpp/libabseil-cpp.hash | 2 +-
>  package/libabseil-cpp/libabseil-cpp.mk   | 2 +-
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
