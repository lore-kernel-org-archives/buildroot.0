From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 24 Apr 2015 19:40:40 +0200
Subject: [Buildroot] [PATCH 09/30] package/matchbox: make
 match-startup-monitor a real package
In-Reply-To: <55396B6F.2040004@mind.be>
References: <cover.1429725549.git.yann.morin.1998@free.fr>
 <b5a7a6e89a61acaa154c10b6e9cef08404f913a8.1429725549.git.yann.morin.1998@free.fr>
 <55396B6F.2040004@mind.be>
Message-ID: <20150424174040.GD4244@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-24 00:00 +0200, Arnout Vandecappelle spake thusly:
> On 04/22/15 20:09, Yann E. MORIN wrote:
[--SNIP--]
> > diff --git a/package/matchbox/matchbox-startup-monitor/Config.in b/package/matchbox/matchbox-startup-monitor/Config.in
> > new file mode 100644
> > index 0000000..4dd088f
> > --- /dev/null
> > +++ b/package/matchbox/matchbox-startup-monitor/Config.in
> > @@ -0,0 +1,2 @@
> > +config BR2_PACKAGE_MATCHBOX_STARTUP_MONITOR
> > +	bool
> 
>  This changes behaviour: it used to be selected automatically when
> startup-notification was selected. So you should add
> 
> 	default y if BR2_PACKAGE_STARTUP_NOTIFICATION
> 
>  Of course, that's going to be reverted anyway when you later add a prompt to
> this package, so perhaps it's not that important.

Well, I've done as you suggested, so this patch does not introduce a
change in behaviour, and is purely a cleanup patch.

The change in beaviour is being done in a following patch.

Thanks!

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
