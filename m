From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 22 Feb 2014 22:16:37 +0100
Subject: [Buildroot] [PATCH] Fix backup and kernel download url.
In-Reply-To: <1393022016-7804-1-git-send-email-ps.report@gmx.net> (Peter
 Seiderer's message of "Fri, 21 Feb 2014 23:33:36 +0100")
References: <1393022016-7804-1-git-send-email-ps.report@gmx.net>
Message-ID: <878ut2sv9m.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Seiderer <ps.report@gmx.net> writes:

 > Remove duplicated slash from backup and kernel download url,
 > e.g. http://www.kernel.org/pub//linux/kernel/v3.x/linux-3.13.3.tar.xz

This should normally not matter, so I don't think it actually "fixes"
something, but it's a bit cleaner and we don't have trailing slashes on
our other URLs, so ok - Committed, thanks.

 > Signed-off-by: Peter Seiderer <ps.report@gmx.net>
 > ---
 >  Config.in | 4 ++--
 >  1 file changed, 2 insertions(+), 2 deletions(-)

 > diff --git a/Config.in b/Config.in
 > index bcfefc7..d05f4b1 100644
 > --- a/Config.in
 > +++ b/Config.in
 > @@ -173,7 +173,7 @@ if !BR2_PRIMARY_SITE_ONLY
 
 >  config BR2_BACKUP_SITE
 >  	string "Backup download site"
 > -	default "http://sources.buildroot.net/"
 > +	default "http://sources.buildroot.net"
 >  	help
 >  	  Backup site to download from. If this option is set then buildroot
 >  	  will fall back to download package sources from here if the
 > @@ -181,7 +181,7 @@ config BR2_BACKUP_SITE
 
 >  config BR2_KERNEL_MIRROR
 >  	string "Kernel.org mirror"
 > -	default "http://www.kernel.org/pub/"
 > +	default "http://www.kernel.org/pub"
 >  	help
 >  	  kernel.org is mirrored on a number of servers around the world.
 >  	  The following allows you to select your preferred mirror.
 > -- 
 > 1.8.1.4

 > _______________________________________________
 > buildroot mailing list
 > buildroot at busybox.net
 > http://lists.busybox.net/mailman/listinfo/buildroot


-- 
Bye, Peter Korsgaard
