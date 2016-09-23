From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 23 Sep 2016 08:37:55 +0200
Subject: [Buildroot] [PATCH v2] mksh: add new package MirOS Korn Shell
In-Reply-To: <Pine.BSM.4.64L.1609222005390.8171@herc.mirbsd.org>
References: <20160922181253.GA13373@waldemar-brodkorb.de>
 <Pine.BSM.4.64L.1609222005390.8171@herc.mirbsd.org>
Message-ID: <20160923063754.GV7322@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thorsten,
Thorsten Glaser wrote,

> Waldemar Brodkorb dixit:
> 
> >The MirOS Korn Shell is a quite complete posix shell implementation,
> 
> POSIX compatible, not 100% but closer than most others?
> 
> >+MKSH_LICENSE = MirOS, BSD-3c, ISC
> 
> Only MirOS and ISC unless you add printf.c (which I don?t see
> in the patch).
> 
> >+MKSH_LICENSE_FILES = COPYING
> 
> Huh?

Okay, seems to be a problem.
Is the License file for mksh (MirOS License) available in 
a file in the source tree?
Buildroot has a function to collect all license files of
a created root filesystem.

> >+define MKSH_CONFIGURE_CMDS
> >+	cd $(@D) && $(TARGET_MAKE_ENV) \
> >+		CPPFLAGS="-DMKSH_S_NOVI=0 $(TARGET_CPPFLAGS)" \
> 
> You only need -DMKSH_S_NOVI=0 if you also add -DMKSH_SMALL
> and want the vi editing mode.
> 
> >+		sh ./Build.sh -M
> >+endef
> >+
> >+define MKSH_BUILD_CMDS
> >+	cd $(@D) && $(TARGET_MAKE_ENV) \
> >+		sh ./Rebuild.sh
> >+endef
> 
> Arguable, but just call Build.sh without -M to configure *and*
> build it in *one* step.
> 
> >+define MKSH_INSTALL_TARGET_CMDS
> >+	$(INSTALL) -m 0755 $(@D)/mksh $(TARGET_DIR)/bin/mksh
> >+endef
> 
> Please also ship dot.mkshrc or some other sort of ~/.mkshrc
> so that users get a slightly more comfortable/usable environment,
> if you can afford it, byte-wise (it?s 15K), or at least make it
> configurable. (Also patch it, if needed, e.g. for an ls(1) without
> the -o option.)
> 
> Thanks,
> //mirabilos (mksh upstream)

thx,
 Waldemar
