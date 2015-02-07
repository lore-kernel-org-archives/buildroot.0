From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 07 Feb 2015 21:14:47 +0100
Subject: [Buildroot] [PATCH 11/21] oprofile: add missing indirect
	dependency on NPTL for PPC
In-Reply-To: <1423010059-23446-12-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Wed, 4 Feb 2015 01:34:09 +0100")
References: <1423010059-23446-1-git-send-email-arnout@mind.be>
 <1423010059-23446-12-git-send-email-arnout@mind.be>
Message-ID: <874mqx7a2w.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 >  package/oprofile/Config.in | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
 > index 3ea07d9..8c9b39f 100644
 > --- a/package/oprofile/Config.in
 > +++ b/package/oprofile/Config.in
 > @@ -9,7 +9,7 @@ config BR2_PACKAGE_OPROFILE
 >  	depends on BR2_USE_WCHAR # binutils
 >  	depends on !BR2_xtensa
 >  	# libpfm4 is needed on PowerPC, and requires thread support
 > -	depends on BR2_TOOLCHAIN_HAS_THREADS || !BR2_powerpc
 > +	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_powerpc
 >  	help
 >  	  OProfile is a system-wide profiler for Linux systems,
 >  	  capable of profiling all running code at low overhead.
 > @@ -31,6 +31,6 @@ comment "oprofile needs a toolchain w/ C++, wchar"
 >  	depends on !BR2_aarch64 && !BR2_nios2 && !BR2_xtensa
 >  	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_USE_WCHAR
 
 > -comment "oprofile needs a toolchain w/ threads on PPC"
 > +comment "oprofile needs a toolchain w/ NPTL on PPC"
 >  	depends on BR2_USE_MMU && BR2_powerpc
 >  	depends on !BR2_TOOLCHAIN_HAS_THREADS

This should then also be !BR2_TOOLCHAIN_HAS_THREADS_NPTL.

-- 
Bye, Peter Korsgaard
