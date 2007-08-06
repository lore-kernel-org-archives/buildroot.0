From: Ulf Samuelsson <ulf@atmel.com>
Date: Mon, 6 Aug 2007 22:38:42 +0200
Subject: [Buildroot] [patch] libxml2 fixes
References: <46B739FF.5020507@mainstreetsoftworks.com>
Message-ID: <02f001c7d869$de70f960$dcc4af0a@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

----- Original Message ----- 
From: "Brad House" <brad@mainstreetsoftworks.com>
To: <buildroot@uclibc.org>
Sent: Monday, August 06, 2007 5:10 PM
Subject: [Buildroot] [patch] libxml2 fixes


> There are a few issues with libxml2.
>  - It depends on BR2_USE_WCHAR (which in reality, it doesn't)
>  - xml2-config exports the wrong paths
>  - it tries to build everything, python modules, etc
>  - libxml2.la is installed, which has a wrong path, causes issues
>    when linking using libtool, just remove it.
> 
> Here's a patch to clean that up...
> 
> 
> -Brad
>

When I tried to build libxml2 using a toolchain without wchar support
it failed, when it is built with a toolchain supporting wchar, it completes the build.

Best Regards
Ulf Samuelsson
