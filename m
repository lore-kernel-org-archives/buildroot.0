From: lemonoje <lemonoje@gmail.com>
Date: Fri, 12 May 2017 06:11:33 -0700 (PDT)
Subject: [Buildroot] Altera SoC Buildroot external toolchain
	incompatible error
In-Reply-To: <20170511232316.693f8e6c@free-electrons.com>
References: <1494532269551-164744.post@n4.nabble.com>
 <20170511221419.1e5e9baf@free-electrons.com>
 <1494533969065-164751.post@n4.nabble.com>
 <20170511225147.7466e9ff@free-electrons.com>
 <1494535599131-164758.post@n4.nabble.com>
 <20170511232316.693f8e6c@free-electrons.com>
Message-ID: <1494594693346-164814.post@n4.nabble.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

You have selected to download the toolchain whereas I already have it
downloaded, so my config is not using the EXTERNAL_URL.  (Note the path is
not set below as I pass that in when I build).  Here is my config that
produces the error:

BR2_ARCH="arm"
BR2_GCC_TARGET_CPU="cortex-a9"
BR2_cortex_a9=y
BR2_ARM_ENABLE_VFP=y
BR2_ARM_EABIHF=y
BR2_TOOLCHAIN=y
BR2_TOOLCHAIN_USES_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM=y
BR2_TOOLCHAIN_EXTERNAL_PREINSTALLED=y
BR2_TOOLCHAIN_EXTERNAL_PATH="/loc"
BR2_TOOLCHAIN_EXTERNAL_GLIBC=y
BR2_PACKAGE_HAS_TOOLCHAIN_EXTERNAL=y
BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL="toolchain-external-custom"
BR2_TOOLCHAIN_EXTERNAL_PREFIX="arm-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="arm-linux-gnueabihf"
BR2_TOOLCHAIN_EXTERNAL_GCC_5=y
BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_0=y
BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
BR2_TOOLCHAIN_EXTERNAL_HAS_SSP=y
BR2_TOOLCHAIN_EXTERNAL_INET_RPC=y
BR2_TOOLCHAIN_EXTRA_EXTERNAL_LIBS=""
BR2_TOOLCHAIN_EXTERNAL_GDB_SERVER_COPY=y


But now I see once I choose to enable VFP, I can then choose Target
ABI=EABIhf.  And then the Linaro custom toolchain option (2016.11) appears
in the Toolchain External Options.  That would then mean I have to already
have 2016.11 installed and use BR2_TOOLCHAIN_EXTERNAL_PATH to tell BR where
it's at, right?

So, the external Linaro toolchains you can select differ between versions of
Buildroot.  Is there a listing of which ones support which toolchains?





--
View this message in context: http://buildroot-busybox.2317881.n4.nabble.com/Altera-SoC-Buildroot-external-toolchain-incompatible-error-tp164744p164814.html
Sent from the Buildroot (busybox) mailing list archive at Nabble.com.
