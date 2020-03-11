From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 11 Mar 2020 08:09:17 +0100
Subject: [Buildroot] [PATCH 1/1] package/ogre: link with libatomic when
 needed
In-Reply-To: <20200210174127.719019-1-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 10 Feb 2020 18:41:27 +0100")
References: <20200210174127.719019-1-fontaine.fabrice@gmail.com>
Message-ID: <87wo7rl65e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > On some architectures, atomic binutils are provided by the libatomic
 > library from gcc. Linking with libatomic is therefore necessary,
 > otherwise the build fails with:

 > /home/test/autobuild/run/instance-1/output-1/host/lib/gcc/xtensa-buildroot-linux-uclibc/8.3.0/../../../../xtensa-buildroot-linux-uclibc/bin/ld:
 > ../../lib/libOgreMain.so.1.12.0: undefined reference to
 > `__atomic_fetch_add_8'

 > This is often for example the case on sparc v8 32 bits.

 > Fixes:
 >  - http://autobuild.buildroot.org/results/3a09e2d1d26b19243244eb7f9235c85488a788d2

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Committed to 2019.11.x, thanks (ogre not in 2019.02.x).

-- 
Bye, Peter Korsgaard
