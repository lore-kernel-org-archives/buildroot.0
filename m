From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 2 Apr 2015 00:07:19 +0200
Subject: [Buildroot] [PATCH 2/2] package/powertop: depends on c++
In-Reply-To: <1427472097-30708-2-git-send-email-bernd.kuhls@t-online.de>
References: <1427472097-30708-1-git-send-email-bernd.kuhls@t-online.de>
 <1427472097-30708-2-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150402000719.5821ddf2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Fri, 27 Mar 2015 17:01:37 +0100, Bernd Kuhls wrote:
> Fixes configure error due to missing c++
> 
> checking for library containing pthread_create... no
> configure: error: libpthread is required but was not found
> 
> Quote from config.log:
> 
> configure:21552: checking for library containing pthread_create
> configure:21583: false -o conftest    -Os    conftest.cpp -lintl  >&5
> [...]
> ac_cv_env_CXX_set=set
> ac_cv_env_CXX_value=false
> 
> using this defconfig
> 
> BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
> BR2_PACKAGE_POWERTOP=y
> 
> Please note the number of .cpp files belonging to powertop
> 
> output/build/powertop-2.7$ find -iname *.cpp | wc -l
> 59
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
