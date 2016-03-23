From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 23 Mar 2016 13:10:34 +0100
Subject: [Buildroot] [PATCH 1/1] gnuradio: fix boost detection
In-Reply-To: <1458731688-2975-1-git-send-email-gwenj@trabucayre.com>
References: <1458731688-2975-1-git-send-email-gwenj@trabucayre.com>
Message-ID: <20160323131034.56637862@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 23 Mar 2016 12:14:48 +0100, Gwenhael Goavec-Merou wrote:
> From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
> 
> With some configuration, built fails with :
> -- Configuring gnuradio-runtime support...
> --   Dependency Boost_FOUND = 0
> --   Dependency ENABLE_VOLK = ON
> --   Dependency PYTHONINTERP_FOUND = TRUE
> CMake Error at cmake/Modules/GrComponent.cmake:75 (message):
>   user force-enabled gnuradio-runtime but configuration checked failed
> Call Stack (most recent call first):
>   gnuradio-runtime/CMakeLists.txt:36 (GR_REGISTER_COMPONENT)
> 
> Boost is not found due to missing "indirect dependencies".
> According to FindBoost.cmake, provided by cmake, Boost_thread depends on
> Boost_atomic and Boost_chrono.

If that's really the case, then isn't the proper fix to adjust
package/boost/Config.in to have BR2_PACKAGE_BOOST_THREAD select
BR2_PACKAGE_BOOST_ATOMIC and BR2_PACKAGE_BOOST_CHRONO ?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
