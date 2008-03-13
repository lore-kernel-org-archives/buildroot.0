From: J. Spence <j3mail-busybox@rearden.com>
Date: Thu, 13 Mar 2008 06:44:29 -0700 (PDT)
Subject: [Buildroot] Other build problems
Message-ID: <533595.393981205415869873.JavaMail.root@zmail.rearden.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There seem to be a few other problems with the current tree when building from scratch:

 - target/device/x86/i386/linux26.config is using SLAB instead of SLUB, and SLAB seems to be broken in 2.6.24 (the default now)

 - target/device/x86/i386/linux26.config is tickling another 2.6.24 problem involving the usercopy module under arch/x86.  I guess no-one has built 2.6.24 for anything older than i686 without also enabling generic x86 support, because that triggers a buiild error where the *_intel versions of the symbols are not defined.

 - target/devicve/x86/i386/linux26.config cannot be built automatically because some 2.6.24 config items are missing from that default config.

I'd merge the existing config with i386_defconfig from 2.6.24 and send a patch, but I'm looking at my merge utility right now and I'm not sure exactly what the intended strategy of the default buildroot config is.  I think that the config is intended to favor small size over speed and features, but I'd like a second opinion before I start deciding for myself what's a mandatory feature in my patch :)
