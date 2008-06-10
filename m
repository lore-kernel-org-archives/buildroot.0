From: Michael.Forkey at elektrobit.com <Michael.Forkey@elektrobit.com>
Date: Tue, 10 Jun 2008 12:35:50 -0700
Subject: [Buildroot] Q: Modifying package builds?
Message-ID: <C681C76E0D5F1E4BB01DE79E0A80EEC77C514F@usrdes03.ebgroup.elektrobit.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As of about a month ago I was completely new to Linux & Linux
development, buildroot and development for embedded devices. So there
are a lot of holes in my buildroot knowledge. If there is a FAQ
somewhere please point me to it. I haven't found one (at least not one
for these questions.)

I work on a project which uses buildroot targeting the ARM9 processor. I
run buildroot on both an Ubuntu VM and on a server running Red Hat
Enterprise 5. This matters because the results are different between the
2 (very frustrating) which is part of the need to ask this (these)
questions.

I have to use an older version of buildroot which matches my customer's.
It is old enough that there are significant differences between it and
the current version for the packages I am building (libgtk2-directfb)
and that has made back-porting of some necessary patches a pain. 

I need to be able to predictably modify the package build. I need to
apply fixes to various files (.mk and Makefile[.am|.in]) and have them
picked up. Currently the only way I know to reliably get the
configuration for a package to run is to run "make distclean". Then I
re-run "make" iteratively until I hit all the breaks and re-apply all my
fixes.

Some of the fixes I've needed to make are to correct include paths which
are not correct. For example, I have had failures because the path to a
header file is .../lib/<package> in the Makefile but it is actually in
.../lib/usr/<package>. I have also seen the reverse as well (i.e. path
is under .../lib/usr when it is really under .../lib.)

Another need is to change compiler options - turn off optimizations
(i.e. -O0 instead of -O2 or -Os), or add -DDEBUG, etc.

**My primary question(s) for this group is**: How can I change the
configuration of packages before they are built? 

There are a couple ancillary questions which go along with this. 

1. Can I create a patch (for my local use only) and apply it somehow
after a package is unpacked but before it is built?
I don't know how to use the patch mechanism yet, but I will learn it if
it helps (recommendations on useful ways to do that appreciated.) 

2a. What are the points I can interrupt and restart the process without
screwing it up? 2b. Or how do I make changes and then restart the build
so they get properly picked up?
I have tried deleting the .configured file in a package's build_arm
directory after I have made changes to the package's Makefile or
Makefile.am (or .in, I can't remember.) But that doesn't seem to
entirely work right. Some things don't get re-gen'd.

3. Is there anyway to tell the build to continue on errors? 
I realize some of the failures will cascade into other packages. But I
want it to unpack everything so I can make all the changes I need to
once. (I have cataloged all the pieces I need to change in the entire
build.)

4. As a variant on that question: is there some way to get all the
packages unpacked before building, i.e. similar to running "make source"
to get all the packages downloaded? Can I get them downloaded and
unpacked, too?

Any help is appreciated.

Thanks,
mf


----------------------------------------------------------------
Please note: This e-mail may contain confidential information
intended solely for the addressee. If you have received this
e-mail in error, please do not disclose it to anyone, notify
the sender promptly, and delete the message from your system.
Thank you.
