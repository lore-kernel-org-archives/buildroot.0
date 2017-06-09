From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 09 Jun 2017 09:27:02 +0200
Subject: [Buildroot] [PATCH] swupdate: switch to local config librt
	dependency
In-Reply-To: <20170609061259.d65d6jcrkq35v2t4@tarshish> (Baruch Siach's
 message of "Fri, 9 Jun 2017 09:12:59 +0300")
References: <097cb7c8a9791944b484ec31f2cc5660331411c6.1496939346.git.baruch@tkos.co.il>
 <20170608214532.7b77d220@free-electrons.com>
 <87lgp29rnw.fsf@dell.be.48ers.dk>
 <20170609061259.d65d6jcrkq35v2t4@tarshish>
Message-ID: <874lvpaaex.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> I suggest we stop caring about these ancient <= 2.17 glibc versions when
 >> we introduce 2.26, especially if upstream doesn't want these fixes any
 >> more.

 > A small correction: only glibc versions < 2.17 are affected. glibc 2.17 is 
 > fine.

Sorry, so then we're looking at 2.16 from mid-2012.

 > As far as I understand, the only change we need to do in Buildroot code itself 
 > if we are to stop support for glibc older than 2.17, is to drop CodeSourcery 
 > x86 and SH toolchains. That would leave us with no external toolchain for 
 > these architectures. Is that OK?

It is not perfect, but only offering these ancient toolchains aren't
really either. I don't think it is really bad as buildroot can build
nice modern toolchains for those archs, but if we could find some newer
external toolchains then that would certainly be a plus.

-- 
Bye, Peter Korsgaard
