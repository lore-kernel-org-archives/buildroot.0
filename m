Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D07CC433EF
	for <buildroot@archiver.kernel.org>; Tue, 19 Apr 2022 12:26:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5998E40C64;
	Tue, 19 Apr 2022 12:26:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1daCPJfqsvj; Tue, 19 Apr 2022 12:26:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5750D40C58;
	Tue, 19 Apr 2022 12:26:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0662A1BF288
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:26:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E797640C58
 for <buildroot@lists.busybox.net>; Tue, 19 Apr 2022 12:26:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id N8IUxiPEgBDA for <buildroot@lists.busybox.net>;
 Tue, 19 Apr 2022 12:26:39 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [217.70.183.200])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 89C1540125
 for <buildroot@buildroot.org>; Tue, 19 Apr 2022 12:26:39 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id A98852000F;
 Tue, 19 Apr 2022 12:26:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1650371196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MxbcO+lrbGZ9dj38h5jPG3WSopR5+/B//Up5eTb73Bs=;
 b=QatEKl9qhuyQYDzH+Nvq31/btcZS84zasDVpjqP4UZQQtNLH5nt3oEi2d1q730yt6K8QBM
 iDtbRB+Iw7JyBYT++EdscZWTdXJqkcq/Qqo8oVQcVBXxv8c4/1VBTnZHZS6AFl2MD8eoOh
 CFnO9bDLNdLhscdBLt8bgHjzHm4aTntWtRSkgRcG3mPKOH9MmttEW0EsR8UWsma/Nu+B7h
 HRVdki7lEkDIQhG70+WFiAhsdpkHXwvVftod4dQbmVGAd6+tKERVMT2vjN254rDOvnMdlt
 1fL7oCXuiCkPIL9kyR+y/2urJ5fYoXErzJEgvvZdqwQaYDcBbjF8pG97GV3BKQ==
Date: Tue, 19 Apr 2022 14:26:35 +0200
To: Thomas Perrot <thomas.perrot@bootlin.com>
Message-ID: <20220419142635.008ac004@windsurf>
In-Reply-To: <20220419092151.91638-3-thomas.perrot@bootlin.com>
References: <20220419092151.91638-1-thomas.perrot@bootlin.com>
 <20220419092151.91638-3-thomas.perrot@bootlin.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 2/2] package/imx-cst: add new package
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Thomas,

On Tue, 19 Apr 2022 11:21:51 +0200
Thomas Perrot <thomas.perrot@bootlin.com> wrote:

>  N:	Thomas Perrot <thomas.perrot@bootlin.com>
>  F:	package/byacc
> +F:	package/imx-cst

Trailing slash needed.

> diff --git a/package/imx-cst/Config.in.host b/package/imx-cst/Config.in.host
> new file mode 100644
> index 000000000000..84cb825e59cf
> --- /dev/null
> +++ b/package/imx-cst/Config.in.host
> @@ -0,0 +1,8 @@
> +config BR2_PACKAGE_HOST_IMX_CST
> +	bool "host imx-cst"
> +	help
> +	  I.MX code signing tool provides software code signing
> +	  support designed that integrate the HABv4 and AHAB
> +	  library.
> +
> +	  https://www.nxp.com/webapp/sps/download/license.jsp?colCode=IMX_CST_TOOL

When I go to this page, I need to agree to a "SOFTWARE LICENSE
AGREEMENT i.MX CODE SIGNING TOOL", but then your .mk is pointing to a
non-NXP Git repository, and you state the license is BSD-3-Clause.

> +# debian/3.3.1+dfsg-2
> +IMX_CST_SITE = https://gitlab.apertis.org/pkg/imx-code-signing-tool.git

What is this location? Just someone who put the NXP code online? Or a
separate implementation?

> +IMX_CST_SITE_METHOD = git
> +IMX_CST_VERSION = e2c687a856e6670e753147aacef42d0a3c07891a
> +IMX_CST_LICENSE = BSD-3-Clause
> +IMX_CST_LICENSE_FILES = LICENSE.bsd3

There are two other license files in this Git repo, the hidapi license
and the OpenSSL license. You are confident they are not relevant? Would
be worth explaining that.

> +HOST_IMX_CST_DEPENDENCIES = host-byacc host-flex host-openssl
> +
> +define HOST_IMX_CST_BUILD_CMDS
> +	$(HOST_MAKE_ENV) $(MAKE) $(HOST_CONFIGURE_OPTS) \
> +		OSTYPE=linux64 \

Would be useful to explain why linux64 is fine even on 32-bit host
platforms. Actually, when I look at
https://gitlab.apertis.org/pkg/imx-code-signing-tool/-/blob/apertis/v2023dev2/code/cst/code/obj.linux64/Makefile
I believe that using OSTYPE=linux64 on 32-bit host machines will not
work, as it adds -m64 to the compiler flags.

> +		ENCRYPTION=yes \
> +		COPTIONS="$(HOST_CFLAGS) $(HOST_CPPFLAGS)" \
> +		LDFLAGS="$(HOST_LDFLAGS) -lcrypto" \
> +		PWD=$(@D)/code/cst \
> +		CC="$(CC) -I../../code/common/hdr \
> +			-I../../code/back_end/hdr \
> +			-I../../code/srktool/hdr \
> +			-I../../code/front_end/hdr \
> +			-I../../code/convlb/hdr" \

This looks strange. Flags are normally passed using CFLAGS, and $(CC)
in Buildroot doesn't exist, it's $(HOSTCC) that should be used.

Also, I think the list of header paths is properly set with:

CINCLUDES := $(SUBSYS:%=-I$(CST_CODE_PATH)/%/hdr)

but it gets overridden by the fact that you override CFLAGS.

I believe there's a better way, let me have a look.

> +		LD=$(CC) \

$(CC) doesn't exist, it should be $(HOSTCC).

> +		-C $(@D)/code/cst \
> +		build

Best regards,

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
