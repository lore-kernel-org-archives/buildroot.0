From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 03 Aug 2019 16:18:58 +0200
Subject: [Buildroot] [PATCH]
 toolchain/toolchain-external/toolchain-external-custom: be more flexible on
 gcc version
In-Reply-To: <20190802213646.29444-1-thomas.petazzoni@bootlin.com> (Thomas
 Petazzoni's message of "Fri, 2 Aug 2019 23:36:46 +0200")
References: <20190802213646.29444-1-thomas.petazzoni@bootlin.com>
Message-ID: <87ef22cox9.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > The custom external toolchain logic asks the user to specify which gcc
 > version is provided by the toolchain. The list of gcc versions given
 > by Buildroot is restricted depending on the selected CPU architecture
 > using the BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz config options.

 > However, these config options generally indicate in which upstream gcc
 > version the support for the selected architecture was introduced. But
 > in practice, it is possible that an external toolchain uses some
 > non-upstream gcc code, providing support for a CPU architecture before
 > it was merged in upstream gcc.

 > A specific example is that there are pre-built external toolchains for
 > the C-SKY CPU architecture that are based on gcc 6.x, even if the
 > support for it was only added in upstream gcc 9.x.

 > Due to the BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz options, only gcc >= 9.x
 > can be selected for C-SKY, preventing the use of such a custom
 > toolchain.

 > In addition, those dependencies are in fact not really needed:
 > Buildroot will check that the gcc version provided matches what the
 > user declared in the configuration. And if the gcc provided by the
 > toolchain does support that CPU architecture, then well, so be it,
 > there's no need to restrict the gcc version selected.

 > So we simply get rid of these dependencies on
 > BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz, and also don't use them anymore to
 > chose a default value for the gcc version.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Yann E. MORIN <yann.morin.1998@free.fr>

Committed, thanks.

-- 
Bye, Peter Korsgaard
