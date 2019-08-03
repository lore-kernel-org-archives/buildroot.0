From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 04 Aug 2019 00:13:00 +0200
Subject: [Buildroot] [PATCH 10/13 v2] core: allow br2-external trees to
 provide pre-configured toolchains
In-Reply-To: <48603fc1a6fab9f9e4c635fc76cf04c859a608f5.1564431589.git.yann.morin.1998@free.fr>
 (Yann E. MORIN's message of "Mon, 29 Jul 2019 22:20:00 +0200")
References: <cover.1564431589.git.yann.morin.1998@free.fr>
 <48603fc1a6fab9f9e4c635fc76cf04c859a608f5.1564431589.git.yann.morin.1998@free.fr>
Message-ID: <87ef217v9v.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Since we have a choice for the pre-configured pre-built toolchains,
 > there is no p[ossbility for a br2-external to provide its own. The
 > only solution so far for defconfigs in br2-external trees is to use
 > BR2_TOOLCHAIN_EXTERNAL_CUSTOM and define all the bits by itself...

 > This is not so convemient, so offer a way for br2-external trees to
 > provide such pre-configured toolchains.

 > To allow for this, we now scan each br2-external tree and look for a
 > specific file, provides.toolchains.in. We generate a kconfig file that
 > sources each such file, and that generated file is sourced from within
 > the toolchain choice, thus making the toolchains from a br2-external
 > tree possible and available in the same location as the ones known to
 > Buildroot:

 >     Toolchain  --->
 >         Toolchain type (External toolchain)  --->
 >         Toolchain  --->
 >             (X) Arm ARM 2019.03
 >             ( ) Linaro ARM 2018.05
 >             ( ) Custom toolchain
 >                 *** Toolchains from my-br2-ext-tree: ***
 >             ( ) My custom ARM toolchain
 >                 *** Toolchains from another-br2-ext-tree: ***
 >             ( ) Another custom ARM toolchain
 >             ( ) A third custom ARM toolchain

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Vadim Kochan <vadim4j@gmail.com>

Committed, thanks.

-- 
Bye, Peter Korsgaard
