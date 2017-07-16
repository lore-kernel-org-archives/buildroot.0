From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 16 Jul 2017 23:31:23 +0200
Subject: [Buildroot] [PATCH v1] binutils-2.27: backport patch to enable
 CRC instructions on supported ARMv8-A CPUs
In-Reply-To: <20170716092018.546fa061@windsurf>
References: <20170715231146.25019-1-ps.report@gmx.net>
 <20170716092018.546fa061@windsurf>
Message-ID: <20170716233123.5652e111@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Sun, 16 Jul 2017 09:20:18 +0200, Thomas Petazzoni <thomas.petazzoni@free-electrons.com> wrote:

> Hello,
> 
> On Sun, 16 Jul 2017 01:11:45 +0200, Peter Seiderer wrote:
> > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
> > ---
> >  ...ly-enable-CRC-instructions-on-supported-A.patch | 88 ++++++++++++++++++++++
> >  1 file changed, 88 insertions(+)
> >  create mode 100644 package/binutils/2.27/0907-Automatically-enable-CRC-instructions-on-supported-A.patch
> 
> Thanks for this patch. You're adding it to binutils 2.27, what about
> binutils 2.26.1 ? The bug doesn't exist ?

Bug exists with binutils 2.26.1 but the simple approach to backport (only)
the same patch did not work:

  ./../include/opcode/arm.h:253:53: error: ?ARM_AEXT2_V8A? undeclared here (not in a function)

Seems more patches are missing...

Regards,
Peter

> 
> Thomas
