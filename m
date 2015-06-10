From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 10 Jun 2015 16:17:47 +0200
Subject: [Buildroot] bc segfaults when using math library, and patch
In-Reply-To: <55776F11.3080803@gmail.com> (grepper@gmail.com's message of
 "Tue, 09 Jun 2015 18:56:17 -0400")
References: <55776F11.3080803@gmail.com>
Message-ID: <87egljk5pw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "grepper" == grepper  <grepper@gmail.com> writes:

 > I have attached a patch that fixes the segfault in bc when it is used
 > with the math library loaded. A developer on #buildroot also commented
 > that perhaps buildroot should use the alpha version of bc like many
 > distros instead - I can't comment on that.

I was going to ask if this is already upstream and if you had a
reference to the upstream version control, but GNU bc doesn't seem to
have any public vcs (or any real activity).

I see the latest alpha release is from 2006, and that one does make
save_adr static and NEWS contains the following note:

Bug fixes:
        fixes bug in load_code introduced by mathlib string storage in 1.06.


I personally don't use bc, but if people (and other distributions) think
the 1.06.95 alpha version is better then lets use it.

A quick look at the Debian package shows that they are carrying some
patches that might be interesting, E.G. 03_array_initialize.diff seems
like a clear bugfix:

https://packages.debian.org/jessie/bc

Care to send a patch to bump the version with this info?

-- 
Bye, Peter Korsgaard
