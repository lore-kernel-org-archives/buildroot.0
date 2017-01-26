From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 26 Jan 2017 21:59:15 +0100
Subject: [Buildroot] [PATCH] legacy/xserver: add a legacy entry for
 xserver >= 1.19.0
In-Reply-To: <f51b9d8d-6853-b7fc-b16d-5205dda0da21@mind.be>
References: <20170108222011.3839-1-romain.naour@gmail.com>
 <20170108222011.3839-2-romain.naour@gmail.com>
 <20170124233306.40f3d345@free-electrons.com>
 <f51b9d8d-6853-b7fc-b16d-5205dda0da21@mind.be>
Message-ID: <20170126205915.GC3413@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-01-25 11:56 +0100, Arnout Vandecappelle spake thusly:
> 
> 
> On 24-01-17 11:33, Thomas Petazzoni wrote:
> > Hello,
> > 
> > On Sun,  8 Jan 2017 23:20:11 +0100, Romain Naour wrote:
> >> The legacy entry was missing in commit [1].
> >>
> >> [1] ec502ea8e4fec1e113b5f7c532809a05644a9fd4
> >>
> >> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> >> Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
> >> ---
> >>  Config.in.legacy | 7 +++++++
> >>  1 file changed, 7 insertions(+)
> >>
> >> diff --git a/Config.in.legacy b/Config.in.legacy
> >> index 20445b8..8dfbbc8 100644
> >> --- a/Config.in.legacy
> >> +++ b/Config.in.legacy
> >> @@ -145,6 +145,13 @@ endif
> >>  ###############################################################################
> >>  comment "Legacy options removed in 2017.02"
> >>  
> >> +config BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX
> >> +	bool "xserver AIGLX Extension removed"
> >> +	depends on !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_14 && !BR2_PACKAGE_XSERVER_XORG_SERVER_V_1_17
> >> +	select BR2_LEGACY
> >> +	help
> >> +	  The xserver AIGLX Extension has been removed in 1.19.0 release.
> > 
> > Hum, but then we have the BR2_PACKAGE_XSERVER_XORG_SERVER_AIGLX option
> > defined in two different places, with two different prompts. Do we
> > really want to do this?
> 
>  No we don't. We certainly don't want that changing some option (the server
> version) suddenly creates a legacy option.

My stake on this:

  - we must add a legacy entry for 1.18

  - we must not add a legacy entry for AIGLX, because it is not yet
    legacy. It will turn legacy when the last xserver version we have
    that support AIGLX is dropped. For now, it is just an package option
    that is only available with some versions (1.17 and 1.14).

>  Also, legacy is not needed here: it never was possible (in a released
> buildroot) to select this option for v1.19.0+.

Agreed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
