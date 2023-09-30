Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 024A2E732D6
	for <buildroot@archiver.kernel.org>; Sat, 30 Sep 2023 18:55:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 42681415BE;
	Sat, 30 Sep 2023 18:55:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 42681415BE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vV4pNqEuuvE9; Sat, 30 Sep 2023 18:55:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 725DE4154D;
	Sat, 30 Sep 2023 18:55:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 725DE4154D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 66BAF1BF2A7
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 361264154D
 for <buildroot@lists.busybox.net>; Sat, 30 Sep 2023 18:55:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 361264154D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SIYszezuB7IB for <buildroot@lists.busybox.net>;
 Sat, 30 Sep 2023 18:55:08 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B2AE240195
 for <buildroot@buildroot.org>; Sat, 30 Sep 2023 18:55:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2AE240195
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A611E0005;
 Sat, 30 Sep 2023 18:55:03 +0000 (UTC)
Date: Sat, 30 Sep 2023 20:55:01 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20230930205501.60ee0752@windsurf>
In-Reply-To: <20230609174955.409551-1-romain.naour@gmail.com>
References: <20230609174955.409551-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1696100103;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lDBxdNvEwx3/pgJEC53XsgsGZeHup26jhc8NnNB6AYM=;
 b=Yx5ZSUkvc9EGNPQ32PdXWoNY2Kw0nu9YH1c0tP0B1qhuiC1H+3tCOBGZDB/OnwyfHvb8b4
 DFd3IYB53lcsK7oPxwr6DjvwXVXkgtub3GxRS8bALLf3SQeMZf1iyn39F6iUD3l4fjqSKD
 zLwhBjoYtlJDTUkAvkbkVnqu2wOqO5lbJqiSrAILAnyYpdvgBFIXoZ6ESlpKjLr6RgC3L+
 u/lo82BUFkTdNp+B13OKp7HycN0Hp/GYyKRIfcfNOYsYozWVu2mH41G+9tfNyVWgSFVtbk
 4fToeQ8+1PUed5vlDlS4pzr6HFUvqTYOAuiUeaSxJnZmoB1w7KxwXDBDurk8+A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=Yx5ZSUkv
Subject: Re: [Buildroot] [PATCH 1/4] support/testing: add python-mako
 runtime test
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

On Fri,  9 Jun 2023 19:49:52 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> This new runtime test allows to reproduce the issue
> reported by https://bugs.busybox.net/show_bug.cgi?id=15628
> with a simple python script.
> 
> Traceback (most recent call last):
>   File "/bin/piglit", line 107, in <module>
>     import framework.programs.summary as summary
>   File "/usr/lib64/piglit/framework/programs/summary.py", line 30, in <module>
>     from framework import summary, status, core, backends, exceptions
>   File "/usr/lib64/piglit/framework/summary/__init__.py", line 31, in <module>
>     from .html_ import html, feat
>   File "/usr/lib64/piglit/framework/summary/html_.py", line 37, in <module>
>     from mako.lookup import TemplateLookup
>   File "/usr/lib/python3.11/site-packages/mako/lookup.py", line 13, in <module>
>   File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 292, in <module>
>   File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 289, in _install_highlighting
>   File "/usr/lib/python3.11/site-packages/mako/exceptions.py", line 277, in _install_fallback
>   File "/usr/lib/python3.11/site-packages/mako/filters.py", line 14, in <module>
> ModuleNotFoundError: No module named 'markupsafe
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ---
>  support/testing/tests/package/sample_python_mako.py |  1 +
>  support/testing/tests/package/test_python_mako.py   | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 support/testing/tests/package/sample_python_mako.py
>  create mode 100644 support/testing/tests/package/test_python_mako.py

I've applied after changing the commit log, which was confusing,
because the problem does not reproduce with this test, as it has been
fixed by the previous commit. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
