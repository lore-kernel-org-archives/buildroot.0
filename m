Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DF65C54E41
	for <buildroot@archiver.kernel.org>; Thu, 29 Feb 2024 15:52:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EE88541AEB;
	Thu, 29 Feb 2024 15:52:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mx3cnqVb7ht8; Thu, 29 Feb 2024 15:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C36D41AE9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8C36D41AE9;
	Thu, 29 Feb 2024 15:52:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 884A41BF2B4
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:38:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81DCF60F47
 for <buildroot@lists.busybox.net>; Thu, 29 Feb 2024 15:38:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQ2GcRRXG01W for <buildroot@lists.busybox.net>;
 Thu, 29 Feb 2024 15:38:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::227;
 helo=relay7-d.mail.gandi.net; envelope-from=peter@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 63CAF60F42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63CAF60F42
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::227])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 63CAF60F42
 for <buildroot@buildroot.org>; Thu, 29 Feb 2024 15:38:09 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3886D20002;
 Thu, 29 Feb 2024 15:38:07 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peter@korsgaard.com>) id 1rfiU2-004no7-1w;
 Thu, 29 Feb 2024 16:38:06 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
References: <20240129204032.1980414-1-gsmecher@threespeedlogic.com>
 <ZcEjLpAWFjQuYCWc@landeda>
Date: Thu, 29 Feb 2024 16:38:06 +0100
In-Reply-To: <ZcEjLpAWFjQuYCWc@landeda> (Yann E. MORIN's message of "Mon, 5
 Feb 2024 19:04:30 +0100")
Message-ID: <87ttlrffhd.fsf@48ers.dk>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: Re: [Buildroot] [PATCH] host-python-numpy: correct implied
 host-lapack/host-blas dependency.
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
Cc: gsmecher@threespeedlogic.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Graeme, All,
 > On 2024-01-29 12:40 -0800, gsmecher@threespeedlogic.com spake thusly:
 >> From: Graeme Smecher <gsmecher@threespeedlogic.com>
 >> 
 >> Before this patch, host-python-numpy attempted (and failed) to detect
 >> OpenBLAS as follows:
 >> 
 >> buildroot$ make
 >> >>> host-python-numpy 1.25.0 Configuring
 >> [...]
 >> Run-time dependency openblas found: NO (tried pkgconfig and cmake)
 >> WARNING: CMake Toolchain: Failed to determine CMake compilers state
 >> Run-time dependency openblas found: YES 0.3.21
 >> Dependency openblas found: YES 0.3.21 (cached)
 >> Program _build_utils/process_src_template.py found: YES
 >> (/path/to/buildroot/output/host/bin/python3
 >> /path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/process_src_template.py)
 >> Program _build_utils/tempita.py found: YES
 >> (/path/to/buildroot/output/build/host-python-numpy-1.25.0/numpy/_build_utils/tempita.py)
 >> 
 >> output/build/host-python-numpy-1.25.0/numpy/meson.build:201:44:
 >> ERROR: Could not get cmake variable and no default provided for
 >> <CMakeDependency OpenBLAS: True None>
 >> [...]

 > So I dug in the Numpy git history, and before we bumped to 1.25, it was
 > using distutils, which would only warn and disable BLAS support if not
 > found, but the meson switch made the default to fail.

 >> Two obvious ways to correct this:
 >> 
 >> - Add some kind of host-lapack / host-openblas dependency to
 >> host-python-numpy, or
 >> - Tell host-python-numpy not to look for (or rely on) external code.
 >> 
 >> Because the host numpy environment shouldn't be doing any numerical
 >> heavy lifting, we opt for the latter here.
 >> 
 >> Signed-off-by: Graeme Smecher <gsmecher@threespeedlogic.com>

 > Applied to master, with an extended commit log about the history,
 > thanks.

Committed to 2023.11.x, thanks.

-- 
Bye, Peter Korsgaard
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
