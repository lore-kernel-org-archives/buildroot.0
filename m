From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 14 Apr 2010 11:33:38 +0100
Subject: [Buildroot] Problems with i686_defconfig
Message-ID: <4BC59A02.40804@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Using latest from git I am trying to build i686_defconfig but I am 
having problems.

The first annoyance is that the defconfig is so old that you have go 
through selecting the defaults for all the new config options. 
Presumably we should update the defconfigs so they contain all the 
default options already set? If so I'm happy to look at a patch.

If I select all the defaults I end up with kernel headers 2.6.33.2, 
uClibc 0.9.31, binutils 2.20.1, gcc 4.4.3 and linux 2.6.33.2

You then get the same problems again with uClibc config and linux 
config, both ask about config options, should we be updating our 
defaults so this step is not necessary?

Finally the build fails in either gdbserver (if selected) or busybox, 
complaining the symbol usleep is undefined. Anyone seen this before? Is 
it some config problem with uClibc 0.9.31?
