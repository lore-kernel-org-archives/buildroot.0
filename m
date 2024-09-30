Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18A42CF649D
	for <buildroot@archiver.kernel.org>; Mon, 30 Sep 2024 10:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A378080FF9;
	Mon, 30 Sep 2024 10:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ffsJxfj6SVPt; Mon, 30 Sep 2024 10:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8E0CB80FB5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8E0CB80FB5;
	Mon, 30 Sep 2024 10:33:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 170AC1BF3DE
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 10:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 124364018F
 for <buildroot@lists.busybox.net>; Mon, 30 Sep 2024 10:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NiCaWhKN9903 for <buildroot@lists.busybox.net>;
 Mon, 30 Sep 2024 10:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.15;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4AA2540179
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4AA2540179
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4AA2540179
 for <buildroot@buildroot.org>; Mon, 30 Sep 2024 10:33:06 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [192.168.7.2] ([85.22.113.91]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MFbRs-1sgIwU48sg-00DYe0; Mon, 30
 Sep 2024 12:33:01 +0200
Message-ID: <1e9d4998-f628-4ec2-85c6-98d357ce6479@gmx.de>
Date: Mon, 30 Sep 2024 12:33:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
References: <20240927235259.2046297-1-james.hilliard1@gmail.com>
Content-Language: en-US, de-DE-1901, de-DE
Autocrypt: addr=fiona.klute@gmx.de; keydata=
 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
In-Reply-To: <20240927235259.2046297-1-james.hilliard1@gmail.com>
X-Provags-ID: V03:K1:ZoLt1k2ClFDIg5XNUCdKPrkd2gKGZELtmiCnXwLgxuDXmQTA8cf
 rmCJxXMD0ywppCF5AGl2UHyMDwaXfiMsqLM22nGR7aTsUU5jR06rKTTEdxZ/TOAR8CtgsZJ
 Q5TWq7nYJ6asfgOcK7uHzn+Jwoq5p2pzhcYK03glv8MwTslcad9rip8T4D6VM5QbcEiACk3
 NdW65Xnvi4DPU1CvlIi0Q==
UI-OutboundReport: notjunk:1;M01:P0:pBf5oTgw9P4=;vYVMgXAQX3s+RTYTSUSK8LTOIkm
 MykCfpauX3NWmQUfs255hlYljRVkMf2aveWyW9cWOBjHKWQdTAdLetXSOgbuYUr91/4+Fx85D
 GBdo5nfC5gd0J6pW4qAKiBsjKtAVSFA3m3zVCm7IoyYF7yy17W598ay1CCWiEWqzjlyM9QKfZ
 s7WkZONxxNDIPyPWth58d8Jnoyz/c8oEzeFTreG9DAShQvZPn49NgVrR4kLFy+bc3MLAl9Wan
 n9Uyy8cNDTwPkVMmLReLPdR2GP61g+wsbSfIB/fBxkCoQ27uVBnMo3lWPVameD/scB6Q7Q9WU
 Np/ccA19ZFjsjIsskTDpqlE91xuayQN8cRGBBkZVOhG0weJTXLa9wapzApNGbOZUQsYce24s/
 BReaGAex+3usfC6MNvrSKYz719ZvGI1VFKEBWJHQKKr0YutxGjX8iEhOSS9AHX7tZDnfRqIB9
 03vygLUDP3tgqLA7Us+l5ZoxV1L1v3dxXPEfmbf+nMyKTi3tY7sNeATS2ckDCKH5lwxnwBUqE
 1Vb6XXCpFD2j9nHxuBH4PLOoZKFed6N8t77wzPHJxYumL3rThEpFqJ7tAT0876eaNrUVs9Og3
 TSTeTb5X/MVDxV5EaTHO7BoRr22O5Sjp7ZK9j/K2yPmxu49JgYIzVnVaYVlTTzvMLQKasx/6V
 Tn/cBhEuGVbaRC2rbI7Ey+DSFuRDvA3+vyNAG9b8HXIh5VVhHwJI1SeR7N/DyG4YYDFPHFa+d
 27ApYsARrdXUjN8n3B5mnsUvOCM5AxF4KeFa0zCAh9UTFzFxtWbaYABOCrlKHwkeBcvJfUdJP
 hKzNFwNDxFuNu8nL1kSZdM4Q==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1727692381; x=1728297181; i=fiona.klute@gmx.de;
 bh=dH9b9ZMuj5Lxaq9b3z/5S8qx4qmS9e92gyLeXKgNQpY=;
 h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:Subject:To:
 References:Cc:From:In-Reply-To:Content-Type:
 Content-Transfer-Encoding:cc:content-transfer-encoding:
 content-type:date:from:message-id:mime-version:reply-to:subject:
 to;
 b=lwWLPBM/tJ4VNx+q30xz/tbjJSISw6Dl5k+VxdgtXZOWR5gGhZOL5kzbzcWkZOdF
 IzZkvWkCwvfrGYKF3TLQ9RAxpplXaaGjfabOPnBHnJg0gjWC42E0tnfsgCEomZxpa
 P9Eh4oUGAC0rP8Z+l00Eun+2ZFML1L7iDmuJg5qWc0Fvh3Cf6mXmaStDVSxD75T1p
 w5GuFVcKZHlife8fqfi2OvYcYXI7IzWo6rViG2XI+jRG4ty7sIoUCRR5Q2zrkV2bU
 3PkRmKrcowm77xt6P6iOVjVDAepUjJKN6BnDWR6AUuSVkVjyFfwqPHOlwjA2bjYvX
 iFDWkC7XFulOAEFHHw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=lwWLPBM/
Subject: Re: [Buildroot] [PATCH 1/1] package/gobject-introspection: fix
 build with latest setuptools
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Am 28.09.24 um 01:52 schrieb James Hilliard:
> When setuptools was updated to version 75.1.0 in buildroot commit
> f01897aa6ceca00831c9b2c14f3ae90faaefce68 it broke gobject
> introspection builds which relied on a deprecated MSVCCompiler
> distutils module.
>
> Backport an upstream patch removing this module dependency.

I'd prefer to see the update to gobject-introspection 1.82.0 merged
instead, which already includes the patch. Though the backport could be
a stop-gap measure if the update series needs any lengthy fixes. :-)

