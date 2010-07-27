From: Ossy <ossy1980@gmx.net>
Date: Wed, 28 Jul 2010 00:07:37 +0200
Subject: [Buildroot] help in converting util-linux-ng to autotargets
Message-ID: <4C4F58A9.50309@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi mailinglist,

I was able to convince a recent version of util-linux-ng (1.17.2) to 
compile for my target which is arm926t.

After the compilation I find several arm 32bit elfs in 
output/build/util-linux-ng-2.17.

I have three unclear issues for now:

A)
What do I do with the placeholder scripts from libtool?
Sometimes I find a libtool script instead of the expected binary. The 
binary itself is located in the corresponding .libs directory.
Do I need to install both - placeholder skript and binary out of .libs?

B)
How do I define the $(INSTALL)-part in the *mk-file for autotargets?
I found this or similar example:
define UTIL_LINUX_NG_INSTALL_TARGET_CMDS
        $(INSTALL) -D $(@D)/usr/bin/chkdupexe 
$(TARGET_DIR)/usr/sbin/chkdupexe
endef

Do I need to know every location of every binary out of util-linux-ng to 
install it from output/build/util-linux-ng-2.17 to STAGING-DIR?
This is quite a lot. With the old variant a make install (into 
STAGING_DIR) would be sufficnet I guess.
I'm a bit lazy. Do I need to define a line for every binary copy to 
staging? How would it look like?

C)
I like to build the libraries libblkid and libuuid and install them in 
the target fs. I found a link, the .a and .so variants in 
output/build/somedir. Which one do I need to isntall? Is it neccessary 
to copy the symlink from libuuid.so->libuuid.so.VERSION to the target fs?


Thanks for any hint.


Kind regards,
Marcus
