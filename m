From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Fri, 27 Jul 2007 17:59:15 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package:  alsa-lib
In-Reply-To: <1185429498.31437.11.camel@localhost.localdomain>
References: <20070723075415.0C7BDA467A@busybox.net>
	<20070723103336.GA7044@aon.at>
	<1185196685.21840.25.camel@elrond.sweden.atmel.com>
	<20070723133400.GC7902@aon.at>
	<1185429498.31437.11.camel@localhost.localdomain>
Message-ID: <20070727155915.GB25147@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 26, 2007 at 07:58:18AM +0200, Hans-Christian Egtvedt wrote:
>
>On Mon, 2007-07-23 at 15:34 +0200, Bernhard Fischer wrote:
>> On Mon, Jul 23, 2007 at 03:18:05PM +0200, Ulf Samuelsson wrote:
>
><cut alsa-lib patch and use of install instead of cp>
>
>> Just using install(1) for new packages -- and eventually gradually
>> fixing old ones -- is sufficient. We can easily either use busybox's
>> install or have our own in buildroot to circumvent eventual buggy
>> incarnations on the host. This would also help the MacOS10 folks, i'd
>> say.
>
>FYI
>
>IIRC the install shipped with buildroot is buggy (they might have fixed
>it). It had a bug when it would not unlink the old file before writing
>the new.

$ echo BAR > foo
$ echo FOO > new
$ ./busybox install new foo
[]
open("new", O_RDONLY)                   = 3
open("foo", O_WRONLY|O_CREAT|O_EXCL, 0100644) = -1 EEXIST (File exists)
unlink("foo")                           = 0
open("foo", O_WRONLY|O_CREAT|O_EXCL, 0100644) = 4
read(3, "FOO\n", 8192)                  = 4
write(4, "FOO\n", 4)                    = 4
read(3, "", 8192)                       = 0
close(4)                                = 0
close(3)                                = 0

So it looks like "they" fixed it.
