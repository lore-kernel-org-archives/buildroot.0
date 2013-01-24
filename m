From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 24 Jan 2013 14:10:37 +0100
Subject: [Buildroot] Problem using Linux kernel archive from Gitorious
In-Reply-To: <5100D594.7000000@mind.be> (Arnout Vandecappelle's message of
 "Thu, 24 Jan 2013 07:32:52 +0100")
References: <CAJkQPOkYXUAWsJw_1dxsObUbx9bboSsF4+yBz6jKEKKXXhxZfg@mail.gmail.com>
 <50FA9D96.60802@mind.be>
 <CAJkQPOnp5gk+GZc6BewOCqtv4EnktvNe=DXbdJv-fgh8Lsdvyg@mail.gmail.com>
 <5100D594.7000000@mind.be>
Message-ID: <87mwvy20c2.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> I think what I will do is create
 >> a davinci patch against a particular version of Linux and tell the
 >> company to store the patch in their own source repository. That
 >> guarantees that they can always get the file and re-recreate the same
 >> same kernel - assuming kernel.org always has a copy of the original
 >> kernel source for a particular version. :)

 Arnout>  To make things reproducible, it is anyway advisable to set up a
 Arnout> BR2_PRIMARY_SITE where the tarballs are kept. It's a bit of a pain to
 Arnout> maintain such a primary site, but it does solve a lot of potential
 Arnout> issues (e.g. the kernel.org website going down :-).

Pain to maintain? You can just add a cronjob doing:

make <blah>_defconfig
make BUILDROOT_DL_DIR=/path/to/primary/mirror source

That's basically how I maintain sources.buildroot.net (I use
allyesconfig instead)

-- 
Bye, Peter Korsgaard
