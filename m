From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 25 Jun 2007 15:40:08 +0200
Subject: [Buildroot] Can "make <>_defconfig" rules be restored?
In-Reply-To: <1182777605.10703.37.camel@localhost.localdomain>
References: <01c301c7b519$52679b40$6e02a8c0@k2> <20070623093927.GG4096@aon.at>
	<003801c7b605$0e32cb10$6604a8c0@shukson>
	<1182776909.20950.4.camel@aeglos.sweden.atmel.com>
	<1182777605.10703.37.camel@localhost.localdomain>
Message-ID: <20070625134008.GA7287@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jun 25, 2007 at 03:20:05PM +0200, Hans-Christian Egtvedt wrote:
>On Mon, 2007-06-25 at 15:08 +0200, Ulf Samuelsson wrote:
>> > >>
>> > >>I would like to use "_defconfig" files to save and restore specific 
>> > >>defaults
>> > >>for several platforms.
>> > >>
>> > >>The Makefile at one point supported loading of user defined "_defconfig"
>> > >>files. In the current Makefile the noconfig_targets part of "_defconfig" 
>> > >>is
>> > >>commented out.
>> > >>
>> > >
>> > > Yes, the problem with this kind of _defconfig was that in a tree that
>> > > had already one or two compiled arches lying around, the find was the
>> > > cause for a delay in the order of several minutes on my box.
>> > The purpose of this patch is to have several arches lying around.
>> > 
>> It is not particularily efficient to search the whole tree for config files.

That whole quirk is not efficient, that's why i don't use it but have my
configs separarately and do a simple
'make reconfigure CONFIG_DEFCONFIG=/my/foo-config'

As long as you folks don't slow down my testsuite like that (")??=% find
invocation did, i'm happy. That %_defconfig thing is something that i do
not want (and do not want to understand either), and as it doesn't hurt
me and complicates maintenance (which it doesn't from my POV), then it's
fine to apply.

I'm attaching the hunk that i am using to do something like you guy seem
to be up to (or perhaps not, dunno) for your amusement. No find, no ugly
separate dirs that reside in svn, nothing disturbing, just simply does
what it's supposed to do, and doesn't add any bloat or creeping
featureitis. I'll shut up for now.

cheers,
>
>The target/ directory is not that big on my snapshot (although 1 month
>old):
>
>: hcegtvedt at hcegtvedt ~/gitwork/buildroot > find target | wc -l
>554
>: hcegtvedt at hcegtvedt ~/gitwork/buildroot > du -sh target 
>6,3M    target
>
>
>> In my private implementation, I only use the "configs" directory for
>> storage of such files.
>
>Where is the configs directory, under target/configs/ ?
>
>> make B=<board> board
>
>Much like the
>make <board>_defconfig
>make
>
>procedure would do.
>
>> will copy the latest version (they are stored as <board>-<date>.config)
>> to .config.
>
>I.e. the save_config makefile target you talked about?
>
>> The implementation is simplistic.
>> Copy ALL the files to .confiug, so the latest file will overwrite all other files.
>
>-- 
>Mvh
>Hans-Christian Egtvedt
>
>_______________________________________________
>buildroot mailing list
>buildroot at uclibc.org
>http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot-reconfigure.patch
Type: text/x-diff
Size: 797 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070625/5cf2127c/attachment-0001.bin 
