Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928F6E7070C
	for <buildroot@archiver.kernel.org>; Thu, 21 Sep 2023 10:29:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4B5EF80BE4;
	Thu, 21 Sep 2023 10:29:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4B5EF80BE4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JwydPR4pK7SI; Thu, 21 Sep 2023 10:29:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 94C0C82003;
	Thu, 21 Sep 2023 10:29:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 94C0C82003
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A5A001BF3C2
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:29:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 691C081FC9
 for <buildroot@lists.busybox.net>; Thu, 21 Sep 2023 10:29:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 691C081FC9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dYTT14VyOO6x for <buildroot@lists.busybox.net>;
 Thu, 21 Sep 2023 10:29:44 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 537E1838B6
 for <buildroot@buildroot.org>; Thu, 21 Sep 2023 10:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 537E1838B6
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3D7A860005;
 Thu, 21 Sep 2023 10:29:41 +0000 (UTC)
Date: Thu, 21 Sep 2023 12:29:40 +0200
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20230921122940.2f48924d@windsurf>
In-Reply-To: <20230919195216.136460-1-fontaine.fabrice@gmail.com>
References: <20230919195216.136460-1-fontaine.fabrice@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-GND-Sasl: thomas.petazzoni@bootlin.com
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1695292181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xErPG3xoiGJSIOp7CAnHy51+8f9sz8qY3RhN5tfcDII=;
 b=YWyLDtoTLqVzYP70+sjTvEqiZWV6wtMq57HTPQFDK7UI7GlsAhnhW72y/0+yDNLCNg+Rpb
 lznO2wsl0pQqR4jfMyB6XUWhanypSqGC0OrHEcpqTAMWR52yvQ6xm7kNPs3FH3NzQyZ0GX
 c0yDqZ0FKX2L9UDz32LadlQ7FwtAPP1iKMkWJmhnRPCGpzPwBtQXbxTYqI6sP7eh0ejfix
 1Ob8Hs297rWR2Nu95m3hqlEmPW4qnN22rQaaAYs/lgNsDHgrUnZdDhkFYv+bjXVmUhRy/j
 ilzAmWxtnwANlXXxrhCz2JduLBtoDFbtd/OCcjxedJeVCcozjc5yn2OeYeXlPg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=YWyLDtoT
Subject: Re: [Buildroot] [PATCH 1/1] package/zxing-cpp: fix python build
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

On Tue, 19 Sep 2023 21:52:16 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix the following build failures raised since bump to version 1.4.0 in
> commit 456a7398316655ad0b669635f580e4887c24a700:
> 
> -- Found PythonInterp: /usr/bin/python3.6 (found suitable version "3.6.9", minimum required is "3.6")
> CMake Error at /home/buildroot/autobuild/run/instance-3/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/share/cmake/pybind11/FindPythonLibsNew.cmake:147 (message):
>   Python config failure:
> 
>   Traceback (most recent call last):
> 
>     File "<string>", line 6, in <module>
> 
>   ImportError: cannot import name 'sysconfig'
> 
> and
> 
> In file included from /home/buildroot/autobuild/instance-1/output-1/host/include/python3.11/Python.h:38,
>                  from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/common.h:266,
>                  from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/attr.h:13,
>                  from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/detail/class.h:12,
>                  from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/pybind11.h:13,
>                  from /home/buildroot/autobuild/instance-1/output-1/host/sh4-buildroot-linux-gnu/sysroot/usr/include/pybind11/numpy.h:12,
>                  from /home/buildroot/autobuild/instance-1/output-1/build/zxing-cpp-2.1.0/wrappers/python/zxing.cpp:18:
> /home/buildroot/autobuild/instance-1/output-1/host/include/python3.11/pyport.h:601:2: error: #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>   601 | #error "LONG_BIT definition appears wrong for platform (bad gcc/glibc config?)."
>       |  ^~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/665b246a4bb14480152ee59050672a7469148a5b
>  - http://autobuild.buildroot.org/results/0502b05020de57e4910125c699c4264047187c51
>  - http://autobuild.buildroot.org/results/c5e7fe83d46c704e05800e3ae62bf476458c7b71
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zxing-cpp/zxing-cpp.mk | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)

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
