From: =?UTF-8?Q?Bj=C3=B8rn_Forsman?= <bjorn.forsman@gmail.com>
Date: Fri, 11 Dec 2009 14:14:13 +0100
Subject: [Buildroot] *Tons* of BR warnings like
	"package/Makefile.autotools.in:179: warning: overriding
	commands for target `/home/bjornfor/raid/forks/buildroot/output'"
In-Reply-To: <874onxvjyx.fsf@macbook.be.48ers.dk>
References: <5f2b60912101234r46ca2234w760ddd2a01032525@mail.gmail.com>
	<4B221A6E.3090105@gmail.com>
	<5f2b60912110236x1373eae0wf181f6720ca56ca3@mail.gmail.com>
	<874onxvjyx.fsf@macbook.be.48ers.dk>
Message-ID: <5f2b60912110514o79498b66lae1603f5f4fe6345@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2009/12/11 Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Bj?rn" == Bj?rn Forsman <bjorn.forsman@gmail.com> writes:
>
> Hi,
>
> ?Bj?rn> I'm on Ubuntu 9.10 Karmic amd64. I just tried BR on another
> ?Bj?rn> machine (also Karmic amd64) and the same thing happens there. I
> ?Bj?rn> also tried to symlink /bin/sh to /bin/dash on one of the
> ?Bj?rn> machines. It didn't help.
>
> Strange. Do you only see this with avr32 builds or also a build for
> E.G. i386? What does make --version give you?

'make defconfig && make' works. (By 'works' I mean it at least starts to
download sources. I haven't had the patience to see if it would succeed a
full build. But it also generates "the usual" set of warnings.) I run
x86_64.

i386 build fails:
----
$ make i386_defconfig && make
...snip lots of warnings...
package/mtd/mtd-utils/mtd.mk:98: warning: overriding commands for
target `/home/bjornfor/dev/buildroot/output'
package/mtd/mtd-utils/mtd.mk:65: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:106: *** multiple target patterns. Stop.
$
----

avr32 build fails just like i386:
----
$ make atngw100_defconfig && make
...snip lots of warnings...
package/mtd/mtd-utils/mtd.mk:98: warning: overriding commands for
target `/home/bjornfor/dev/buildroot/output'
package/mtd/mtd-utils/mtd.mk:65: warning: ignoring old commands for
target `/home/bjornfor/dev/buildroot/output'
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:97: target
`/home/bjornfor/dev/buildroot/output' given more than once in the same
rule.
package/mtd/mtd-utils/mtd.mk:106: *** multiple target patterns. Stop.
$
----

My Make version:
----
$ make --version
GNU Make 3.81
Copyright (C) 2006  Free Software Foundation, Inc.
This is free software; see the source for copying conditions.
There is NO warranty; not even for MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.

This program built for x86_64-pc-linux-gnu
----

Note: before the two BR builds above, I git pulled origin (commit
1323ecdd094f0dd387bfe9db8c00cd9982ac1156). But the same errors appear using any
version since commit a07d6b9d56955bfe0165b5f4ea6d3ed7a92ecff6 "By default, put
the output in an output/ directory"

Best regards,
Bj?rn Forsman
