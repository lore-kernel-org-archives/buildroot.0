From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 13 Jun 2014 23:00:51 +0200
Subject: [Buildroot] [PATCH v2] gcc 4.8.x does not compile a working
	kernel for sparc
In-Reply-To: <20140613170047.GA10615@waldemar-brodkorb.de> (Waldemar
 Brodkorb's message of "Fri, 13 Jun 2014 19:00:48 +0200")
References: <20140613170047.GA10615@waldemar-brodkorb.de>
Message-ID: <87lht0cynw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Waldemar" == Waldemar Brodkorb <wbx@openadk.org> writes:

 > Since the switch to 4.8.x as default, the qemu-sparc target is broken.
 > For a gcc bug report see here:
 > https://gcc.gnu.org/bugzilla/show_bug.cgi?id=60624

 > Switch back to gcc 4.7.x as default for sparc.
 > Disable 4.8/4.9 as suggested by Thomas Petazzoni.
 > I even disabled gcc snapshot, it works right now, because
 > it is an old 4.8.0 snapshot by default, but as soon as this is updated
 > sparc build will break.

 > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
 > ---
 >  package/gcc/Config.in.host |    7 ++++---
 >  1 file changed, 4 insertions(+), 3 deletions(-)

 > diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
 > index 3bdfffc..309750c 100644
 > --- a/package/gcc/Config.in.host
 > +++ b/package/gcc/Config.in.host
 > @@ -10,6 +10,7 @@ choice
 >  	prompt "GCC compiler Version"
 >  	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
 >  	default BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 if BR2_avr32
 > +	default BR2_GCC_VERSION_4_7_X if BR2_sparc

On a related note, this was presumably for the v8 variant? Do you know
if we still need to stick to gcc 4.4.x for the leon variants?

-- 
Bye, Peter Korsgaard
