From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 08 Oct 2014 20:42:45 +0200
Subject: [Buildroot] [PATCH 2/5] zsh: security bump to version 5.0.7
In-Reply-To: <54357611.2050005@zacarias.com.ar> (Gustavo Zacarias's message of
 "Wed, 08 Oct 2014 14:36:17 -0300")
References: <1412774389-11297-1-git-send-email-gustavo@zacarias.com.ar>
 <1412774389-11297-2-git-send-email-gustavo@zacarias.com.ar>
 <87a956eadv.fsf@dell.be.48ers.dk> <54357611.2050005@zacarias.com.ar>
Message-ID: <8738aycsii.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 >> Same comment as for dash, who should "win" the /bin/sh symlink?
 >> 
 >> maybe busybox -> dash -> zsh -> bash?

 > Forgot to cc the list ;)

Ups, apparently - Sorry.

 > It's not really/only a matter of which one wins, it's an init system
 > nightmare that i'm solving.
 > Say you've got:

 > busybox-init + some better shell = the better shell should win.

Agreed.

 > sysvinit + busybox + some better shell = same as above

Agreed.

 > sysvinit + no busybox + some better shell = oops since there's no /bin/sh

As long as all shells install a /bin/sh (symlink), that should be fine -
But it should also be reproducible, so with a fixed priority.

 > I don't care which of the better is "betterer", it's pretty subjective,
 > i just want the crazy combinations to work :)
 > Of course there's sysvinit + no busybox + no shell but that's another
 > problem.

Such a setup is pretty unlikely to ever happen on purpose imho.

-- 
Bye, Peter Korsgaard
