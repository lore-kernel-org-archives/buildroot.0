From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 14 Nov 2008 11:12:59 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/device
In-Reply-To: <20081114100645.192BD3C8EE@busybox.net>
References: <20081114100645.192BD3C8EE@busybox.net>
Message-ID: <20081114111259.5e2d902c@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Fri, 14 Nov 2008 02:06:45 -0800 (PST),
jacmet at uclibc.org a ?crit :

> Modified:
>    trunk/buildroot/target/device/Config.in.toolchain

I don't really get what's all this toolchain-related stuff in
target/device/. Even when using a binary external toolchain, all the
BR2_EXT_GCC_VERSION_* variables are set:

BR2_EXT_GCC_VERSION_4_1_2=y
BR2_EXT_GCC_VERSION_4_2_1=y
BR2_EXT_GCC_VERSION_4_2_2=y
BR2_EXT_GCC_VERSION_4_2_3=y
BR2_EXT_BINUTILS_VERSION_2_17=y
BR2_EXT_UCLIBC_VERSION_0_9_29=y
BR2_EXT_UCLIBC_VERSION_0_9_28_3=y

which looks a bit odd to me, since Buildroot has absolutely no power
over the version of the components used in an already compiled binary
toolchain.

And why is all that stuff implemented in target/device/ and not in
toolchain/ ?

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers and embedded Linux development,
consulting, training and support.
http://free-electrons.com
