From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Sep 2016 21:20:33 +0200
Subject: [Buildroot] [PATCH] gmock: download from github and convert to
 a cmake-package
In-Reply-To: <1473353883-10762-1-git-send-email-casantos@datacom.ind.br>
References: <983781693.3690991.1473290568772.JavaMail.zimbra@datacom.ind.br>
 <1473353883-10762-1-git-send-email-casantos@datacom.ind.br>
Message-ID: <20160908212033.1d1c6947@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  8 Sep 2016 13:58:03 -0300, Carlos Santos wrote:

> +--- ./CMakeLists.txt.orig	2013-09-18 21:32:04.000000000 -0300
> ++++ ./CMakeLists.txt	2016-09-08 11:10:51.519780433 -0300
> +@@ -15,7 +15,7 @@
> + if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/gtest/CMakeLists.txt")
> +   set(gtest_dir gtest)
> + else()
> +-  set(gtest_dir ../gtest)
> ++  set(gtest_dir ../gtest-${GTEST_VERSION})

So you make the assumption that you have the following code
organization:

  output/build/gmock-1.7.0
  output/build/gtest-1.7.0

i.e, during its build process, gmock needs to access the gtest source
code?

Why is it the case? As far as I'm aware, it's not currently the case
with the existing packaging.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
