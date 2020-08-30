From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2020 09:54:27 +0200
Subject: [Buildroot] [PATCH 02/22] core/pkg-utils: kconfig mangling
 defaults to current package's .config
In-Reply-To: <14c3b30890f0dbccd6954e9e6c88de483b321b65.1586002215.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Sat, 4 Apr 2020 14:10:14 +0200")
References: <cover.1586002215.git.yann.morin.1998@free.fr>
 <14c3b30890f0dbccd6954e9e6c88de483b321b65.1586002215.git.yann.morin.1998@free.fr>
Message-ID: <87a6ycefgs.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > The kconfig mangling macros currently operate on the caller-supplied
 > .config file, on the assumption that the caller will always know what
 > file to mangle.

 > This was correct so far, as packages would indeed only mangle their own
 > .config files.

 > However, the linux kernel does its mangling based on whether some
 > packages are enabled or not. That list of conditional mangling is
 > getting bigger and bigger with each new package that needs such
 > mangling, culminating with the pending firewalld one [0]. Furthermore,
 > this mangling is not accessible to packages in br2-external trees. So
 > we'll want to have packages provide the mangling commands.

 > So we'll want the mangling to be done on the linux' .config file,,i.e.
 > and the expanding package context, not in the package calling the
 > macros.

 > But packages do not, and should not have knowledge about where the
 > .config file is, nor how it is named.

 > So we make the parameter to specify the .config file to mangle optional.
 > If it is set, this is what the macros will mangle; if it is not set, the
 > expanding packge's .config file will be used.

 > This has the added benefit that we do not have to repeat in the
 > exp[anding package context the knowledge of how the .config file is
 > named:

 >     FOO_KCONFIG_DOTCONFIG = .config
 >     define FOO_KCONFIG_FIXUPS_CMDS
 >         $(call KCONFIG_ENABLE_OPT,BLA,$(@D)/.config)
 >     endef

 > [0] http://lists.busybox.net/pipermail/buildroot/2020-March/278683.html

 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>

Committed to 2020.02.x to fix the busybox breakage, thanks.

-- 
Bye, Peter Korsgaard
