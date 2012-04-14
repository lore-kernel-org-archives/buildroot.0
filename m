From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 14 Apr 2012 23:57:22 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2012-04-07
In-Reply-To: <20120410085328.21507bc2@skate> (Thomas Petazzoni's message of
 "Tue, 10 Apr 2012 08:53:28 +0200")
References: <20120408063022.2FA8252CA55@lolut.humanoidz.org>
 <87lim6u2an.fsf@macbook.be.48ers.dk> <20120410085328.21507bc2@skate>
Message-ID: <87y5pyase5.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> What toolchain is this? Gustavoz added uClibc patches for unshare
 >> support, so if this is uClibc you'll need to rebuild the toolchain.

 Thomas> Well, according to the defconfig, the toolchain is:

 Thomas> BR2_TOOLCHAIN_CTNG=y
 Thomas> BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE=y
 Thomas> BR2_TOOLCHAIN_CTNG_uClibc_INET_IPV6=y
 Thomas> BR2_TOOLCHAIN_CTNG_uClibc_INET_RPC=y
 Thomas> BR2_TOOLCHAIN_CTNG_uClibc_LOCALE=y
 Thomas> BR2_TOOLCHAIN_CTNG_CXX=y

 Thomas> So it's a toolchain generated with our crosstool-NG backend, which
 Thomas> apparently does not use the uClibc patches we have added for the
 Thomas> internal backend.

No, it doesn't, and I seems nontrivial to me to make it do so as ctng
includes it's own patches which may conflict with "ours".

Doubling the safe/extra patches as patches-to-ctng (so
patches-to-patches) also isn't really nice.

Our ctng version is also still using 0.9.32.

-- 
Bye, Peter Korsgaard
