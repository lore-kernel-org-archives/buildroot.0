From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Jan 2015 17:27:37 +0100
Subject: [Buildroot] [PATCH] toolchain: Use the correct target name
In-Reply-To: <54BBAAD7.3040207@dawncrow.de>
References: <54B843D7.1030602@dawncrow.de>
 <20150116092944.06e31910@free-electrons.com>
 <54BBAAD7.3040207@dawncrow.de>
Message-ID: <20150118172737.46ef9c70@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Andr? Hentschel,

On Sun, 18 Jan 2015 13:45:11 +0100, Andr? Hentschel wrote:

> This was based on the irc discussion (14.01.2015):
> (20:49:23) kos_tom: Andre_H: well, I'm not happy with the BR2_TOOLCHAIN_BUILDROOT dependency
> (20:49:40) kos_tom: Andre_H: we normally don't accept packages that would not build with external toolchains.
> (20:55:05) Andre_H: kos_tom: we either need symbolic links for the external toolchain, so that the name fits the tupel, or we need to pass the external tupel. i guess the first strategy is more foolproof. what do you think about it?
> (20:56:13) kos_tom: nope, we want the second strategy: a way to pass the prefix of the toolchain.
> 
> I guess you missed my suggestion (16.01.2015):
> (19:55:51) Andre_H: kos_tom: hi, what about redoing my wine makefile and doing it as a generic package with special configure rules?
> (22:19:17) kos_tom: Andre_H: which special configure rules would solve the problem?
> (22:19:50) kos_tom: iamb: you can do whatever sort of target filesystem changes in a post-build script.
> (23:07:31) Andre_H: kos_tom: e.g. passing BR2_TOOLCHAIN_EXTERNAL_PREFIX instead of GNU_TARGET_NAME if possible

I indeed missed your suggestion, sorry about that. And your patch is
doing it globally for all packages.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
