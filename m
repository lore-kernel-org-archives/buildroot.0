From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 25 Mar 2016 23:13:28 +0100
Subject: [Buildroot] [PATCH 1/1] gnuradio: fix boost detection
References: <1458731688-2975-1-git-send-email-gwenj@trabucayre.com>
 <20160323131034.56637862@free-electrons.com>
Message-ID: <8ppgscxrmh.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Wed, 23 Mar 2016 13:10:34 +0100 schrieb Thomas Petazzoni:

>> Boost is not found due to missing "indirect dependencies".
>> According to FindBoost.cmake, provided by cmake, Boost_thread depends
>> on Boost_atomic and Boost_chrono.
> 
> If that's really the case, then isn't the proper fix to adjust
> package/boost/Config.in to have BR2_PACKAGE_BOOST_THREAD select
> BR2_PACKAGE_BOOST_ATOMIC and BR2_PACKAGE_BOOST_CHRONO ?

Hi Thomas,

unpatched gnuradio compiles again after bumping cmake to 3.5.1, this 
patch is not needed anymore imho.

Regards, Bernd
