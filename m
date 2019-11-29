From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 29 Nov 2019 10:51:42 +0100
Subject: [Buildroot] [PATCH v1] package/gst1-plugins-bad: remove
 rpi-userland extra include paths
In-Reply-To: <20191128233017.3437-1-ps.report@gmx.net> (Peter Seiderer's
 message of "Fri, 29 Nov 2019 00:30:17 +0100")
References: <20191128233017.3437-1-ps.report@gmx.net>
Message-ID: <87fti7au35.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > The rpi-userland extra include paths where added with [2] including
 > a rpi-userland dependency for the dispmanx option.

 > The dispmanx option was moved to gst1-plugins-base with commit [3],
 > including the rpi-userland dependency, excluding the extra include
 > paths.

 > Tested gst1-plugins-base with dispmanx enabled compiles without
 > failures. It seems to be save to remove the extra includes from
 > gst1-plugins-bad.

 > Fixes (from meson-log.txt):

 >   Sanity check compile stderr:
 >   arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
 >   /.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/IL:
 >   No such file or directory
 >   arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
 >   /.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/interface/vcos/pthreads:
 >   No such file
 >   arm-buildroot-linux-uclibcgnueabihf-gcc.br_real: error:
 >   /.../host/arm-buildroot-linux-uclibcgnueabihf/sysroot/usr/include/interface/vmcs_host/linux:
 >   No such file

 > [1] https://bugs.busybox.net/show_bug.cgi?id=12366

You don't have any [1] references ;)

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
