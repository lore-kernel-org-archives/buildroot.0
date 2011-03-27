From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 27 Mar 2011 21:53:08 +0200
Subject: [Buildroot] Problems with pkg-config
In-Reply-To: <AANLkTinY9SZZs0uBFzCah0oJD5JjTvRR0K7z+B1u=AHd@mail.gmail.com>
	(Allan Nielsen's message of "Sat, 26 Mar 2011 19:42:46 +0100")
References: <AANLkTinY9SZZs0uBFzCah0oJD5JjTvRR0K7z+B1u=AHd@mail.gmail.com>
Message-ID: <87zkogmjbv.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Allan" == Allan Nielsen <a@awn.dk> writes:

 Allan> Hey

Hi Allan,

 Allan> So, now to my question: how should I correct this problem?
 Allan> Should patch/configure xtrans to install the xtrans.pc in
 Allan> ..../sysroot/usr/lib/pkgconfig/ (this is where the other *.pc
 Allan> files are located). Should I include sysroot/usr/share/pkgconfig
 Allan> in pkg-configs search path, or something else???

The right fix is imho to make pkg-config search usr/share/pkgconfig as
well, as that's what upstream pkg-config does by default. I've fixed it
in git (6a86dd9c8e) and dropped the patch we had for xtrans to make it
use usr/lib/pkgconfig instead.

Thanks for letting me know. I wasn't aware some packages were using it
rather than the "standard" usr/lib/pkgconfig.

-- 
Bye, Peter Korsgaard
