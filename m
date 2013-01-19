From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jan 2013 11:38:52 +0100
Subject: [Buildroot] [PATCH RFC] Fix avr32 build using internal toolchain
In-Reply-To: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
References: <1358460970-2081-1-git-send-email-spdawson@gmail.com>
Message-ID: <20130119113852.6d35aa94@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Simon,

On Thu, 17 Jan 2013 22:16:10 +0000, spdawson at gmail.com wrote:

> uClibc 0.9.31.1 fails to build for avr32 using recent (3.7.x) kernel
> headers. The build failure looks like the following.

Thanks. I don't remember, do you have a specific interest in the AVR32
architecture support?

The thing is that apparently, the AVR32 gcc version we're using (gcc
4.2.x) doesn't build anymore with recent host gcc version (I think
Gustavo tested with gcc 4.6, and it doesn't build). Generally speaking,
the fact that we have to use old, patched, versions of gcc, binutils and
uClibc is severely problematic to support this architecture on the long
run.

Back in November, I got in touch with the people who were active on the
AVR32 architecture a few years back (Hans-Christian Egtvedt and H?vard
Skinnemoen), but they no longer work for Atmel and therefore don't know
what Atmel plans are regarding the AVR32 architecture.

Therefore, I'm wondering if we shouldn't mark this architecture as
deprecated.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
