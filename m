From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 22 Nov 2009 20:17:54 +0100
Subject: [Buildroot] [PATCH] Introduce support for using either
	e2fsimage of genext2fs
In-Reply-To: <6a52edd60911021808w8d65e45t93c83682c133dfbc@mail.gmail.com> (Dan
	Christensen's message of "Mon\, 2 Nov 2009 20\:08\:45 -0600")
References: <6a52edd60910211816g12860f63xc2f70e1ee473a335@mail.gmail.com>
	<6a52edd60911021808w8d65e45t93c83682c133dfbc@mail.gmail.com>
Message-ID: <87y6lyfjx9.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Dan" == Dan Christensen <opello@opello.org> writes:

Hi,

 >> That being said, I would appreciate it if the following patch could be
 >> reviewed for correctness. ?It worked for me (I could toggle between
 >> genext2fs and e2fsimage) but I reworked quite a bit of the logic in
 >> the makefiles and wouldn't be surprised if there were some bugs I
 >> hadn't noticed.

 Dan> I was hoping to get some feedback on this, and had some further ideas.
 Dan>  But I didn't see anyone reply.

 Dan> I reworked this patch to be from the latest git as of a few minutes
 Dan> ago.  I hope this allows someone to examine it more easily, and
 Dan> comment on it.

First of all, sorry for the slow response.

I would prefer to have a single tool for ext2 instead of having to
maintain both genext2fs and e2fsimage, but I'm afraid e2fsimage isn't a
good option. According to it's website it hasn't seen a release since
2004, and it isn't in Debian (genext2fs is), and until now we haven't
had any issues with genext2fs.

The ext2 read issue you're seing in u-boot is because u-boot is
buggy. A patch has recently been posted which fixes it:

http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/71890

Also see the thread leading up to that patch:

http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/71863/focus=71867

FYI, it was afaik broken last year when revision 1 support was added:

http://thread.gmane.org/gmane.comp.boot-loaders.u-boot/44630/focus=44727

Could you check if a genext2fs-generated image works for you after you
apply that patch to u-boot?

-- 
Bye, Peter Korsgaard
