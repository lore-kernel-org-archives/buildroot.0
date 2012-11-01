From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 1 Nov 2012 18:00:59 +0100
Subject: [Buildroot] [PATCH 2/7] support/scripts: add a script to add a
	new package
In-Reply-To: <20121101100910.0cfe5b84@skate>
References: <1347234052-10527-1-git-send-email-yann.morin.1998@free.fr>
 <5091D7B6.8070703@mind.be> <20121101100910.0cfe5b84@skate>
Message-ID: <201211011800.59868.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On Thursday 01 November 2012 Thomas Petazzoni wrote:
> However, I also wonder if it is a good idea to make this script
> ask questions, as compared to a more conventional script that takes
> command line arguments. But it's true that a script asking questions is
> more like a wizard, probably easier to use.

Indeed, the script is designed as a wizard for newbies, so they do not
find it too complex to add a new package, especially since the
_AVAILABLE stuff can be a bit misleading.

It's also meant for experts to quickly add a new package. For them, it
might be better to get the values from the arguments, rather than asking
questions, right. This script can be refined later for this use-case.

> > > +		define ${PKG_NAME}_INSTALL_TARGET_CMDS
> > 
> >   Putting a sample
> > 	install -D -m 0644 $(@D)/... $(TARGET_DIR)/...
> > isn't a bad idea.
> 
> Not sure I agree here. People too often do manual installation in
> generic packages, while they should use 'make install', possibly after
> tunning/patching the Makefile.

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
