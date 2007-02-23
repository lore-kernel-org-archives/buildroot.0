From: Heikki Lindholm <holindho@cs.helsinki.fi>
Date: Fri, 23 Feb 2007 19:15:29 +0200
Subject: [Buildroot] cp command incompatibility
Message-ID: <45DF2131.2020404@cs.helsinki.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

there's some incompatilibity between GNU cp and Mac OS X (probably BSD, 
too) cp commands. GNU cp arguments -d and -a do not exist on OS X. -a 
can be written -pPR on OS X. -d is partly covered by -P and partly by 
-R. -P is the --no-dereference part of -d and -R does what 
--preserve=links does AFAICT.

Doing a quick grep -r "cp " `find . -iname "*.mk"` reveals that there is 
quite a bit of work to fix all the incompatible cp occurences, so, I'm 
asking here what might be the best way to do it:
(1) hand-edit all incompatible cp occurences to something that works on 
both systems ("POSIXify")
(2) introduce some menuconfig options for common cp "use cases" and use 
shell variables to pass these configurable options to cp, for example, 
.mk scripts might have "cp $ARCHIVE foo bar", where $ARCHIVE would, for 
instance, be "-a" on Linux and "-pPR" on OS X.
(3) give up and build a local copy of GNU fileutils, instead

-- Heikki Lindholm
