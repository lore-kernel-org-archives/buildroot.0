From: Hans-Christian Egtvedt <hcegtvedt@norway.atmel.com>
Date: Thu, 26 Jul 2007 09:01:21 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-lib
In-Reply-To: <20070723133400.GC7902@aon.at>
References: <20070723075415.0C7BDA467A@busybox.net>
	<20070723103336.GA7044@aon.at>
	<1185196685.21840.25.camel@elrond.sweden.atmel.com>
	<20070723133400.GC7902@aon.at>
Message-ID: <1185433281.31437.34.camel@localhost.localdomain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2007-07-23 at 15:34 +0200, Bernhard Fischer wrote:
> On Mon, Jul 23, 2007 at 03:18:05PM +0200, Ulf Samuelsson wrote:

<cut alsa-lib patch and use of install instead of cp>

> Just using install(1) for new packages -- and eventually gradually
> fixing old ones -- is sufficient. We can easily either use busybox's
> install or have our own in buildroot to circumvent eventual buggy
> incarnations on the host. This would also help the MacOS10 folks, i'd
> say.

FYI

IIRC the install shipped with buildroot is buggy (they might have fixed
it). It had a bug when it would not unlink the old file before writing
the new.

Pretty funny trying to upgrade libc then; Busybox would truncate the
file to 0 bytes and then try to copy in the new one, never being able to
complete that job because of missing libc.

-- 
With kind regards,

Hans-Christian Egtvedt, siv.ing. (M.Sc.)
Applications Engineer - AVR32 System Solutions - Atmel Norway
-- 
Mvh
Hans-Christian Egtvedt
