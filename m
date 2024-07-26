Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0851CC3DA63
	for <buildroot@archiver.kernel.org>; Fri, 26 Jul 2024 07:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC70B40940;
	Fri, 26 Jul 2024 07:33:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jYCNFCz7LgGB; Fri, 26 Jul 2024 07:33:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5D7C340944
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5D7C340944;
	Fri, 26 Jul 2024 07:33:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CECBF1BF311
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:33:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BCBC881F76
 for <buildroot@lists.busybox.net>; Fri, 26 Jul 2024 07:33:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id u1QucVSbZHCJ for <buildroot@lists.busybox.net>;
 Fri, 26 Jul 2024 07:33:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9334581F75
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9334581F75
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9334581F75
 for <buildroot@buildroot.org>; Fri, 26 Jul 2024 07:33:45 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7AF1C0004;
 Fri, 26 Jul 2024 07:33:43 +0000 (UTC)
Date: Fri, 26 Jul 2024 09:33:42 +0200
To: Brandon Maier via buildroot <buildroot@buildroot.org>
Message-ID: <20240726093342.67e2aba8@windsurf>
In-Reply-To: <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
References: <20240724-revert-output-gitignore-v1-0-510a2795884c@collins.com>
 <20240724-revert-output-gitignore-v1-1-510a2795884c@collins.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1721979223;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LEogVfjob5fZRYGY88TwLdNdmxjnJLOzSaA9KxYJL+4=;
 b=dnSz31ygzVzEYcj7pqXnuYVtFFVEBAQBlJz5stBVyw5c75SF8QZj4MYeEVFVk2fzqROrV5
 JHtz26XFxbAZdGJ/TEfXyDbYkAaSjYOLwlirqaGf6zJXeIz8wTqOuMAFh8DQJ6DF43OnOA
 EHTj6UEhs/3/fNkDpLKimUrBxSZXgKJN8/r9nV5PUd9BJQLJE51e8sYvDyn61tpWV3Pqge
 iZUqTQNtI7KpQVotBdJVRilwYWVb7DNGS+7BJ0b+QICxZHXMoxBrFsA1cMpkjDZrWa0cvV
 4ph+732tRy/AwY6Mof8Z7cttgduyUNZ3+HPevV//LJPV4Bn+EH7HPHoImFTocg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=dnSz31yg
Subject: Re: [Buildroot] [PATCH 1/2] Revert "Create a .gitignore file in the
 CANONICAL_O directory"
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Romain Naour <romain.naour@gmail.com>, Bryan Brattlof <bb@ti.com>,
 Brandon Maier <brandon.maier@collins.com>,
 Marcus Hoffmann <buildroot@bubu1.eu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Wed, 24 Jul 2024 21:23:20 +0000
Brandon Maier via buildroot <buildroot@buildroot.org> wrote:

> The packages 'python-jsonschema-specifications', 'pydantic-core', and
> likely other packages based on Python maturin silently stopped
> installing files to the host and target directories after commit
> a14c862c08.
> 
> A similar issue was reported by the Conda project[1]. It seems some
> build tools scan for gitignore files to decide what files to build
> and install.
> 
> I attempted various combinations of gitignore patterns including
> mimicking the Conda project's gitignore[2], but the only thing that has
> worked reliably is the original `/output` ignore in the root Buildroot
> directory.
> 
> This reverts commit a14c862c08865e053d5fce90a0d0323b8f9e4bc0.
> 
> [1] https://github.com/PyO3/maturin/issues/1911
> [2] https://github.com/conda-forge/conda-smithy/blob/main/conda_smithy/feedstock_content/.gitignore
> Reported-by: Bryan Brattlof <bb@ti.com>
> Signed-off-by: Brandon Maier <brandon.maier@collins.com>
> ---
>  .gitignore | 1 +
>  Makefile   | 3 ---
>  2 files changed, 1 insertion(+), 3 deletions(-)

Thanks, both applied. Of course, I'm not a huge fan of PATCH 2/2,
because there's really no reason for output folders to be called
"output<something>", but until we can create the .gitignore file in the
output folder itself, I guess this is a reasonable workaround to allow
people to create multiple output directories that are ignored.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
