From: Daniel James Laird <daniel.j.laird@nxp.com>
Date: Tue, 27 Jan 2009 17:30:25 +0100
Subject: [Buildroot] svn commit: trunk/buildroot/package/icu
In-Reply-To: <87r62ozqv4.fsf@macbook.be.48ers.dk>
References: <20090127150231.1A65F7709E@busybox.osuosl.org>
	<COL102-DS10B32A6F03C4C2B946F2DBDCCB0@phx.gbl>
	<87r62ozqv4.fsf@macbook.be.48ers.dk>
Message-ID: <C13DBBE85AD6974B85C118C35890CA5F1AF38F7920@EU1RDCRDC1WX029.exi.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'm not familiar with the external toolchain stuff, but don't you
> already now need to configure buildroot to match the toolchain
> settings (ipv6, largefile, locales, c++ support and so on?). If not,
> how is that handled?

It is currently setting stuff under toolchain/external-toolchain/Config.in.2

> Daniel> It would seem a shame to break external toolchain support at
> Daniel> this late hour....

> I guess it's already broken then ;) There's several packages depending
> on locales/c++/wchar stuff.

Yep, seems like what I shall do is add the options
BR2_LOCALE, BR2_USE_WCHAR and BR2_INSTALL_LIBSTDCPP.

Quick question, currently toolchain/external-toolchain/Config.in.2 is setting BR2_GCC_CROSS_CXX which means build a working C++ compiler (in buildroot toolchain case) or I have a  working C++ compiler (in external toolchain usecase).  So should this be changed to BR2_INSTALL_LIBSTDCPP as we seem to be using this second option to dictate whether some packages can be built (qt/icu etc) or should we instead be checking against BR2_GCC_CROSS_CXX in the packages that require C++ compiler support

Cheers
Dan
