From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 08 Jun 2017 23:58:27 +0200
Subject: [Buildroot] [PATCH] support/scripts: fix shebang with bash
In-Reply-To: <CAB0FRsv4WF1BE6LNagQZhLZ7DxGH_sovyJutrKrufNhvWcFrCg@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Thu, 8 Jun 2017
 23:07:23 +0200")
References: <20170605073740.855-1-francois.perrad@gadz.org>
 <87y3t2a64r.fsf@dell.be.48ers.dk>
 <CAB0FRsv4WF1BE6LNagQZhLZ7DxGH_sovyJutrKrufNhvWcFrCg@mail.gmail.com>
Message-ID: <878tl29m64.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > 2017-06-08 16:47 GMT+02:00 Peter Korsgaard <peter@korsgaard.com>:
 >> >>>>> "Francois" == Francois Perrad <fperrad@gmail.com> writes:
 >> 
 >> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
 >> 
 >> Out of interest, what distribution doesn't have bash in /bin?
 >> #!/bin/bash is a quite common shebang, and we use it in several places
 >> outside support/scripts.
 >> 
 >> 
 > I found this issue with NixOS (http://nixos.org/) where:
 > $ ls /bin
 > sh
 > $ ls /usr/bin
 > env
 > $ which bash
 > /run/current-system/sw/bin/bash
 > $ which which
 > /run/current-system/sw/bin/which

 > so, #!/bin/sh is the only shebang which doesn't require to start with
 > #!/usr/bin/env

And /bin/sh is a symlink to /run/current-system/sw/bin/bash? Otherwise I
don't understand how the logic in Makefile and
support/dependencies/dependencies.sh could work?

What about packages? Are there no package build systems that hardcodes
/bin/bash?

-- 
Bye, Peter Korsgaard
