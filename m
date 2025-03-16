Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC41C282DE
	for <buildroot@archiver.kernel.org>; Sun, 16 Mar 2025 20:33:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8460682004;
	Sun, 16 Mar 2025 20:33:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ur4fkLGQPoTP; Sun, 16 Mar 2025 20:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 67AA282014
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67AA282014;
	Sun, 16 Mar 2025 20:33:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 1E34916E
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1905F81FFC
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id T6NZXhKTU4OO for <buildroot@buildroot.org>;
 Sun, 16 Mar 2025 20:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.27.42.6;
 helo=smtp6-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org D9AC081FFA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9AC081FFA
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D9AC081FFA
 for <buildroot@buildroot.org>; Sun, 16 Mar 2025 20:33:33 +0000 (UTC)
Received: from webmail.free.fr (unknown [172.20.246.2])
 (Authenticated sender: ju.o@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPA id AA3B8780331;
 Sun, 16 Mar 2025 21:33:23 +0100 (CET)
Received: from 2a01:e0a:485:b220:8213:2270:4a8d:a1d5
 via 2a01:e0a:485:b220:8213:2270:4a8d:a1d5 by webmail.free.fr
 with HTTP (HTTP/1.0 POST); Sun, 16 Mar 2025 21:33:23 +0100
MIME-Version: 1.0
Date: Sun, 16 Mar 2025 21:33:23 +0100
From: Julien Olivain <ju.o@free.fr>
To: Vladimir Oltean <olteanv@gmail.com>
Cc: buildroot@buildroot.org, Ioana Ciornei <ciorneiioana@gmail.com>, Brandon
 Maier <Brandon.Maier@collins.com>, Vincent Jardin <vjardin@free.fr>, Romain
 Naour <romain.naour@smile.fr>, Akhilesh Nema <nemaakhilesh@gmail.com>
In-Reply-To: <20250302215219.1276480-8-olteanv@gmail.com>
References: <20250302215219.1276480-1-olteanv@gmail.com>
 <20250302215219.1276480-8-olteanv@gmail.com>
User-Agent: Webmail Free/1.6.10
Message-ID: <eb97b1c9f855846fa3ec2ec8b6332616@free.fr>
X-Sender: ju.o@free.fr
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1742157210;
 bh=7i/yADVreFYt8CRiu9fBZFrYMlEZSbdORfU9vUvTe1w=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=AsyYSArnPhdcAIJ9pXkFxqkUpsQztBY4JRyOA0w65Z33oPf9O4fvvmdtDJQXc46xc
 l885n17cJbkpXkE8huI07Z5Wkx0cVY/SuhKeFvNIKIh+5ujmDxXcgcaWJaWIZ1PIxr
 QLeC9j0uRiVNtVi1xYoHLW2+Lg14c05fOejA3AiXtdcYPk7wY+OXtPb7SM96ndtF1m
 2RlkhG7uCi79o26mconc6w2OZBdXstj/VulPgvPvA97wpdxvphkI/LqeP1DY3ZchSp
 zQa73P624XGgbVFRCJUvejGHmUxl1NNmKBxnvmAN9sAp3sG6nhp+6bssIQ9ptMAJSI
 BlRHTjoKc9Wlw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AsyYSArn
Subject: Re: [Buildroot] [PATCH 07/15] package/qoriq-restool: new package
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Vladimir,

On 02/03/2025 22:52, Vladimir Oltean wrote:
> Introduce a package for the restool program, which permits the user to
> modify the network configuration of the DPAA2 subsystem and create one
> that is adequate to their use case.
> 
> Signed-off-by: Vladimir Oltean <olteanv@gmail.com>

[...]

> diff --git a/package/qoriq-restool/qoriq-restool.mk 
> b/package/qoriq-restool/qoriq-restool.mk
> new file mode 100644
> index 000000000000..6b9db59fbc8c
> --- /dev/null
> +++ b/package/qoriq-restool/qoriq-restool.mk
> @@ -0,0 +1,24 @@
> +################################################################################
> +#
> +# qoriq-restool
> +#
> +################################################################################
> +
> +QORIQ_RESTOOL_VERSION = lf-6.6.36-2.1.0
> +QORIQ_RESTOOL_SITE = $(call 
> github,nxp-qoriq,restool,$(QORIQ_RESTOOL_VERSION))
> +QORIQ_RESTOOL_LICENSE = BSD-3-Clause or GPL-2.0-or-later
> +QORIQ_RESTOOL_LICENSE_FILES = COPYING
> +
> +QORIQ_RESTOOL_MAKE_OPTS = \
> +	CC="$(TARGET_CC)" \
> +	CROSS_COMPILE="$(TARGET_CROSS)"
> +
> +define QORIQ_RESTOOL_BUILD_CMDS
> +	cd $(@D) && $(TARGET_MAKE_ENV) $(MAKE) $(QORIQ_RESTOOL_MAKE_OPTS)

It seems that restool needs pandoc to generate the man page.

Building in the Docker image with command:

     utils/docker-run make qoriq-restool

Fails with error:

     pandoc --standalone --to man restool.md -o restool.1
     make[1]: pandoc: No such file or directory

See:
https://github.com/nxp-qoriq/restool/blob/lf-6.6.36-2.1.0/Makefile#L56

The package host-pandoc does not exist in Buildroot (this would
pull too many dependencies just for one man page).

The restool package does not seem to have a way to disable the man
page generation/installation. So it is likely a small package patch
is needed here to do that (ideally, something that can be proposed
upstream).

Could you have a look to fix this issue, please?

> +endef
> +
> +define QORIQ_RESTOOL_INSTALL_TARGET_CMDS
> +	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DESTDIR=$(TARGET_DIR) prefix=/usr 
> install
> +endef
> +
> +$(eval $(generic-package))
> --
> 2.43.0

Best regards,

Julien.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
