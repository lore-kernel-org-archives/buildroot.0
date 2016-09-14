From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Wed, 14 Sep 2016 11:29:26 +0000
Subject: [Buildroot] Stripping kernel modules for ARC
Message-ID: <1473852437.3766.15.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

This is a follow-up of discussion started here
https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/86

The problem in hand is kernel stack unwinding on ARC historically was done
with use of debug_frame instead of more common eh_frame. And if stripping
of target binaries is enabled in Buildroot invocation of strip with
"--strip-unneeded" gets rid of debug_frame section effectively making
kernel unwinder helpless.

I'm wondering what would be a better way to strip modules on ARC in Buildroot?

I may see at least following solutions:
?1. Empty STRIP_STRIP_UNNEEDED or even KSTRIPCMD for ARC
? ? This together with?http://lists.infradead.org/pipermail/linux-snps-arc/2016-September/001483.html
? ? will still produce pretty compact .ko files on target
?2. Use objdump instead of strip with explicitly mentioned sections to keep or remove

Any thoughts are much appreciated.

-Alexey
