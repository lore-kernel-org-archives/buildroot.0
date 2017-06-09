From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Jun 2017 10:50:33 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with bash
In-Reply-To: <CAB0FRstAGwcUOowSvH9xmQLX=j5no7aPO6KiCLXVS7U3W_C=yg@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Fri, 9 Jun 2017
 10:18:48 +0200")
References: <20170605073740.855-1-francois.perrad@gadz.org>
 <87y3t2a64r.fsf@dell.be.48ers.dk>
 <CAB0FRsv4WF1BE6LNagQZhLZ7DxGH_sovyJutrKrufNhvWcFrCg@mail.gmail.com>
 <878tl29m64.fsf@dell.be.48ers.dk>
 <CAB0FRstAGwcUOowSvH9xmQLX=j5no7aPO6KiCLXVS7U3W_C=yg@mail.gmail.com>
Message-ID: <87zidh8rza.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

Hi,

 >> And /bin/sh is a symlink to /run/current-system/sw/bin/bash? Otherwise I
 >> don't understand how the logic in Makefile and
 >> support/dependencies/dependencies.sh could work?
 >> 

 > /bin/sh is a symlink to
 > /nix/store/bxr5lwdhhgfh1p28mh3w7kyc0spk7niz-bash-4.4-p5/bin/sh
 > /run/current-system/sw/bin/bash is a symlink to
 > /nix/store/bxr5lwdhhgfh1p28mh3w7kyc0spk7niz-bash-4.4-p5/bin/bash

Ok, and than ../bin/sh is presumably a symlink to ../bin/bash?


 >> What about packages? Are there no package build systems that hardcodes
 >> /bin/bash?
 >> 

 > No.
 > Packages needed by Buildroot could be declared like this :
 > https://github.com/fperrad/misc/blob/master/nix/buildroot.nix

What I mean is that seeing scripts with the #!/bin/bash shebang is quite
common, so I wouldn't be surprised if some of the upstream build systems
used by some of the packages we have in buildroot use that.

For one, some of our board specific scripts use it:

board/stmicroelectronics/stm32f429-disco/flash.sh:#!/bin/bash
board/stmicroelectronics/stm32f469-disco/flash.sh:#!/bin/bash
board/technologic/ts4800/post-image.sh:#!/bin/bash
board/technologic/ts4900/post-image.sh:#!/bin/bash

-- 
Bye, Peter Korsgaard
