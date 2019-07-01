From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Jul 2019 12:01:13 +0200
Subject: [Buildroot] [BUG] host-python-2.7.16 fails to build on aarch64,
 luajit fails for soft float
In-Reply-To: <d596b57f-e046-ec2c-4413-e2a3f301412e@gmail.com>
References: <d596b57f-e046-ec2c-4413-e2a3f301412e@gmail.com>
Message-ID: <20190701120113.4da32768@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Petr,

Thanks for your bug report. See below for some comments. Adding
Fran?ois Perrad in Cc about the LuaJIT bump.

On Fri, 28 Jun 2019 19:07:40 +0200
Petr Cvek <petrcvekcz@gmail.com> wrote:

> Trying to build an MIPS system on debian/sid/aarch64 machine fails to build python2 for the host. It seems the current used python has a bundled version of libffi, which doesn't yet support aarch64.
> 
> A temporary solution is to hardcopy libffi-3.3-rc0 into python source tree:
> 
> output/build/host-python-2.7.16/Modules/_ctypes/libffi

For the target python, we're building libffi separately. I guess we
should do the same for host-python, i.e use host-libffi instead of the
bundled libffi.

Could you have a look at implementing this ?

> Alse luajit for the target fails to build for MIPS -msoft-float. This seems to be fixed in 2.1.0-beta3.

There is a patch at http://patchwork.ozlabs.org/patch/1095710/ that
bumps to 2.1.0-beta3, but only for AArch64. I'm not sure what we should
do about this.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
