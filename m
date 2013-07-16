From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 16 Jul 2013 13:53:46 +0200
Subject: [Buildroot] [PATCHv3 02/14] arch: Refactor BR2_SOFT_FLOAT into
	per-architecture options
In-Reply-To: <1373961805-3901-3-git-send-email-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 16 Jul 2013 10:03:13 +0200")
References: <1373961805-3901-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1373961805-3901-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <874nbu3elx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> As we are going to introduced a more advanced support of floating
 Thomas> point options for the ARM architecture, we need to adjust how the
 Thomas> soft-float option is handled. We replace the current hidden option
 Thomas> BR2_PREFER_SOFT_FLOAT option and the visible BR2_SOFT_FLOAT option by:

 Thomas>  * A global hidden BR2_SOFT_FLOAT option, defined in arch/Config.in,
 Thomas>    that tells whether the architecture-specific code is using software
 Thomas>    emulated floating point. This hidden option can be used throughout
 Thomas>    Buildroot to determine whether soft float is used or not.

 Thomas>  * Per-architecture visible BR2_<arch>_SOFT_FLOAT options, for the
 Thomas>    architecture for which it makes sense, which allows users to select
 Thomas>    soft float emulation when needed.

 Thomas> This change will allow each architecture to have a different way of
 Thomas> presenting its floating point capabilities.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  arch/Config.in                |  3 +++
 Thomas>  arch/Config.in.arm            | 10 ++++++++++
 Thomas>  arch/Config.in.mips           | 10 ++++++++++
 Thomas>  arch/Config.in.powerpc        |  9 +++++++++

What about arc/avr32/bfin/microblaze/sh/sparc/xtensa? Some of them
apparently were broken in this regard already, and some of them are not
supported by the internal toolchain, but with this change atleast
Buildroot will always think they use hardfloat.

-- 
Bye, Peter Korsgaard
