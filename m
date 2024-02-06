Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E94D2C4828D
	for <buildroot@archiver.kernel.org>; Tue,  6 Feb 2024 15:08:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A132A4094A;
	Tue,  6 Feb 2024 15:08:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A132A4094A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id CEj69tOHckbZ; Tue,  6 Feb 2024 15:08:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5FC384097A;
	Tue,  6 Feb 2024 15:08:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5FC384097A
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DD5521BF298
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:08:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B61184088E
 for <buildroot@lists.busybox.net>; Tue,  6 Feb 2024 15:08:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B61184088E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aDktDrhrUhL8 for <buildroot@lists.busybox.net>;
 Tue,  6 Feb 2024 15:08:44 +0000 (UTC)
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1AF840864
 for <buildroot@buildroot.org>; Tue,  6 Feb 2024 15:08:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B1AF840864
Received: from ymorin.is-a-geek.org (unknown [85.119.216.19])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id A6A6313F838;
 Tue,  6 Feb 2024 16:08:39 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Feb 2024 16:08:39 +0100
Date: Tue, 6 Feb 2024 16:08:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ismael Luceno <ismael@iodev.co.uk>
Message-ID: <ZcJLd7drFQn9tz6I@landeda>
References: <20240206144030.18329-1-ismael@iodev.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240206144030.18329-1-ismael@iodev.co.uk>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1707232121;
 bh=Fykxj7D97S2OSVnwXC32b1OQ+7M1247Ms2+PnjwmY/U=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XHGdx9PkaJsBFAClz7jzEejDacIiSCFhmCbchbdY6h7s/ckKfmjZLLKZHP858228n
 Y0jS2YU6wXcgFCCtxIjwxsqhm9nam4FXBbVcedsDM5/CHMnwBEfyeaLI0TU9Rb3fwc
 iIsDFQzR9HG+mhBRyxcVlD09rn0e1UX6yVdm+NoEJ5ikGQo6wvgvgxtA920y7eTnxV
 R1SJdWaL7JSmaa9lT9tgwRFmbozWjefhghdOjgTOKzPkxGJ+fo/daGiC63knPYRsKn
 Gptlveq7kl0er3gVRmOeD+W9QZWu3BRS24Ea1PJ33Fk16WZghb86SJgnzR2hqSASmP
 plW9y1pDiRotQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XHGdx9Pk
Subject: Re: [Buildroot] [RFC PATCH] docs/website: Add Makefile to
 pre-generate the website
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ismael, All,

On 2024-02-06 15:40 +0100, Ismael Luceno spake thusly:
> Supports the current includes plus smu [0] lightweight markup.
> 
> [0] https://github.com/Gottox/smu
> Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> ---
[--SNIP--]
> diff --git a/docs/website/Makefile b/docs/website/Makefile
> new file mode 100644
> index 000000000000..b0a56919c0e7
> --- /dev/null
> +++ b/docs/website/Makefile
> @@ -0,0 +1,33 @@
> +.PHONY: all
> +all:
> +
> +# Avoid implicit rules
> +MAKEFLAGS += -r
> +
> +AWK ?= mawk

Make that gawk, so that we can do [0] (see below)

> +SRCDIR := ${CURDIR}

Use parentheses not curly braces, to expand variables in Makefiles,
like we do everyelse in Buildroot: $(..)

(yes, both are valid, but lets be consistent throughout our code base)

> +DEPLOYDIR := ${CURDIR}/out
> +
> +src-pages != find ${SRCDIR} -maxdepth 1 -name \*.html -o -name \*.smu
> +dst-pages := ${src-pages:${SRCDIR}/%=${DEPLOYDIR}/%}
> +dst-pages := ${dst-pages:.smu=.html}
> +
> +all: ${dst-pages}
> +
> +conf-files := ${MAKEFILE_LIST}
> +conf-files += $(wildcard ${HOME}/.tidyrc)
> +conf-files += ${SRCDIR}/incfile.awk
> +
> +${DEPLOYDIR}/%.html: ${SRCDIR}/%.html ${conf-files}
> +	mkdir -p "${@D}"
> +	tmpfile=$$(mktemp) && \
> +	${AWK} -f incfile.awk $< > "$$tmpfile" && \
> +	{ tidy -q -m -i "$$tmpfile"; :; } && \
> +	mv "$$tmpfile" $@
> +
> +${DEPLOYDIR}/%.html: ${SRCDIR}/%.smu ${conf-files}
> +	mkdir -p "${@D}"
> +	tmpfile=$$(mktemp) && \
> +	smu < $< | ${AWK} -f incfile.awk | tidy -q -m > "$$tmpfile" && \

What is the rationale for using smu and tidy to do the deployement?
We don't need/want to minimify the content...

> +	mv "$$tmpfile" $@
> diff --git a/docs/website/incfile.awk b/docs/website/incfile.awk
> new file mode 100644
> index 000000000000..350a88e7b956
> --- /dev/null
> +++ b/docs/website/incfile.awk
> @@ -0,0 +1,23 @@
> +BEGIN {
> +	FS="\""
> +}
> +
> +{
> +	do {
> +		if (match($0, /^<!--#include file="([^"]*)" *-->$/)) {
> +			file_stack[++file_cur] = $2
> +		} else {
> +			print
> +		}
> +		if (file_cur) {
> +			e = getline < file_stack[file_cur]
> +			if (!e) {
> +				--file_cur
> +			} else if (e == -1) {
> +				printf "%s: read error\n", \
> +					file_stack[file_cur] \
> +					> "/dev/stderr"

[0] In case of error, we do want to exit in error and be sure this is
caught at the Makefile level; by using gawk, you can call:

    exit 42

Regards,
Yann E. MORIN.

> +			}
> +		}
> +	} while (file_cur)
> +}
> -- 
> 2.43.0
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
