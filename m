From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 11 Jun 2012 10:56:21 +0200
Subject: [Buildroot] Bug on host-only packages
Message-ID: <20120611105621.0aacd20c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I have the impression that there is a bug on the download step of
host-only packages: the tarballs are named host-foobar-xxx.tar.gz
instead of just foobar-xxx.tar.gz. For example, in my download
directory, I have:

host-lpc3250loader-1.0.tar.gz
host-omap-u-boot-utils-8aff852322.tar.gz

Even though those don't have target variants (so there is no
problematic consequences to this bug), I think that for consistency
reasons they should be named:

lpc3250loader-1.0.tar.gz
omap-u-boot-utils-8aff852322.tar.gz

Most likely a bug in the GENTARGETS infrastructure. I haven't look at
the code yet, I'm just reporting the issue (don't have the time to dig
into it right now).

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
