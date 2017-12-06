From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 5 Dec 2017 21:37:22 -0600
Subject: [Buildroot] RFC: kvm-unit-tests use of RDSEED
Message-ID: <CANQCQpYCXAU4+gWde5G-WuGQaYn2LhHcEeRgYW2hFAF+QS4VJA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Got the following failure today where the host compiler is getting
invoked during a x86_64 build on GCC20(x86_64 Xeon machine) for a
32bit build.
http://autobuild.buildroot.net/results/c39/c3987a3cbd2960b0ff50f872636bdfd8d1a9c820/

kvm-unit-tests package looks like they added the use of the rdseed
instruction which was introduced in mid 2.22.x binutils.  I'm thinking
about sending a patch reverting that commit as it's just a test case.
Other option would be a "AT_LEAST" check but we don't have that for
binutils, right?

Peter, I though of confirming the binutils version on GCC20 ( just to
be sure that is what's causing it.)

Matt
