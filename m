From: Doug Brewer <brewer.doug@gmail.com>
Date: Thu, 30 Nov 2006 14:17:43 +0800
Subject: [Buildroot] Built mipsel cross-compiler error on buildroot
In-Reply-To: <1164778315.4016.99.camel@dv>
References: <b2ec5cad0611282111tabfe302ve509e5c15b859048@mail.gmail.com>
	<1164778315.4016.99.camel@dv>
Message-ID: <b2ec5cad0611292217k7146f5a0ibaa322d97d4526a5@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Pavel Roskin  wrote:
> On Wed, 2006-11-29 at 13:11 +0800, Doug Brewer wrote:
>
> > I tried to use buildroot snpashots(20061128) to build mipsel cross-compiler,
> > I got the following errors;
>
> > /home/brewer/buildroot/toolchain_build_mipsel/uClibc_dev//usr/include/asm/sigcon
> > text.h:12:25: asm/sgidefs.h: No such file or directory
>
> This looks like an inconsistency in the kernel headers.
> asm/sigcontext.h is present, but asm/sgidefs.h is not (at least where
> it's expected to be).
>
> Make sure you have unifdef installed.  Try varying the version of the
> kernel headers (e.g if it's 2.4.x, try 2.6.x and vice versa).  If it
> doesn't help, try the released version of uClibc.  Also try another
> compiler version (I would start with gcc 4.1.1).

First off, thanks for your reply. I have unifdef installed and tried
gcc 4.1.1 with no luck.
As you pointed out, asm/sgidefs.h is missing. I copied this file into
buildroot/toolchain_build_mipsel/linux/include/asm and
buildroot/toolchain_build_mipsel/uClibc_dev/usr/include/asm, the
problem will be solved.
I use linux-2.6.18.3 kernel headers, I think buildroot developers
might provide a patch to
fix that problem, thanks.

> --
> Regards,
> Pavel Roskin

Warm regards,
Doug.
