From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 20 Jan 2017 14:46:13 +0100
Subject: [Buildroot] [PATCH] tslib: needs kernel headers 3.12
In-Reply-To: <20170120033551.4cpamcz63irneymp@tarshish> (Baruch Siach's
 message of "Fri, 20 Jan 2017 05:35:51 +0200")
References: <4a250493e254e7a958267c5ce153f9ef05e6fc69.1484830247.git.baruch@tkos.co.il>
 <20170120112630.557f297d@free-electrons.com>
 <20170120033551.4cpamcz63irneymp@tarshish>
Message-ID: <87r33xsv2y.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

Hi,

 >> Isn't this a bit annoying for people using tslib on kernel olders than
 >> 3.12 ? Isn't there a simpler patch to tslib to avoid depending on
 >> headers >= 3.12 ?

 > The present build failure seems to be easy to fix by skipping the ts_uinput 
 > tool on pre 3.12 kernels. But since upstream explicitly states that 3.12 is 
 > the oldest supported kernel (see commit message link) we are on our own here.

I had the same idea originally, but as it isn't completely nontrivial to
disable the new code and against the wishes of upstream I decided to
leave that work for people needing it on pre-3.12 kernels.

With that said, if upstream isn't interested in integrating such a patch
then it isn't really nice having to carry it in Buildroot either.

-- 
Bye, Peter Korsgaard
