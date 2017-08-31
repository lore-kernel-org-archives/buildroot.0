From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Aug 2017 09:25:16 +0200
Subject: [Buildroot] [PATCH] package/xmlstarlet: fix host build
In-Reply-To: <20170831091419.3d0039cc@windsurf.lan>
References: <20170830224010.15658-1-romain.naour@gmail.com>
 <20170831091419.3d0039cc@windsurf.lan>
Message-ID: <CANLo3Jix+ojJWq6QTRaxxpOMDHBJtkUkiZnAzy6neY95h=OGCA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Le 31 ao?t 2017 09:14, "Thomas Petazzoni" <
thomas.petazzoni@free-electrons.com> a ?crit :

Hello,

On Thu, 31 Aug 2017 00:40:10 +0200, Romain Naour wrote:
> Provide the path to HOST_DIR for libxml, libxslt and libiconv like for
> the target variant.
>
> Fixes:
> src/xml_C14N.c:12:31: erreur fatale : libxml/xmlversion.h : No such file
or directory
>  #include <libxml/xmlversion.h>
>                                ^
> In file included from src/trans.c:4:0:
> src/trans.h:32:30: erreur fatale : libxml/xmlmemory.h : No such file or
directory
>  #include <libxml/xmlmemory.h>

It would be nice to use LANG=C when building and copy/pasting error
messages, to avoid French words in the middle :)


"No such file or directory" looks english to me at 0h40 :p

I'll fix this.


However: under which conditions does it fail? Why do we suddenly have
this failure? Have the autobuilders noticed?


I had the issue locally, I think libxml-dev is installed on autobuilders.
I was trying to reproduce the kodi build issue with glibc 2.26.

Bernd added recently a host variant for this package maybe that is why it
was not noticed until now.

Best regards,
Romain


Thomas
--
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170831/e82333ac/attachment.html>
