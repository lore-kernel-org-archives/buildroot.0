From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 01 Jun 2018 19:32:47 +0200
Subject: [Buildroot] [PATCH] package/binutils: extend the 2.28 default
 to thumb mode
In-Reply-To: <20180601172629.13505-1-yann.morin.1998@free.fr> (Yann E. MORIN's
 message of "Fri, 1 Jun 2018 19:26:29 +0200")
References: <20180601172629.13505-1-yann.morin.1998@free.fr>
Message-ID: <87o9guxvi8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Commit 17f352ac (package/binutils: default to 2.29 for Cortex-M targets)
 > made the default version 2.28 (and not 2.29!) when the target is an
 > arm-v7m CPU.

 > However, the real trigger is compilation in Thumb mode, not the fact
 > that the target is v7m.

 > The fact that it was noticed on a v7m target is because Thumb is the
 > only mode valid on those CPUs.

 > Tighten the defaults to 2.28 for Thumb and Thumb2 modes.

 > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Laurent GONZALEZ <br22@gezedo.com>
 > Cc: Christophe Priouzeau <christophe.priouzeau@st.com>
 > Cc: Peter Korsgaard <peter@korsgaard.com>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > Cc: Arnout Vandecappelle <arnout@mind.be>
 > ---
 >  package/binutils/Config.in.host | 3 ++-
 >  1 file changed, 2 insertions(+), 1 deletion(-)

 > diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
 > index 4e578ef2ef..de229895c1 100644
 > --- a/package/binutils/Config.in.host
 > +++ b/package/binutils/Config.in.host
 > @@ -2,7 +2,8 @@ comment "Binutils Options"
 
 >  choice
 >  	prompt "Binutils Version"
 > -	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_CPU_ARMV7M
 > +	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB
 > +	default BR2_BINUTILS_VERSION_2_28_X if BR2_ARM_INSTRUCTIONS_THUMB2
 >  	default BR2_BINUTILS_VERSION_2_29_X if !BR2_arc
 >  	default BR2_BINUTILS_VERSION_ARC if BR2_arc
 >  	help

Committed, thanks. Will you also send a patch to update the comment in
linux/Config.in?

-- 
Bye, Peter Korsgaard
