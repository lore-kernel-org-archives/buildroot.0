From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 13:59:39 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/target/u-boot
In-Reply-To: <1231246236.32308.68.camel@elrond.atmel.com> (Ulf Samuelsson's
	message of "Tue\, 06 Jan 2009 13\:50\:36 +0100")
References: <20090105161237.034D977404@busybox.osuosl.org>
	<1231179121.8886.225.camel@linux-yrgm.site>
	<87y6xpv7fl.fsf@macbook.be.48ers.dk>
	<1231246236.32308.68.camel@elrond.atmel.com>
Message-ID: <87iqossi84.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

 Ulf> m?n 2009-01-05 klockan 21:12 +0100 skrev Peter Korsgaard:
 >> >>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:
 >> 
 >> Hi,
 >> 
 Ulf> The "complex" file name is needed, unless you only
 Ulf> work with a single board.
 >> 
 >> I don't get it - Isn't that why we have binaries/<project>? 

 Ulf> YOu copy things to binaries/PROJECT to have a single directory
 Ulf> which you can compress, but if you copy the stuff to
 Ulf> the tftp directory then you have a mess.
 Ulf> You have to manually rename this.

tftp directory? Is that this ATMEL_COPY_TO thing? I don't recall that
ever being discussed on the list.

Lets just start by making things simple before adding all kinds of
extra stuff. Buildroot should imho just worry about building stuff and
putting it under binaries/<project>, and not install it somewhere for
tftp/nfs/whatever.

 >> Even so,
 >> isn't that the same problem with the other files? (file system images,
 >> kernels)?

 Ulf> The kernel is already doing this in the "advanced" makefile.

 Ulf> The rootfs should be doing it. and in this case PROJECT Is definitely
 Ulf> the right one to use.

 Ulf> We obviously need to find  a way that does not break the build of
 Ulf> course.

I don't agree. Having things under binaries/<project> is enough.

 Ulf> Many targets define BR2_BOARD_NAME in their Config.in's
 Ulf> and it may make sense to have a common BR2_BOARD_NAME
 Ulf> Then it will be always be defined.
 Ulf> Default to "uclibc" is probably OK.
 >> 
 >> Isn't that what we have BR2_PROJECT for?

 Ulf> Yes and no,

 Ulf> You can use BR2_PROJECT, but if you:

 Ulf> make XXXX_config 
 Ulf> when building u-boot-<VERSION>, it also makes sense to name the binary

 Ulf> <XXXX>-u-boot-<VERSION>-<DATE>.bin

 Ulf> because regardless of which project you are building,
 Ulf> the binary should end up the same.

 Ulf> <DATE> is there to give you some kind of revision information
 Ulf> so you do not overwrite older working results.
 Ulf> It is not perfect, but I think it is good enough.

Sorry, I still don't think this belongs in buildroot.


-- 
Bye, Peter Korsgaard
