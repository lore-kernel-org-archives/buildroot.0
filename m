From: Sean Parker <supinlick@yahoo.com>
Date: Wed, 5 Dec 2007 06:06:13 -0800 (PST)
Subject: [Buildroot] Placement of custom module-building in buildroot
	procedure
In-Reply-To: <14165382.post@talk.nabble.com>
Message-ID: <996871.76104.qm@web51907.mail.re2.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello -

  I've searched the archives for this last year and
couldn't find an answer so I appeal to your good humor in
guiding me... I'm using buildroot/busybox 1.01/linux 2.6.18
ported for MIPS provided by PMC-Sierra.

  I'm trying to add another module (dev driver
specifically) to the build. Do I need to specifically add
my module into a config file under the linux tree, or is it
good enough to call the "make M=$(MYSRCDIR) -C $(KERNELDIR)
modules" on my own, within my own Makefile, (i.e. along
with the build of my applications/libraries) that is
included as a separate package in the buildroot process?

  I presume perhaps I can't call 'modules' on my own
[during the kernel build] since it needs to be called
following all the other modules being built in the linux
kernel build - is this correct? If this is true, what't the
authoratative buildroot file I add reference to my module
so it gets built as the last module?

  My module need not start-up at boot, I was going to
insmod-it in the rc.local script - is this conventional?

  Thanks
    Sean Parker

P.S. Does anyone know of a resource I could look at to
learn the fundamentals of how the Linux build runs,
especially the use of the "obj-y obj-m" stuff? I'm a
relative Make novice, and would like to understand that
better.





God Bless 
    Sean Parker 





      ____________________________________________________________________________________
Never miss a thing.  Make Yahoo your home page. 
http://www.yahoo.com/r/hs
