From: Jeremy Rosen <jeremy.rosen@openwide.fr>
Date: Mon, 10 Dec 2012 11:51:38 +0100 (CET)
Subject: [Buildroot] [PATCH] [RFC] new target: live filesystem
In-Reply-To: <50C58B3F.4080901@mind.be>
Message-ID: <1d14db13-a03d-496c-9e7a-3eb180d9fe11@zimbra2.corp.accelance.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As usual, sniped what I agree with and v4 is on the way

> > diff --git a/fs/Config.in b/fs/Config.in
> > index da4c5ff..664d2f6 100644
> > --- a/fs/Config.in
> > +++ b/fs/Config.in
> > @@ -11,5 +11,6 @@ source "fs/romfs/Config.in"
> >   source "fs/squashfs/Config.in"
> >   source "fs/tar/Config.in"
> >   source "fs/ubifs/Config.in"
> > +source "fs/live/Config.in"
> 
>   Was there a problem with sorting this alphabetically?

just a mixup between my "sort alphabetically" and my "live" patches... fixing that

> > +
> > +if grep ^BR2_TARGET_ROOTFS_LIVE=y $CONFIG_FILE>  /dev/null ; then
> 
>   We use 'grep -q' rather than redirecting to /dev/null.
> 

I copied how it was done for locale that redirect to /dev/null, thus my mistake

I'll fix that in v4, but not the locale ones (to avoid mixup in my patch)



Thx for the comments, i'll wait a little to see if more comments come and then i'll send a V4

I also need to see what to do  with "make distclean" when the live filesystem is in output/

currently there are all sorts of permission-denied errors, and i'm not sure what to do here...

* I could use the config options to run "sudo rm" but i'm not sure we want to read the config option in distclean
* I could just leave it as is and just say the user is smart enough to run "sudo make distclean" in that case
* I could blindly run "sudo rm" in output but that sounds a bit dangerous


I tend to think the second option is the best, but i'd gladly get feedback on that one
