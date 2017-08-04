From: Atilla Filiz <atilla.filiz@gmail.com>
Date: Fri, 4 Aug 2017 14:21:26 +0200
Subject: [Buildroot] Howto handle fork of an existing package
Message-ID: <6947b9e4-bf6e-ace7-c8c9-e440a494e225@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello

I have made a package of Wiring Pi for Lemaker boards Banana Pi and 
Banana Pro. Since this is a fork from an older version, the site, teh 
versioning, the patches etc are all different. I would like to ask, 
whoat would be the best way to merge this package properly. Either

1. Make it a completely new package, like wiringpi-lemaker and make it 
depend on !BR2_PACKAGE_WIRINGPI and vice versa. Easiest way.

2. Turn wiringpi into a subtree, with a radio button for board 
selection: Raspberry Pi, Banana Pi, Banana Pro and enable teh proper 
package. Raspberry Pi being the default option. Slightly intrusive way.

3. Have one wiringpi to rule them all. Make the board selection as a 
mere set of parameters. Make a bit more complicated wirinpi.mk that 
selects correct site, version, patch directory etc depending on a bunch 
of defined flags. Possibly unnecessarily complicated.

Currently I made and tested it as a separate package.

Atilla
