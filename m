From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 04 Jun 2014 12:47:23 +0200
Subject: [Buildroot] [PATCH v2] Allow setting the password for user
	default
In-Reply-To: <1401787751-32600-1-git-send-email-sho@relinux.de> (Stephan
 Hoffmann's message of "Tue, 3 Jun 2014 11:29:11 +0200")
References: <1401787751-32600-1-git-send-email-sho@relinux.de>
Message-ID: <87ppipossk.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:

 > Signed-off-by: Stephan Hoffmann <sho@relinux.de>
 > ---
 > Since we can set the password for root while configuring the system
 > it seems logical to have the same possibility for user "default".

 > Changes v1 -> v2
 >   - remove rewording in help text for BR2_TARGET_GENERIC_ROOT_PASSWD
 > ---
 >  system/Config.in | 23 ++++++++++++++++++++++-
 >  system/system.mk | 11 ++++++++++-
 >  2 files changed, 32 insertions(+), 2 deletions(-)

 > diff --git a/system/Config.in b/system/Config.in
 > index 53bca53..d5408e1 100644
 > --- a/system/Config.in
 > +++ b/system/Config.in
 > @@ -211,6 +211,27 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
 >  	  in the build log! Avoid using a valuable password if either the
 >  	  .config file or the build log may be distributed!
 
 > +config BR2_TARGET_GENERIC_DEFAULT_PASSWD
 > +	string "Password for user default"
 > +	default ""
 > +	help
 > +	  Set the initial password for user default (in clear). It will be encrypted.
 > +
 > +	  If set to empty (the default), then no password will be set,
 > +	  and default will need no password to log in.

I would actually rather get rid of the 'default' user, now that we have
support for BR2_ROOTFS_USERS_TABLES. The 'default' user is not needed
for anything in Buildroot itself, and I'm pretty sure some people might
not know / remember that we always have this password-less user and
remember to remove it in a post build - I know I haven't.

Do you have any use case for keeping it instead of just using
BR2_ROOTFS_USERS_TABLES?

-- 
Bye, Peter Korsgaard
