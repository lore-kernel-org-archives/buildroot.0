From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 27 May 2016 22:59:24 +0200
Subject: [Buildroot] [PATCH] system: add comment about
	busybox-show-others
In-Reply-To: <20160527225012.2ed6e4e6@free-electrons.com>
References: <1464381291-24985-1-git-send-email-yann.morin.1998@free.fr>
 <20160527225012.2ed6e4e6@free-electrons.com>
Message-ID: <20160527205924.GE3624@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2016-05-27 22:50 +0200, Thomas Petazzoni spake thusly:
> On Fri, 27 May 2016 22:34:51 +0200, Yann E. MORIN wrote:
> 
> >  config BR2_INIT_SYSV
> >  	bool "systemV"
> > +	# BR2_PACKAGE_BUSYBOX_SHOW_OTHERS exists even when Busybox is not enabled
> >  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # sysvinit
> 
> Well, I don't really see the point. You can perfectly well have Busybox
> enabled *and* systemV as your init system.

I'm not arguing that.

What was puzzling me is that BR2_PACKAGE_BUSYBOX_SHOW_OTHERS *appears*
to be a Busybox option.

Package options should not be selected before ensurign that the package
itself is enabled, so we have wither:

    select BR2_PACKAGE_FOO
    select BR2_PACKAGE_FOO_OPTION

or:

    depends on BR2_PACKAGE_FOO
    select BR2_PACKAGE_FOO_OPTION

or:

    select BR2_PACKAGE_FOO_OPTION if BR2_PACKAGE_FOO

However, for this specific option, it is *also* available when Busybox
is *not* enabled: it is not a package option.

So it is perfectly legit to select it without checking that Busybix
itself is enabled.

(Yes, I lost almost 10 minutes hunting that down...)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
