From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 27 Jan 2009 17:47:19 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
In-Reply-To: <C13DBBE85AD6974B85C118C35890CA5F1AF38F7920@EU1RDCRDC1WX029.exi.nxp.com>
	(Daniel James Laird's message of "Tue\,
	27 Jan 2009 17\:30\:25 +0100")
References: <20090127150231.1A65F7709E@busybox.osuosl.org>
	<COL102-DS10B32A6F03C4C2B946F2DBDCCB0@phx.gbl>
	<87r62ozqv4.fsf@macbook.be.48ers.dk>
	<C13DBBE85AD6974B85C118C35890CA5F1AF38F7920@EU1RDCRDC1WX029.exi.nxp.com>
Message-ID: <87mydczofc.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Daniel" == Daniel James Laird <daniel.j.laird@nxp.com> writes:

Hi,

 >> I'm not familiar with the external toolchain stuff, but don't you
 >> already now need to configure buildroot to match the toolchain
 >> settings (ipv6, largefile, locales, c++ support and so on?). If not,
 >> how is that handled?

 Daniel> It is currently setting stuff under
 Daniel> toolchain/external-toolchain/Config.in.2

Ahh ok.

 >> I guess it's already broken then ;) There's several packages
 >> depending on locales/c++/wchar stuff.

 Daniel> Yep, seems like what I shall do is add the options
 Daniel> BR2_LOCALE, BR2_USE_WCHAR and BR2_INSTALL_LIBSTDCPP.

Seems so.

 Daniel> Quick question, currently
 Daniel> toolchain/external-toolchain/Config.in.2 is setting
 Daniel> BR2_GCC_CROSS_CXX which means build a working C++ compiler
 Daniel> (in buildroot toolchain case) or I have a working C++
 Daniel> compiler (in external toolchain usecase).  So should this be
 Daniel> changed to BR2_INSTALL_LIBSTDCPP as we seem to be using this
 Daniel> second option to dictate whether some packages can be built
 Daniel> (qt/icu etc) or should we instead be checking against
 Daniel> BR2_GCC_CROSS_CXX in the packages that require C++ compiler
 Daniel> support

Well, these things date back to before my time - I'm not quite sure
why we have 2 config settings for C++, and if C++ support without
libstdc++ makes any sense, but the best approach indeed seems to be to
add a LIBSTDCPP option as well (You can make it a hidden option that
get's selected by the CROSS_CXX if you want to).

-- 
Bye, Peter Korsgaard
