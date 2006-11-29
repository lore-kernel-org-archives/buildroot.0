From: Pavel Roskin <proski@gnu.org>
Date: Wed, 29 Nov 2006 00:31:55 -0500
Subject: [Buildroot] Built mipsel cross-compiler error on buildroot
In-Reply-To: <b2ec5cad0611282111tabfe302ve509e5c15b859048@mail.gmail.com>
References: <b2ec5cad0611282111tabfe302ve509e5c15b859048@mail.gmail.com>
Message-ID: <1164778315.4016.99.camel@dv>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 2006-11-29 at 13:11 +0800, Doug Brewer wrote:

> I tried to use buildroot snpashots(20061128) to build mipsel cross-compiler,
> I got the following errors;

> /home/brewer/buildroot/toolchain_build_mipsel/uClibc_dev//usr/include/asm/sigcon
> text.h:12:25: asm/sgidefs.h: No such file or directory

This looks like an inconsistency in the kernel headers.
asm/sigcontext.h is present, but asm/sgidefs.h is not (at least where
it's expected to be).

Make sure you have unifdef installed.  Try varying the version of the
kernel headers (e.g if it's 2.4.x, try 2.6.x and vice versa).  If it
doesn't help, try the released version of uClibc.  Also try another
compiler version (I would start with gcc 4.1.1).

-- 
Regards,
Pavel Roskin
