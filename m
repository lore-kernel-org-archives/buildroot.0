From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 23:07:34 +0200
Subject: [Buildroot] [PATCH v2,
 2/2] package/domoticz: select boost atomic
In-Reply-To: <20210426191113.512637-2-fontaine.fabrice@gmail.com> (Fabrice
 Fontaine's message of "Mon, 26 Apr 2021 21:11:13 +0200")
References: <20210426191113.512637-1-fontaine.fabrice@gmail.com>
 <20210426191113.512637-2-fontaine.fabrice@gmail.com>
Message-ID: <8735vcg3ft.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fabrice" == Fabrice Fontaine <fontaine.fabrice@gmail.com> writes:

 > domoticz does not use Boost::atomic but cmake is so "smart" that it
 > (wrongly) assumes that Boost::thread depends on Boost:date_time and
 > Boost::atomic since boost version 1.54:

 > set(_Boost_THREAD_DEPENDENCIES chrono date_time atomic)

 > Extracted from:
 >  - https://gitlab.kitware.com/cmake/cmake/-/blob/master/Modules/FindBoost.cmake#L1113

 > As we can't patch every cmake on the field, just select boost atomic

 > It should be noted that build failures are only raised since commit
 > 8a46b41b4a5d1c2f5ebefd7fc23fec7e8ba0598c as this commit drop the patch
 > that was decreasing cmake version but also removing:

 > target_link_libraries(domoticz Boost::thread Boost::system)

 > Fixes:
 >  - http://autobuild.buildroot.org/results/4306c0a725ed9a34bd55550df428866db6e4f052
 >  - http://autobuild.buildroot.org/results/2478e7a2ec1c63dcc2b36d29a39004468b230211

 > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 > ---
 > Changes v1 -> v2:
 >  - Fix patch title

Committed to 2021.02.x, thanks.

-- 
Bye, Peter Korsgaard
