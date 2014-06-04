From: Stephan Hoffmann <sho@relinux.de>
Date: Wed, 04 Jun 2014 13:46:22 +0200
Subject: [Buildroot] [PATCH v2] Allow setting the password for user
	default
In-Reply-To: <87ppipossk.fsf@dell.be.48ers.dk>
References: <1401787751-32600-1-git-send-email-sho@relinux.de>
 <87ppipossk.fsf@dell.be.48ers.dk>
Message-ID: <538F070E.7000705@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04.06.2014 12:47, Peter Korsgaard wrote:
>>>>>> "Stephan" == Stephan Hoffmann <sho@relinux.de> writes:
>  > Signed-off-by: Stephan Hoffmann <sho@relinux.de>
>  > ---
>  > Since we can set the password for root while configuring the system
>  > it seems logical to have the same possibility for user "default".
>
>  > Changes v1 -> v2
>  >   - remove rewording in help text for BR2_TARGET_GENERIC_ROOT_PASSWD
>  > ---
>  >  system/Config.in | 23 ++++++++++++++++++++++-
>  >  system/system.mk | 11 ++++++++++-
>  >  2 files changed, 32 insertions(+), 2 deletions(-)
>
>  > diff --git a/system/Config.in b/system/Config.in
>  > index 53bca53..d5408e1 100644
>  > --- a/system/Config.in
>  > +++ b/system/Config.in
>  > @@ -211,6 +211,27 @@ config BR2_TARGET_GENERIC_ROOT_PASSWD
>  >  	  in the build log! Avoid using a valuable password if either the
>  >  	  .config file or the build log may be distributed!
>  
>  > +config BR2_TARGET_GENERIC_DEFAULT_PASSWD
>  > +	string "Password for user default"
>  > +	default ""
>  > +	help
>  > +	  Set the initial password for user default (in clear). It will be encrypted.
>  > +
>  > +	  If set to empty (the default), then no password will be set,
>  > +	  and default will need no password to log in.
>
> I would actually rather get rid of the 'default' user, now that we have
> support for BR2_ROOTFS_USERS_TABLES. The 'default' user is not needed
> for anything in Buildroot itself, and I'm pretty sure some people might
> not know / remember that we always have this password-less user and
> remember to remove it in a post build - I know I haven't.
Good point, Peter!

This patch was sitting around here for a while and I obviously missed
the invention of BR2_ROOTFS_USERS_TABLES.

> Do you have any use case for keeping it instead of just using
> BR2_ROOTFS_USERS_TABLES?
No, so we shall drop this patch. I can also cook a patch that removes
the old default user, because I definitively do not want to have it
without the possibility to give it a password easily.

Kind regards

Stephan
>


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de Stephan at reLinux.de
