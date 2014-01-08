From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 8 Jan 2014 11:34:04 +0800
Subject: [Buildroot] ParaGUI package?
In-Reply-To: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
References: <DC148C5AA1CEBA4E87973D432B1C2D8817E678D7@P3PWEX4MB008.ex4.secureserver.net>
Message-ID: <20140108113404.413a4685@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Hartley Sweeten,

On Wed, 8 Jan 2014 00:10:29 +0000, Hartley Sweeten wrote:

> I'm trying to find a simple GUI library that can be used with SDL and this one appears
> to cover my needs. Unfortunately the ParaGUI library appears to be a bit dead. The
> latest release at http://download.savannah.gnu.org/releases/paragui/ is
> 
> paragui-1.1.8.tar.gz	19-Oct-2004
> 
> I found a newer branch on https://github.com/pipelka/paragui that appears to be
> version 1.1.11.

My first reaction is: do you really want to start using something that
appears to be dead/deprecated?

> Makefile.am: error: required file './NEWS' not found
> Makefile.am: error: required file './ChangeLog' not found

These seems to be the real problems. Easiest solution is to add a post
patch hook with "touch $(@D)/NEWS $(@D)/ChangeLog"

A cleaner solution is to add the "foreign" option in the
AM_INIT_AUTOMAKE call in configure.in, like:

AM_INIT_AUTOMAKE([1.10 no-define foreign])

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
