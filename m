From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 01 Aug 2019 15:25:21 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: security bump version
 to 5.2.1
In-Reply-To: <cce57e46-40e2-8467-18e7-e3ed60f014d2@mind.be> (Arnout
 Vandecappelle's message of "Thu, 4 Jul 2019 01:20:35 +0200")
References: <20190629151237.13413-1-bernd.kuhls@t-online.de>
 <cce57e46-40e2-8467-18e7-e3ed60f014d2@mind.be>
Message-ID: <874l31yq4e.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

 > On 29/06/2019 17:12, Bernd Kuhls wrote:
 >> Version 5.1.5 fixes CVE-2018-11490

 >  So *this* is not a security bump. A security bump would bump to 5.1.5, not 5.2.1.

 >  This is important, because this patch we don't want to backport to the stable
 > branches...

And looking closer, the security issue is in the gifclrmp utility which
we don't install.

 >> https://sourceforge.net/p/giflib/code/ci/900d783def011e8d9f261db6839113425bf3334f/

Before noticing that, I did some work to bump to 5.1.5, but it isn't
really nice as the new build system is fairly broken and E.G. always
builds static and shared libraries.

The patch as is also forgets to pass TARGET_CONFIGURE_OPTS, so it ends
up building for the host instead of the target.

-- 
Bye, Peter Korsgaard
