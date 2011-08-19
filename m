From: Ulrich Prinz <uprinz2@netscape.net>
Date: Sat, 20 Aug 2011 01:10:17 +0200
Subject: [Buildroot] SVN, sources out of tree / VPATH... How?
Message-ID: <4E4EED59.30009@netscape.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi!

I want to do some development for a new platform with buildroot. But I
work with SVN. The first steps with a plain buildroot look good, but now
I want to make changes to some existing code in buildroot (u-boot,
kernel). And I want to checkin these changes into my SVN.

AFAIK all code for the target is in output/build, extracted from the
source-code *.gz downloaded by the configuration and settings in
menuconfig of buildroot.

If I now change some code, the system drops the extracted codes into the
source directories for each package. I can check these in.
But then, if I 'make clean' all code is deleted and re-extracted with
the next make.

That's a pretty collision with SVN.

Another problem rises, if a friend of mine wants to get may changes. He
needs to do a clean buildroot install, set up everything like I did (or
copy in my .config files), run a make and then delete the generated
build/ directories and checkout my SVN repository...

I worked with a commercial toolchain, where this was solved pretty easy:
They have a mainline kernel in one directory.
In parallel they have a board support package in a second directory.
And additionally they have a user source directory.

The trick is, that you replicate the original mainline kernel paths in
the other two sources and then make follows the priority of user/linux
then bsp/kernel-x.y.z and then kernel-x.y.z/

So if you need to modify kernel-x.y.z/drivers/net/abcd.c you copy it to
user/linux/drivers/net/abcd.c, modify it and with the next kernel build
your version is in.

This leaves the original sources fully untouched and all your changes
can be checked into any kind of versioning system.

Is there any similar thing available in buildroot so I do not have to
check in all the compressed sources and do not need to generate patches
for everything, check these in and describe what to change wehere for
the correct patches... You know what I mean :)

Or is there already a (simple) how-to that describes this?

Best regards
Ulrich
