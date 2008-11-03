From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 03 Nov 2008 11:15:27 +0100
Subject: [Buildroot] External toolchain support improvements
In-Reply-To: <20081030094501.66983ff9@surf> (Thomas Petazzoni's message of
	"Thu\, 30 Oct 2008 09\:45\:01 +0100")
References: <20081030094501.66983ff9@surf>
Message-ID: <874p2pm7y8.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Improve external toolchain support
 Thomas>  * Do not put kernel-headers in the dependencies of BASE_TARGETS in
 Thomas>    the case where BR2_TOOLCHAIN_SOURCE is not y. The kernel headers
 Thomas>    are already supposed to be part of the external toolchain, so
 Thomas>    there's no need to download, extract and install them.

Sounds good.

 Thomas>  * In the configuration system, don't display the kernel headers
 Thomas>    version selection list when an external toolchain is selected. This
 Thomas>    is implemented by moving the source
 Thomas>    "toolchain/kernel-headers/Config.in" inside the if
 Thomas>    BR2_TOOLCHAIN_SOURCE in toolchain/Config.in.2.

And this too.

 Thomas>  * Change the description and help message of the BR2_LARGEFILE,
 Thomas>    BR2_INET_IPV6, BR2_INET_RPC, and BR2_SOFT_FLOAT option in
 Thomas>    toolchain/external-toolchain/Config.in. In the case of an external
 Thomas>    toolchain, the semantic of these options is not to enable large
 Thomas>    file support, IPV6 or RPC (since the toolchain is already compiled,
 Thomas>    it has been decided previously). Their semantic is to let Buildroot
 Thomas>    know about the characteristics of the external toolchain being
 Thomas>    used.

Exactly.

 Thomas>    As an improvement, we could guess these values automatically:

 Thomas>     - for BR2_LARGEFILE, look at the value of __UCLIBC_HAS_LFS__ in
 Thomas>       bits/uClibc_config.h in the libc headers directory.

This would only work for external toolchains using uclibc - I guess
the main reason for using an external toolchain is to not use uclibc?

-- 
Bye, Peter Korsgaard
