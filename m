From: Konstantin Kletschke <kletschke@synertronixx.de>
Date: Wed, 27 Jun 2007 11:03:29 +0200
Subject: [Buildroot] ARM EABI builds
In-Reply-To: <20070627081954.GR31791@trinity.fluff.org>
References: <20070626133327.GA5989@trinity.fluff.org>
	<468182D7.30509@gmail.com>
	<20070626222500.GP31791@trinity.fluff.org>
	<20070627081954.GR31791@trinity.fluff.org>
Message-ID: <20070627090329.GA3741@z1.synertronixx>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 2007-06-27 09:19 +0100 schrieb Ben Dooks:

> I have finally tracked down the problem, and will be submitting a
> fix as soon as I have reviewed the patch.

*argh* 

I followed your thread and I am so sorry that I forgot that I for myself
apply a patch regarding this issue. It floated around a while ago and
it is called unbreak-armv4t.patch:

ff -urN gcc-4.1.1/gcc/config/arm/linux-eabi.h gcc-4.1.1-arm9tdmi/gcc/config/arm/linux-eabi.h
--- gcc-4.1.1/gcc/config/arm/linux-eabi.h       2006-10-22 11:11:49.000000000 -0700
+++ gcc-4.1.1-arm9tdmi/gcc/config/arm/linux-eabi.h      2006-10-24 21:34:01.000000000 -0700
@@ -45,7 +45,7 @@
    The ARM10TDMI core is the default for armv5t, so set
    SUBTARGET_CPU_DEFAULT to achieve this.  */
 #undef SUBTARGET_CPU_DEFAULT
-#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm10tdmi
+#define SUBTARGET_CPU_DEFAULT TARGET_CPU_arm9tdmi

 #undef SUBTARGET_EXTRA_LINK_SPEC
 #define SUBTARGET_EXTRA_LINK_SPEC " -m armelf_linux_eabi"


> The next thing is, do we then need to produce our compiler and
> libraries in toolchain_arm_<cpu>_<fp> and build_arm_<cpu>_<fp> ?

Well... why not? The toolchain_arm_<cpu>_<fp> directory is some sort of
PIC in the filesystem and can moved around and used for crosscompiling
other stuff standing alone.

Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
