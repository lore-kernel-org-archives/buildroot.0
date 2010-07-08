From: Tor Krill <tor@excito.com>
Date: Thu, 08 Jul 2010 14:53:05 +0200
Subject: [Buildroot] Problems building LVM with 2010-05
Message-ID: <1278593585.1906.36.camel@tor-desktop>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I'm having problems building a buildroot with LVM2 using the 2010-05
release.

The end result is that i end up with a 0 byte sized lvm binary which
obviously wont work.

LVM2 is successfully built and installed into staging, it is when it's
about to be copied to target that it fails. Strangely only the first
LVM2_TARGET_SBINS entry gets copied and then make thinks it's done. (My
make knowledge is limited and I'm not quite aware on why this happens)

I'm quite sure that this is the commit that introduced this:

http://git.buildroot.net/buildroot/commit/?id=3b5d95be8dfc8a23f4e4619686215a9c99a1a9a6

Because commenting out the two touches gives me a working buildroot
again.

/Tor
