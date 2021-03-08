From: Thomas Huth <huth@tuxfamily.org>
Date: Mon, 8 Mar 2021 05:15:51 +0100
Subject: [Buildroot] [PATCH] package/frotz: Update to version 2.53
In-Reply-To: <20210307214115.GG2275@scaer>
References: <20210307152147.514774-1-huth@tuxfamily.org>
 <20210307214115.GG2275@scaer>
Message-ID: <20210308051551.3dace767@tuxfamily.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sun, 7 Mar 2021 22:41:15 +0100
schrieb "Yann E. MORIN" <yann.morin.1998@free.fr>:

> Thomas, All,
> 
> On 2021-03-07 16:21 +0100, Thomas Huth spake thusly:
[...]
> > diff --git a/package/frotz/Config.in b/package/frotz/Config.in
> > index b73beea330..9473f5944d 100644
> > --- a/package/frotz/Config.in
> > +++ b/package/frotz/Config.in
> > @@ -1,14 +1,10 @@
> >  config BR2_PACKAGE_FROTZ
> >  	bool "frotz"
> > -	depends on BR2_TOOLCHAIN_HAS_THREADS
> >  	select BR2_PACKAGE_NCURSES
> >  	help
> >  	  Frotz is an interpreter for old Infocom adventure games
> > and
> > -	  other Z-code games. Note that frotz can not be run as
> > root.
> > +	  other Z-code games. Note that frotz cannot be run as
> > root.  
> 
> Out of curiosity: what is the technical reason this is not possible?

I don't know for sure, but I think it's because Frotz is running
untrusted byte code - so if there's a bug in the interpreter, some
malicious byte code could get root access to the system.

> There is an explicit check in src/curses/ux_init.c, but except for
> that, I could not easily spot a reason for not being able to run as
> root...
> 
> >  	  You must add a normal user to your buildroot
> > configuration to be able to use it.  
> 
> Why don't we then define one, like:
> 
>     define FROTS_USERS
>         frotz -1 frotz -1 - - - -
>     endef

Not sure whether it makes sense to hard-code a user without password
here...? IMHO it makes more sense to leave that decision (how should
the user be called? should the account get a password or not?) to the
person who creates the buildroot image.

 Thomas