See:
https://patchwork.ozlabs.org/project/buildroot/patch/20240925090526.3462217-4-fiona.klute@gmx.de/
Series: https://patchwork.ozlabs.org/project/buildroot/list/?series=425356

Best regards,
Fiona

> Fixes:
>   - http://autobuild.buildroot.net/results/8e0/8e020d65509181148c597997280f196c33b28574
>   - http://autobuild.buildroot.net/results/2db/2db8ce60917b66030286da936c1f1f3aa657b6b7
>
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>   ...-dependency-on-distutils.msvccompile.patch | 104 ++++++++++++++++++
>   1 file changed, 104 insertions(+)
>   create mode 100644 package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
>
> diff --git a/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch b/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
> new file mode 100644
> index 0000000000..a3231a5ad6
> --- /dev/null
> +++ b/package/gobject-introspection/0003-giscanner-remove-dependency-on-distutils.msvccompile.patch
> @@ -0,0 +1,104 @@
> +From c8310afa42dfa598097eb0e003cef7965b5ed7be Mon Sep 17 00:00:00 2001
> +From: Christoph Reiter <reiter.christoph@gmail.com>
> +Date: Wed, 28 Aug 2024 21:26:02 +0200
> +Subject: [PATCH] giscanner: remove dependency on distutils.msvccompiler
> +
> +It was removed with setuptools 74.0.0. Since we still depend on the
> +MSVCCompiler class use new_compiler() to get it some other way.
> +
> +Remove any reference to MSVC9Compiler, which was for Visual Studio 2008
> +which we no longer support anyway.
> +
> +Fixes #515
> +
> +Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> +Upstream: https://gitlab.gnome.org/GNOME/gobject-introspection/-/commit/a2139dba59eac283a7f543ed737f038deebddc19
> +---
> + giscanner/ccompiler.py    |  7 +++----
> + giscanner/msvccompiler.py | 14 +++++++-------
> + 2 files changed, 10 insertions(+), 11 deletions(-)
> +
> +diff --git a/giscanner/ccompiler.py b/giscanner/ccompiler.py
> +index 2912fe0e..766c9a36 100644
> +--- a/giscanner/ccompiler.py
> ++++ b/giscanner/ccompiler.py
> +@@ -26,7 +26,6 @@ import tempfile
> + import sys
> + import distutils
> +
> +-from distutils.msvccompiler import MSVCCompiler
> + from distutils.unixccompiler import UnixCCompiler
> + from distutils.cygwinccompiler import Mingw32CCompiler
> + from distutils.sysconfig import get_config_vars
> +@@ -167,7 +166,7 @@ class CCompiler(object):
> +         # Now, create the distutils ccompiler instance based on the info we have.
> +         if compiler_name == 'msvc':
> +             # For MSVC, we need to create a instance of a subclass of distutil's
> +-            # MSVC9Compiler class, as it does not provide a preprocess()
> ++            # MSVCCompiler class, as it does not provide a preprocess()
> +             # implementation
> +             from . import msvccompiler
> +             self.compiler = msvccompiler.get_msvc_compiler()
> +@@ -453,7 +452,7 @@ class CCompiler(object):
> +             return self.compiler.linker_exe
> +
> +     def check_is_msvc(self):
> +-        return isinstance(self.compiler, MSVCCompiler)
> ++        return self.compiler.compiler_type == "msvc"
> +
> +     # Private APIs
> +     def _set_cpp_options(self, options):
> +@@ -479,7 +478,7 @@ class CCompiler(object):
> +                     # macros for compiling using distutils
> +                     # get dropped for MSVC builds, so
> +                     # escape the escape character.
> +-                    if isinstance(self.compiler, MSVCCompiler):
> ++                    if self.check_is_msvc():
> +                         macro_value = macro_value.replace('\"', '\\\"')
> +                 macros.append((macro_name, macro_value))
> +             elif option.startswith('-U'):
> +diff --git a/giscanner/msvccompiler.py b/giscanner/msvccompiler.py
> +index 0a543982..e333a80f 100644
> +--- a/giscanner/msvccompiler.py
> ++++ b/giscanner/msvccompiler.py
> +@@ -19,30 +19,30 @@
> + #
> +
> + import os
> +-import distutils
> ++from typing import Type
> +
> + from distutils.errors import DistutilsExecError, CompileError
> +-from distutils.ccompiler import CCompiler, gen_preprocess_options
> ++from distutils.ccompiler import CCompiler, gen_preprocess_options, new_compiler
> + from distutils.dep_util import newer
> +
> + # Distutil's MSVCCompiler does not provide a preprocess()
> + # Implementation, so do our own here.
> +
> +
> ++DistutilsMSVCCompiler: Type = type(new_compiler(compiler="msvc"))
> ++
> ++
> + def get_msvc_compiler():
> +     return MSVCCompiler()
> +
> +
> +-class MSVCCompiler(distutils.msvccompiler.MSVCCompiler):
> ++class MSVCCompiler(DistutilsMSVCCompiler):
> +
> +     def __init__(self, verbose=0, dry_run=0, force=0):
> +-        super(distutils.msvccompiler.MSVCCompiler, self).__init__()
> ++        super(DistutilsMSVCCompiler, self).__init__()
> +         CCompiler.__init__(self, verbose, dry_run, force)
> +         self.__paths = []
> +         self.__arch = None  # deprecated name
> +-        if os.name == 'nt':
> +-            if isinstance(self, distutils.msvc9compiler.MSVCCompiler):
> +-                self.__version = distutils.msvc9compiler.VERSION
> +         self.initialized = False
> +         self.preprocess_options = None
> +         if self.check_is_clang_cl():
> +--
> +2.34.1
> +

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
