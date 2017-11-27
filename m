From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 27 Nov 2017 23:19:31 +0100
Subject: [Buildroot] [PATCH 4/4 v3] core: check files are not touched by
 more than one package
In-Reply-To: <cd4d3c26158a9dc124b3ac584da2c61e004cbc8b.1509204637.git.yann.morin.1998@free.fr>
References: <cover.1509204637.git.yann.morin.1998@free.fr>
 <cd4d3c26158a9dc124b3ac584da2c61e004cbc8b.1509204637.git.yann.morin.1998@free.fr>
Message-ID: <20171127231931.155952f6@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 28 Oct 2017 17:30:59 +0200, Yann E. MORIN wrote:
> Currently, we do nothing about packages that touch the same file: given
> a specific configuration, the result is reproducible (even though it
> might not be what the user expected) because the build order is
> guaranteed.
> 
> However, when we later introduce top-level parallel build, we will no
> longer be able to guarantee a build order, by the mere way of it being
> parallel. Reconcialliting all those modified files will be impossible to

Reconciliating

>  Makefile                            |  4 ++++
>  support/scripts/check-uniq-files.py | 40 +++++++++++++++++++++++++++++++++++++

I dropped the .py extension for this script. Most (but not all of
course) of our scripts don't have an extension.

> diff --git a/support/scripts/check-uniq-files.py b/support/scripts/check-uniq-files.py
> new file mode 100755
> index 0000000000..615c309491
> --- /dev/null
> +++ b/support/scripts/check-uniq-files.py
> @@ -0,0 +1,40 @@
> +#!/usr/bin/env python
> +
> +import sys
> +import csv
> +import argparse
> +from collections import defaultdict
> +
> +warn = 'Warnng: {}s file "{}" is touched by more than one package: {}\n'

Warnng -> Warning

also the "s" at the end of {}s didn't make much sense to me "targets
file", "stagings file", "hosts file" ?

"target file", "staging file", "host file" made more sense, so I
dropped the s in {}s.

Applied to next with those changes.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
