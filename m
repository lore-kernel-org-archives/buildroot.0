From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 20:58:35 +0200
Subject: [Buildroot] Make C and CXX compiler cache in
 toolchainfile.cmake.in
In-Reply-To: <trinity-81772261-5a5f-4894-87f4-edd212a9650a-1521974573144@3c-app-mailcom-bs04>
References: <000001d3c425$31ba3fc0$952ebf40$@gmx.de>
 <trinity-81772261-5a5f-4894-87f4-edd212a9650a-1521974573144@3c-app-mailcom-bs04>
Message-ID: <20180325205835.5f167c1f@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Mar 2018 12:42:53 +0200, daggs wrote:

> if you are trying to use Buildroot to generate a cross compiler, than
> you are using the wrong too, look for crosstool-ng

That's not quite correct at all:

 1. Crosstool-NG generates just a toolchain, with no additional
    libraries (besides the C library). So if what you're looking for is
    to build application linked against a number of libraries, you need
    more than a "pure" toolchain, and Crosstool-NG will not help you
    with this, while Buildroot will.

 2. Buildroot can perfectly be used to generate toolchains. See
    http://toolchains.bootlin.com for an illustration.

Best regards,

Thomas Petazzoni
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
