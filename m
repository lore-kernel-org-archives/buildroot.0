From: Carlos Santos <casantos@datacom.ind.br>
Date: Thu, 8 Sep 2016 17:11:48 -0300 (BRT)
Subject: [Buildroot] [PATCH] gmock: download from github and convert to
 a cmake-package
In-Reply-To: <20160908212033.1d1c6947@free-electrons.com>
References: <983781693.3690991.1473290568772.JavaMail.zimbra@datacom.ind.br>
 <1473353883-10762-1-git-send-email-casantos@datacom.ind.br>
 <20160908212033.1d1c6947@free-electrons.com>
Message-ID: <893091325.3899936.1473365508575.JavaMail.zimbra@datacom.ind.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> From: "Thomas Petazzoni" <thomas.petazzoni@free-electrons.com>
> To: "Carlos Santos" <casantos@datacom.ind.br>
> Cc: buildroot at buildroot.org, "fabrice fontaine" <fabrice.fontaine@orange.com>, "fontaine fabrice"
> <fontaine.fabrice@gmail.com>
> Sent: Thursday, September 8, 2016 4:20:33 PM
> Subject: Re: [Buildroot] [PATCH] gmock: download from github and convert to a cmake-package

> Hello,
> 
> On Thu,  8 Sep 2016 13:58:03 -0300, Carlos Santos wrote:
> 
>> +--- ./CMakeLists.txt.orig	2013-09-18 21:32:04.000000000 -0300
>> ++++ ./CMakeLists.txt	2016-09-08 11:10:51.519780433 -0300
>> +@@ -15,7 +15,7 @@
>> + if (EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/gtest/CMakeLists.txt")
>> +   set(gtest_dir gtest)
>> + else()
>> +-  set(gtest_dir ../gtest)
>> ++  set(gtest_dir ../gtest-${GTEST_VERSION})
> 
> So you make the assumption that you have the following code
> organization:
> 
>  output/build/gmock-1.7.0
>  output/build/gtest-1.7.0
> 
> i.e, during its build process, gmock needs to access the gtest source
> code?

Right.

> Why is it the case? As far as I'm aware, it's not currently the case
> with the existing packaging.

Because the old gmock distribution (gmock-1.7.0.zip) contained the gtest
code, while the new one (gmock-release-1.7.0.tar.gz) does not.

Carlos Santos (Casantos)
DATACOM, P&D
