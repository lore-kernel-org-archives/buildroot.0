From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 07 Jul 2015 13:10:21 +0200
Subject: [Buildroot] [PATCH] fs/cpio: drop static random-seed
In-Reply-To: <b00f4e7c142fdff8a1f311de5816008b08b13e67.1436263286.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 7 Jul 2015 13:01:26 +0300")
References: <b00f4e7c142fdff8a1f311de5816008b08b13e67.1436263286.git.baruch@tkos.co.il>
Message-ID: <87fv50nrz6.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Initializing the kernel entropy pool in initramfs from a seed file that never
 > changes doesn't make much sense. Not initializing the entropy pool at all is
 > better than initializing it from a known seed.

 > Signed-off-by: Baruch Siach <baruch@tkos.co.il>

I agree, but why don't we simply drop our static /etc/random-seed from
the default skeleton instead?

-- 
Bye, Peter Korsgaard
