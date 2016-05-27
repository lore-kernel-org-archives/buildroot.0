From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 May 2016 23:17:19 +0200
Subject: [Buildroot] [PATCH] system: add comment about
	busybox-show-others
In-Reply-To: <20160527231000.56429fde@free-electrons.com>
References: <1464381291-24985-1-git-send-email-yann.morin.1998@free.fr>
 <20160527225012.2ed6e4e6@free-electrons.com>
 <20160527205924.GE3624@free.fr>
 <20160527231000.56429fde@free-electrons.com>
Message-ID: <20160527211719.GF3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-05-27 23:10 +0200, Thomas Petazzoni spake thusly:
> On Fri, 27 May 2016 22:59:24 +0200, Yann E. MORIN wrote:
> > What was puzzling me is that BR2_PACKAGE_BUSYBOX_SHOW_OTHERS *appears*
> > to be a Busybox option.
[--SNIP--]
> > However, for this specific option, it is *also* available when Busybox
> > is *not* enabled: it is not a package option.
> > 
> > So it is perfectly legit to select it without checking that Busybix
> > itself is enabled.
> 
> Then change the code to:
> 
> 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS if BR2_PACKAGE_BUSYBOX

That's what I initially did, but it looked weird to me.

But I'm fine with it if you prefer.

> Indeed, when BR2_PACKAGE_BUSYBOX is disabled,
> BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is *always* set to 'y'.

Yes, and thus there is no need to select it...

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
