From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 29 Oct 2013 20:24:03 +0100
Subject: [Buildroot] State of AVR32 in Buildroot and improving it
Message-ID: <20131029202403.2f249f0d@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

The state of AVR32 in Buildroot and the fact that the old binutils/gcc
needed for the architecture is causing a number of build failures
raised some discussion at the Buildroot Developers Meeting this
week-end.

As you seem to be the person most interested in keeping the AVR32
support in Buildroot, we'd like to discuss with you what can be done to
improve the autobuilder results for this platform. I've done a quick
analysis of the autobuilders statistics. On a total of 726 build tests
done in 2013 on AVR32, 91 were successful, and 635 failed, which means
12% success, 87% failed. In comparison, ARM has had 11125 build tests
done in 2013, with 6874 success and 4235 failures, which means 62% of
success and 38% of failures.

Do you think you could help in fixing some of the AVR32 autobuilder
failures? Note that we don't necessarily want to fix all packages: if
something is known broken on AVR32 and you don't need it or you're not
interested in fixing it, we can just mark it as 'depends
on !BR2_avr32', or another appropriate dependency (such as the gcc
version, absence of TLS, or other).

In order to achieve this, I'm proposing to send you a daily e-mail with
only the AVR32 build failures. This is something we already do with the
ARC and Blackfin architectures and that we would like to generalize to
all the "specialized" architectures.

As a reference, the top ten failures on AVR32 since July 2013 were
caused by the following packages:

+-------------------+-----+
| reason            | cnt |
+-------------------+-----+
| connman-1.12      |  51 |
| zeromq-3.2.3      |  48 |
| libevas-1.7.7     |  20 |
| dropwatch-1.4     |  18 |
| iozone-3_414      |  12 |
| zeromq-3.2.4      |  12 |
| libcap-ng-0.6.6   |  11 |
| libpfm4-4.3.0     |   9 |
| libcap-ng-0.7.3   |   9 |
| util-linux-2.22.2 |   9 |
+-------------------+-----+

Of course, some of these failures may be caused by non-AVR32 specific
problems.

Note that at the Buildroot meeting, one proposal was simply to get rid
of AVR32 in the autobuilders, but the conclusion was that we do not
like advertising an architecture as being supported if it's not
actively tested by our autobuilders.

Can you give us your feeling on this topic, and tell us if you're ready
to help in fixing the AVR32 autobuilders failures?

Thanks a lot!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
