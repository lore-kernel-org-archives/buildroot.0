Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E095C433F5
	for <buildroot@archiver.kernel.org>; Sat,  4 Dec 2021 21:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EA89583123;
	Sat,  4 Dec 2021 21:49:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id j-zhsYxJ3JUV; Sat,  4 Dec 2021 21:49:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 60EE8831A9;
	Sat,  4 Dec 2021 21:49:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 878901BF36B
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:49:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74E1F40156
 for <buildroot@lists.busybox.net>; Sat,  4 Dec 2021 21:49:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsBF1rrPbasx for <buildroot@lists.busybox.net>;
 Sat,  4 Dec 2021 21:49:05 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D80D400E9
 for <buildroot@buildroot.org>; Sat,  4 Dec 2021 21:49:05 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id 6A4C4E0009;
 Sat,  4 Dec 2021 21:49:03 +0000 (UTC)
Date: Sat, 4 Dec 2021 22:49:02 +0100
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20211204224902.150717d3@windsurf>
In-Reply-To: <20211127113735.2178776-7-james.hilliard1@gmail.com>
References: <20211127113735.2178776-1-james.hilliard1@gmail.com>
 <20211127113735.2178776-7-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 7/7] package/python-weasyprint: new package
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
Cc: Asaf Kahlon <asafka7@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Sat, 27 Nov 2021 04:37:35 -0700
James Hilliard <james.hilliard1@gmail.com> wrote:

> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/Config.in                               |  1 +
>  package/python-weasyprint/Config.in             | 17 +++++++++++++++++
>  .../python-weasyprint/python-weasyprint.hash    |  5 +++++
>  package/python-weasyprint/python-weasyprint.mk  | 14 ++++++++++++++
>  4 files changed, 37 insertions(+)

Entry in DEVELOPERS file was missing.

> +config BR2_PACKAGE_PYTHON_WEASYPRINT
> +	bool "python-weasyprint"
> +	depends on BR2_PACKAGE_PYTHON3
> +	select BR2_PACKAGE_PYTHON_CFFI # runtime
> +	select BR2_PACKAGE_PYTHON_CSSSELECT2 # runtime
> +	select BR2_PACKAGE_PYTHON_FONTTOOLS # runtime
> +	select BR2_PACKAGE_PYTHON_BROTLI # runtime
> +	select BR2_PACKAGE_PYTHON_ZOPFLI # runtime
> +	select BR2_PACKAGE_PYTHON_HTML5LIB # runtime
> +	select BR2_PACKAGE_PYTHON_PILLOW # runtime
> +	select BR2_PACKAGE_PYTHON_PYDYF # runtime
> +	select BR2_PACKAGE_PYTHON_PYPHEN # runtime
> +	select BR2_PACKAGE_PYTHON_TINYCSS2 # runtime

Alphabetic ordering is preferred.

Applied to next after fixing those two minor issues. Thanks!

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
