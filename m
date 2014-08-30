From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 30 Aug 2014 23:59:14 +0200
Subject: [Buildroot] [PATCH] libgpgme: Take into account that gnupg and
	gnupg2 are mutual exclusive
In-Reply-To: <1409228181-29052-1-git-send-email-Vincent.Riera@imgtec.com>
 (Vicente Olivert Riera's message of "Thu, 28 Aug 2014 13:16:21 +0100")
References: <1409228181-29052-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <87fvgdoczx.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Avoid that libgpgme can select the gnupg package although gnupg2 has
 > been already selected. Both packages are mutual exclusive and shouldn't
 > be selected at the same time.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/libgpgme/Config.in |    2 +-
 >  1 files changed, 1 insertions(+), 1 deletions(-)

 > diff --git a/package/libgpgme/Config.in b/package/libgpgme/Config.in
 > index a303bfa..e176dac 100644
 > --- a/package/libgpgme/Config.in
 > +++ b/package/libgpgme/Config.in
 > @@ -2,7 +2,7 @@ config BR2_PACKAGE_LIBGPGME
 >  	bool "libgpgme"
 >  	depends on BR2_USE_MMU # libassuan
 >  	#gnupg is not needed to build, but at runtime.
 > -	select BR2_PACKAGE_GNUPG
 > +	select BR2_PACKAGE_GNUPG if !BR2_PACKAGE_GNUPG2

Committed, thanks.

I'm not familiar with libgpgme. Does it need to be configured somehow to
use gpg2 instead of gpg? Would it make sense to automatically configure
this if BR2_PACKAGE_GNUPG2 is enabled?

-- 
Bye, Peter Korsgaard
