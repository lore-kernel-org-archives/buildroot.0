From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 14 Aug 2013 00:29:57 +0200
Subject: [Buildroot] [PATCH 1/1 v2] Hide issue and hostname menu when
 using a custom skeleton.
In-Reply-To: <20130814001125.13282e32@skate>
References: <1358102400-9628-1-git-send-email-sagaert.johan@skynet.be>
 <20130814001125.13282e32@skate>
Message-ID: <20130813222957.GB3427@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-08-14 00:11 +0200, Thomas Petazzoni spake thusly:
> Gustavo, Yann, Thomas, Arnout,
> 
> What do you think of the below patch?

I think the idea behind the patch is valid.

However, I've not teted it, so I can't say if the patch is OK or not.
With a simple look at system/system.mk, it seems it would work as
expected.

> My main concern is that it handles the case of /etc/issue
> and /etc/hostname, but I see potentially other "System configuration"
> parameters that may conflict with a custom skeleton.
> 
> Thoughts?

I'd say, we should take it, and if some other "System configuration"
items need to be guarded behind BR2_ROOTFS_SKELETON_DEFAULT, we can
still move them later when the need arises.
 
> Thomas
> 
> On Sun, 13 Jan 2013 19:39:59 +0100, Sagaert Johan wrote:
> > 
> > Only show hostname and issue options when the default skeleton is selected.
> > Moved the menu sections so that when a custom skeleton is selected the 
> > issue and hostname options are hidden.
> > 
> > Signed-off-by: Sagaert Johan <sagaert.johan@skynet.be>
> > ---
> >  v2 : Only hide issue and hostname menu when a custom skeleton is selected.
> > 
> >  system/Config.in | 24 ++++++++++++------------
> >  1 file changed, 12 insertions(+), 12 deletions(-)
> > 
> > diff --git a/system/Config.in b/system/Config.in
> > index 69863c4..5b38cae 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -1,17 +1,5 @@
> >  menu "System configuration"
> >  
> > -config BR2_TARGET_GENERIC_HOSTNAME
> > -       string "System hostname"
> > -       default "buildroot"
> > -       help
> > -         Select system hostname to be stored in /etc/hostname.
> > -
> > -config BR2_TARGET_GENERIC_ISSUE
> > -       string "System banner"
> > -       default "Welcome to Buildroot"
> > -       help
> > -         Select system banner (/etc/issue) to be displayed at login.
> > -
> >  choice
> >  	bool "Passwords encoding"
> >  	default BR2_TARGET_GENERIC_PASSWD_MD5
> > @@ -173,6 +161,18 @@ endif
> >  
> >  if BR2_ROOTFS_SKELETON_DEFAULT
> >  
> > +config BR2_TARGET_GENERIC_HOSTNAME
> > +       string "System hostname"
> > +       default "buildroot"
> > +       help
> > +         Select system hostname to be stored in /etc/hostname.
> > +
> > +config BR2_TARGET_GENERIC_ISSUE
> > +       string "System banner"
> > +       default "Welcome to Buildroot"
> > +       help
> > +         Select system banner (/etc/issue) to be displayed at login.
> > +
> >  config BR2_TARGET_GENERIC_ROOT_PASSWD
> >  	string "Root password"
> >  	default ""
> 
> 
> 
> -- 
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
