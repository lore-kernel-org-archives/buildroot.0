From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 31 Aug 2017 09:14:19 +0200
Subject: [Buildroot] [PATCH] package/xmlstarlet: fix host build
In-Reply-To: <20170830224010.15658-1-romain.naour@gmail.com>
References: <20170830224010.15658-1-romain.naour@gmail.com>
Message-ID: <20170831091419.3d0039cc@windsurf.lan>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 31 Aug 2017 00:40:10 +0200, Romain Naour wrote:
> Provide the path to HOST_DIR for libxml, libxslt and libiconv like for
> the target variant.
> 
> Fixes:
> src/xml_C14N.c:12:31: erreur fatale?: libxml/xmlversion.h : No such file or directory
>  #include <libxml/xmlversion.h>
>                                ^
> In file included from src/trans.c:4:0:
> src/trans.h:32:30: erreur fatale?: libxml/xmlmemory.h : No such file or directory
>  #include <libxml/xmlmemory.h>

It would be nice to use LANG=C when building and copy/pasting error
messages, to avoid French words in the middle :)

However: under which conditions does it fail? Why do we suddenly have
this failure? Have the autobuilders noticed?

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
