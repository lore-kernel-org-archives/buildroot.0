From: Ulf Samuelsson <ulf@atmel.com>
Date: Tue, 7 Aug 2007 19:17:34 +0200
Subject: [Buildroot] [patch] libxml2 fixes
References: <46B739FF.5020507@mainstreetsoftworks.com>
Message-ID: <021f01c7d939$a63ac0a0$dcc4af0a@atmel.com>
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


Seems the Python support could be the culprit.
While compiling "libxml.c" it complains that 
    ".../python2.5/unicodeobject.h:118:21" wchar.h: No such file or directory.

Best Regards
Ulf Samuelsson
