From: Sid Bharij <sid.bharij@gmail.com>
Date: Wed, 12 Nov 2014 16:19:27 -0600
Subject: [Buildroot] Buildroot and kernel modules
In-Reply-To: <20141112222752.228404f0@free-electrons.com>
References: <CAEk40fxcdS-gS9Q8LM-W8pKUP3=PUSkbL9Crq63kvcpG5LBf=Q@mail.gmail.com>
 <20141112110354.1a6bcc98@free-electrons.com>
 <A2A6A18A7161D44FBCA90D5B3AF90A2E5A5C3C97@AMEHLEX02.ehl.pri>
 <20141112133418.728a5f52@free-electrons.com>
 <CAEk40fw3Kgtgq=mKdR3ib40tLtD5x4SF0sT0QJrrwKVCO_+BZA@mail.gmail.com>
 <20141112222752.228404f0@free-electrons.com>
Message-ID: <CAEk40fyb_q-WCBL71ho9u7Wm1T2cqzLgiJoU5d_t3K2svSPqVg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I am sorry if I caused this confusion. I do understand that buildroot
is a build system, I am just trying to build my driver files using
build root by the way of packages. What I was referring to were the
lines pasted by Hiram below:(Do I need to add these to a top level
package.mk file?)

KERNELMODULE_DEPENDENCIES = linux

define KERNELMODULE_BUILD_CMDS
   $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules
endef

define KERNELMODULE_INSTALL_TARGET_CMDS
   $(MAKE) $(LINUX_MAKE_FLAGS) -C $(LINUX_DIR) M=$(@D) modules_install
endef

$(eval $(generic-package))
