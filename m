From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Thu, 10 Dec 2009 21:34:21 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
Message-ID: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

I'm having a strange build problem with Buildroot. It gives *tons* of warnings
like below (it seems like at least one warning per .mk file in BR):

----
$ make atngw100_defconfig
$ make
package/Makefile.autotools.in:179: warning: overriding commands for
target `/home/bjornfor/raid/forks/buildroot/output'
package/Makefile.autotools.in:168: warning: ignoring old commands for
target `/home/bjornfor/raid/forks/buildroot/output'
package/Makefile.autotools.in:189: warning: overriding commands for
target `/home/bjornfor/raid/forks/buildroot/output'
package/Makefile.autotools.in:179: warning: ignoring old commands for
target `/home/bjornfor/raid/forks/buildroot/output'
...snip tons of similar warnings...
package/mtd/mtd-utils/mtd.mk:98: warning: overriding commands for
target `/home/bjornfor/raid/forks/buildroot/output'
package/mtd/mtd-utils/mtd.mk:65: warning: ignoring old commands for
target `/home/bjornfor/raid/forks/buildroot/output'
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/raid/forks/buildroot/output' given more than once in
the same rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/raid/forks/buildroot/output' given more than once in
the same rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/raid/forks/buildroot/output' given more than once in
the same rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/raid/forks/buildroot/output' given more than once in
the same rule.
package/mtd/mtd-utils/mtd.mk:106: *** multiple target patterns. Stop.
----

And then it dies.

Using 'defconfig' it will start downloading sources, but it still generates
*lots* of warnings:
----
$ make defconfig
$ make
...snip lots of warnings...
Makefile:330: warning: overriding commands for target
`/home/bjornfor/raid/forks/buildroot/output'
target/ubifs/ubifsroot.mk:25: warning: ignoring old commands for
target `/home/bjornfor/raid/forks/buildroot/output'
Makefile:355: warning: overriding commands for target
`/home/bjornfor/raid/forks/buildroot/output'
Makefile:330: warning: ignoring old commands for target
`/home/bjornfor/raid/forks/buildroot/output'
Makefile:354: target `/home/bjornfor/raid/forks/buildroot/output'
given more than once in the same rule.
Makefile:354: target `/home/bjornfor/raid/forks/buildroot/output'
given more than once in the same rule.
Makefile:354: target `/home/bjornfor/raid/forks/buildroot/output'
given more than once in the same rule.
Makefile:354: target `/home/bjornfor/raid/forks/buildroot/output'
given more than once in the same rule.
Makefile:358: warning: overriding commands for target
`/home/bjornfor/raid/forks/buildroot/output'
Makefile:355: warning: ignoring old commands for target
`/home/bjornfor/raid/forks/buildroot/output'
Makefile:373: warning: overriding commands for target
`/home/bjornfor/raid/forks/buildroot/output'
Makefile:358: warning: ignoring old commands for target
`/home/bjornfor/raid/forks/buildroot/output'
...snip me killing BR while it downloads sources...
----


I have used git bisect and it said the first bad commit (where all the warnings
started to appear) was:

commit a07d6b9d56955bfe0165b5f4ea6d3ed7a92ecff6
Author: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date:   Fri Jul 31 10:24:32 2009 +0200

    By default, put the output in an output/ directory


But I find that strange as I'm pretty sure I've successfully used Buildroot
revisions after this commit before.

I think it must be something wrong with *my* setup since nobody else has
noticed this (and the commit is from July), but I don't know what it may be.
Any suggestions?

Best regards,
Bj?rn Forsman
