From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 29 May 2013 16:56:47 +0200
Subject: [Buildroot] [PATCHv3 ] python3: Port python2 patches to reduce
 the interpreter size
In-Reply-To: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1369816617-6315-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <CAHXCMMJgpbTstcZyUOnz2dsAFpWvZNhGgSdHggPNfHfR3tMPjA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Maxime, all,

2013/5/29 Maxime Ripard <maxime.ripard@free-electrons.com>:
> Some of the python2 patches were left behind when doing the python3
> package. This was because the python build system can now autodetect
> what packages can be built in the system.
>
> However, some of these patches are actually useful to reduce drastically
> the size of the interpreter.
>
> This patch ports the relevant patches to the python3 package, and adds a
> new patch to remove the idle3 IDE as well from the interpreter.
>
> Fixes #5696

I've run few builds (same config, with all or no modules selected,
with/without this patch applied):
-rw-r--r-- 1 sam sam 64M May 29 12:39
br-output/python-without-patch/images/rootfs.tar
-rw-r--r-- 1 sam sam 29M May 29 12:50
br-output/python-with-patch-v3-no-modules/images/rootfs.tar
-rw-r--r-- 1 sam sam 32M May 29 12:49
br-output/python-with-patch-v3-all-modules/images/rootfs.tar

So, #5696 seems fixed. \o/

I also tried run a simple python test script[1] in the chroots built
with the patch applied:
- amazingly, zlib module is available when it has been disabled in menuconfig
  (probably caued by auto-detection the python confiugure script);
- unfortunately, when all modules are enabled, few of them fail [2].

Here is the defconfig [3] of the build with the patch applied and all
modules enabled.

[1] http://code.bulix.org/1ufj2l-83660
[2] http://code.bulix.org/sw2k9j-83662
[3] http://code.bulix.org/6jewj3-83663

Regards,

-- 
Samuel
