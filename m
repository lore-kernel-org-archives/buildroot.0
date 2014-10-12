From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 12 Oct 2014 21:13:48 +0200
Subject: [Buildroot] [PATCH] libva-intel-driver: add indirect dependency
	on BR2_PREFER_STATIC_LIB
In-Reply-To: <1413135701-588-1-git-send-email-arnout@mind.be> (Arnout
 Vandecappelle's message of "Sun, 12 Oct 2014 19:41:41 +0200")
References: <1413135701-588-1-git-send-email-arnout@mind.be>
Message-ID: <874mv9t82b.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:

 > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
 > ---
 >  package/libva-intel-driver/Config.in | 6 ++++--
 >  1 file changed, 4 insertions(+), 2 deletions(-)

 > diff --git a/package/libva-intel-driver/Config.in b/package/libva-intel-driver/Config.in
 > index 89a3264..16e7ced 100644
 > --- a/package/libva-intel-driver/Config.in
 > +++ b/package/libva-intel-driver/Config.in
 > @@ -9,11 +9,13 @@ config BR2_PACKAGE_LIBVA_INTEL_DRIVER
 >  	depends on BR2_i386 || BR2_x86_64
 >  	depends on BR2_TOOLCHAIN_HAS_THREADS # libdrm/libpthread-stubs
 >  	depends on BR2_LARGEFILE # libdrm
 > +        depends on !BR2_PREFER_STATIC_LIB # libva

Should have been indented with a <tab>. Committed with that fixed,
thanks.

-- 
Bye, Peter Korsgaard
