From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 17 Jun 2015 22:58:08 +0200
Subject: [Buildroot] [PATCH 1/1] system: make /bin/sh symlink use
	relative path
In-Reply-To: <64CA5C49A43E314D9F7DAE05370E2F7B067710C0@hed-dc01.hed.local>
References: <64CA5C49A43E314D9F7DAE05370E2F7B05F54E71@hed-dc01.hed.local>
 <20150616212806.GB3643@free.fr>
 <64CA5C49A43E314D9F7DAE05370E2F7B067710C0@hed-dc01.hed.local>
Message-ID: <20150617205807.GA8155@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Matthew, All,

On 2015-06-16 17:02 -0500, Matthew Starr spake thusly:
> > -----Original Message-----
> > From: Yann E. MORIN [mailto:yann.morin.1998 at gmail.com] On Behalf Of
> > Yann E. MORIN
> > 
> > Matthew, All,
> > 
> > On 2015-06-16 15:42 -0500, Matthew Starr spake thusly:
> > > The symlink created by buildroot for /bin/sh is the full path to a
> > > shell.  This does not match what busybox and other Linux distributions
> > > do with using relative path symlinks. When handling files on the host
> > > system this will point to the host system's shell if present and not
> > > the target shell.
> > >
> > > This is fixed by changing the /bin/sh symlink to use relative a path
> > 
> > ...a relative path.
> > 
> > > since both files are in the same directory.
> > 
> > Relative paths can be made even for t=files not in the same directory, so I
> > don;t think there's much need for that end of the sentence (starting with
> > 'since').
> > 
> > > This was reported as Bug #8161 at bugs.busybox.net
> > 
> > We usually state that with something like;
> > 
> >     Fixes #8161
> > 
> > since the maintainer greps for that pattern when doing the announcement
> > mail (to credit bug fixers).
> 
> Would you like me to submit a new version of the patch with the changes
> to the commit message listed above?

No, I don't think there's a need to respin. The maintainer can tweak the
commit log if he ses fit.

Thanks! :-)

Regards,
Yann E. MORIN.

> > > Signed-off-by: Matthew Starr <mstarr@hedonline.com>
> > 
> > Otherwise:
> > 
> > Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > 
> > Regards,
> > Yann E. MORIN.
> > 
> > > ---
> > >  system/Config.in | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/system/Config.in b/system/Config.in index
> > > 84cde94..15f0515 100644
> > > --- a/system/Config.in
> > > +++ b/system/Config.in
> > > @@ -236,10 +236,10 @@ endchoice # /bin/sh
> > >
> > >  config BR2_SYSTEM_BIN_SH
> > >  	string
> > > -	default "/bin/busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
> > > -	default "/bin/bash"    if BR2_SYSTEM_BIN_SH_BASH
> > > -	default "/bin/dash"    if BR2_SYSTEM_BIN_SH_DASH
> > > -	default "/bin/zsh"     if BR2_SYSTEM_BIN_SH_ZSH
> > > +	default "busybox" if BR2_SYSTEM_BIN_SH_BUSYBOX
> > > +	default "bash"    if BR2_SYSTEM_BIN_SH_BASH
> > > +	default "dash"    if BR2_SYSTEM_BIN_SH_DASH
> > > +	default "zsh"     if BR2_SYSTEM_BIN_SH_ZSH
> > >
> > >  config BR2_TARGET_GENERIC_GETTY
> > >  	bool "Run a getty (login prompt) after boot"
> > > --
> > > 2.1.4
> 
> Best regards,
> Matthew Starr

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
