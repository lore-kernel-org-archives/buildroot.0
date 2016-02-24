From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Feb 2016 21:02:40 +0100
Subject: [Buildroot] [PATCH 2/2] gcc: remove 4.5.x
In-Reply-To: <1456336840-14890-2-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Wed, 24 Feb 2016 15:00:40 -0300")
References: <1456336840-14890-1-git-send-email-gustavo@zacarias.com.ar>
 <1456336840-14890-2-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87io1d3mhr.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 > It's been deprecated for some time now.
 > Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 > ---
 >  Config.in.legacy           |  9 +++++++++
 >  package/gcc/Config.in.host | 26 --------------------------
 >  2 files changed, 9 insertions(+), 26 deletions(-)

 > diff --git a/Config.in.legacy b/Config.in.legacy
 > index 081bacd..7d2e5e7 100644
 > --- a/Config.in.legacy
 > +++ b/Config.in.legacy
 > @@ -143,6 +143,15 @@ comment "----------------------------------------------------"
 >  endif
 
 >  ###############################################################################
 > +comment "Legacy options removed in 2016.05"
 > +
 > +config BR2_GCC_VERSION_4_5_X
 > +	bool "gcc 4.5.x has been removed"
 > +	select BR2_LEGACY
 > +	help
 > +	  The 4.5.x version of gcc has been removed. Use a newer
 > +	  version instead.
 > +
 >  comment "Legacy options removed in 2016.02"
 
 >  config BR2_PACKAGE_DOVECOT_BZIP2
 > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
 > index c677c65..f86a12e 100644
 > --- a/package/gcc/Config.in.host
 > +++ b/package/gcc/Config.in.host
 > @@ -13,31 +13,6 @@ choice
 >  	help
 >  	  Select the version of gcc you wish to use.
 
 > -	config BR2_GCC_VERSION_4_5_X
 > -		bool "gcc 4.5.x"
 > -		depends on BR2_DEPRECATED_SINCE_2015_05
 > -		# Broken or unsupported architectures
 > -		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
 > -			&& !BR2_powerpc64le && !BR2_nios2
 > -		# Broken or unsupported ARM cores
 > -		depends on !BR2_cortex_a7 && !BR2_cortex_a12 && \
 > -			!BR2_cortex_a15 && !BR2_fa526 && !BR2_pj4

This doesn't apply (seems like you you don't have the commit adding the
A17 ARM variant), and you forgot to remove our gcc patches.

What do we do with our 4.5 based external toolchains and
BR2_TOOLCHAIN_GCC_AT_LEAST_4_5 (used by directfb)?

Care to send a v2?

-- 
Bye, Peter Korsgaard
