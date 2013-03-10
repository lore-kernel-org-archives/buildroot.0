From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Sun, 10 Mar 2013 14:44:49 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2013-03-09
In-Reply-To: <20130310073527.D510B430447@lolut.humanoidz.org>
References: <20130310073527.D510B430447@lolut.humanoidz.org>
Message-ID: <513C8041.9030103@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



> Build 6a01adcf1bda008994c3a1e17e36590abe70b11d
> ==============================================
>
> Status         : NOK
> Failure reason : boost-1.52.0
> Architecture   : x86_64
> Submitted by   : Thomas Petazzoni (Free Electrons build server)
> Submitted at   : 2013-03-09 16:26:48
> Git commit ID  : http://git.buildroot.net/buildroot/commit/?id=8d3f97257ffb9ed89761f503014f0e3375f2d6a3
> End of log     : http://autobuild.buildroot.net/results/6a01adcf1bda008994c3a1e17e36590abe70b11d/build-end.log
> Complete log   : http://autobuild.buildroot.net/results/6a01adcf1bda008994c3a1e17e36590abe70b11d/build.log.bz2
> Configuration  : http://autobuild.buildroot.net/results/6a01adcf1bda008994c3a1e17e36590abe70b11d/config
> Defconfig      : http://autobuild.buildroot.net/results/6a01adcf1bda008994c3a1e17e36590abe70b11d/defconfig
>

This could maybe fix that (from:
https://svn.boost.org/trac/boost/query?status=!closed&page=8&order=type&row=description)

diff -ruN boost_1_49_0.orig/libs/locale/src/icu/formatter.cpp boost_1_49_0/libs/locale/src/icu/formatter.cpp
--- boost_1_49_0.orig/libs/locale/src/icu/formatter.cpp 2011-07-12 14:57:36.000000000 +0100
+++ boost_1_49_0/libs/locale/src/icu/formatter.cpp      2012-05-01 14:27:54.000000000 +0100
@@ -58,7 +58,7 @@
             virtual string_type format(int64_t value,size_t &code_points) const
             {
                 icu::UnicodeString tmp;
-                icu_fmt_->format(value,tmp);
+                icu_fmt_->format(::int64_t(value),tmp);
                 code_points=tmp.countChar32();
                 return cvt_.std(tmp);
             }



Regards
Stefan
