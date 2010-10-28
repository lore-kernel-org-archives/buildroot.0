From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 28 Oct 2010 14:14:45 +0200
Subject: [Buildroot] Is there any chance to compile old buildroot on new
	distro
In-Reply-To: <AANLkTi=j+qQ7Gq+pA1T4ANRLP_J7ZmEwytKCKx9-MF74@mail.gmail.com>
	(Sasha Yohananov's message of "Thu, 28 Oct 2010 10:00:41 +0200")
References: <AANLkTi=CA_91mHxqKye2wPsRVGkOe2Zm2W1LnMGdk_OA@mail.gmail.com>
	<AANLkTi=j+qQ7Gq+pA1T4ANRLP_J7ZmEwytKCKx9-MF74@mail.gmail.com>
Message-ID: <87mxpycy4q.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Sasha" == Sasha Yohananov <yohananov@gmail.com> writes:

 Sasha> Dear buildroot experts,

 Sasha> For about 2 years I work on some commercial project (access control) based on
 Sasha> buildroot-2008.11.

There's never been a 2008.11 release, I guess you mean 2009.11?

scripts/unifdef.c:209: error: conflicting types for 'getline'
/usr/include/stdio.h:673: note: previous declaration of 'getline' was here
make[2]: *** [scripts/unifdef] Error 1
make[1]: *** [__headers] Error 2
make[1]: Leaving directory `/home/sasha/work/3rdparty/buildroot/toolchain_build_arm/linux-2.6.27.7'

You'll need a fix for your kernel headers. The easiest is probably to
download 2010.02 and take the
toolchain/kernel-headers/linux-2.6.26.8-unifdef-getline.patch and copy
it to the same directory in your tree (but adjust the kernel version).

You might need the similar patch for uclibc as well.

-- 
Bye, Peter Korsgaard
