Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F45CCE7A81
	for <buildroot@archiver.kernel.org>; Mon, 25 Sep 2023 11:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2A9860B05;
	Mon, 25 Sep 2023 11:56:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2A9860B05
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_xKn1XZwmwb; Mon, 25 Sep 2023 11:56:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D10A60F77;
	Mon, 25 Sep 2023 11:56:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D10A60F77
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CA2731BF2C9
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:56:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A291B417FF
 for <buildroot@lists.busybox.net>; Mon, 25 Sep 2023 11:56:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A291B417FF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yp7cUpmg2wcb for <buildroot@lists.busybox.net>;
 Mon, 25 Sep 2023 11:56:14 +0000 (UTC)
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 72D02417A9
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 11:56:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 72D02417A9
Received: by mail.gandi.net (Postfix) with ESMTPSA id C307D60009;
 Mon, 25 Sep 2023 11:56:10 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peter@korsgaard.com>)
 id 1qkkC8-002a1I-6m; Mon, 25 Sep 2023 13:56:08 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
References: <20230919195216.136460-1-fontaine.fabrice@gmail.com>
Date: Mon, 25 Sep 2023 13:56:07 +0200
In-Reply-To: <20230919195216.136460-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Tue, 19 Sep 2023 21:52:16 +0200")
Message-ID: <8734z2eaaw.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > Fix the following build failures raised since bump to version 1.4.0 in
 > commit 456a7398316655ad0b669635f580e4887c24a700:

 > -- Found PythonInterp: /usr/bin/python3.6 (found suitable version "3.6.9", minimum required is "3.6")
 > CMake Error at /home/buildroot/autobuild/run/instance-3/output-1/host/sparc64-buildroot-linux-gnu/sysroot/usr/share/cmake/pybind11/FindPythonLibsNew.cmake:147 (message):
 >   Python config failure:

 >   Traceback (most recent call last):

 >     File "<string>", line 6, in <module>

 >   ImportError: cannot import name 'sysconfig'

 > and

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

 > Fixes:
 >  - http://autobuild.buildroot.org/results/665b246a4bb14480152ee59050672a7469148a5b
 >  - http://autobuild.buildroot.org/results/0502b05020de57e4910125c699c4264047187c51
 >  - http://autobuild.buildroot.org/results/c5e7fe83d46c704e05800e3ae62bf476458c7b71

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2023.02.x, 2023.05.x and 2023.08.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
