From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 25 Nov 2014 22:31:22 +0100
Subject: [Buildroot] [PATCH] sqlcipher: fix openssl configure test when
	building statically
In-Reply-To: <f5e24794fa6adb5d60d830b44b0aafc1e81e875b.1416942994.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 25 Nov 2014 21:16:34 +0200")
References: <f5e24794fa6adb5d60d830b44b0aafc1e81e875b.1416942994.git.baruch@tkos.co.il>
Message-ID: <87zjbfq85x.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > When testing link with openssl the configure script adds another -lcrypto
 > after LDFLAGS. This -lcrypto also needs -lz. Move libraries list to LIBS to
 > make -lz appear at the proper place.

 > Fixes:
 > http://autobuild.buildroot.net/results/59d/59d8d7c7f3e0a205503121c1288187471c0ce80f/
 > http://autobuild.buildroot.net/results/2ed/2ed2026bc5502807588a9335bd4c78e0a26c1cd3/
 > http://autobuild.buildroot.net/results/cd3/cd35b24422cf7f8697e81ca7f0dd2f06dfc55997/

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Sorry, I already fixed that issue earlier today:

http://git.buildroot.net/buildroot/commit/?id=74b399e7cd44fb3866a3cc8bc6b5636f1c8f2fa2

-- 
Bye, Peter Korsgaard
