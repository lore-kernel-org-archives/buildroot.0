From: Julien Letessier <julien.letessier@technosens.fr>
Date: Tue, 26 Jun 2007 17:19:28 +0200
Subject: [Buildroot] [PATCH] fontconfig package : cross-compilation
In-Reply-To: <20070625083203.GA5134@aon.at>
References: <f0528b5b0706240958h5b0c9148k319aea532df6eda0@mail.gmail.com>
	<f0528b5b0706241133v5f294ba0o6117a599a85cc39a@mail.gmail.com>
	<20070625083203.GA5134@aon.at>
Message-ID: <f0528b5b0706260819i3cc09a10v2b015d6293d2f92a@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that quite a few Buildroot packages require autoconf to be
installed on the host (openssh, dropbear, avahi, gawk, dbug, glib)...
they'll need to be changed, too.

Attached are patches for
* autoconf-host, automake-host, libtool-host
  and an $(AUTORECONF) variable that runs autoreconf with the
appropriate arguments
* the fontconfig package using custom-built autoreconf (replaces previous patch)

This still requires perl on the build host, but I assume that's reasonable :)

Tell me how this works for you.

2007/6/25, Bernhard Fischer <rep.dot.nop@gmail.com>:
> On Sun, Jun 24, 2007 at 08:33:18PM +0200, Julien Letessier wrote:
> >Functionnaly identical patch, slightly simpler.
> >Installation directories are also corrected.
>
> Two remarks:
> - please push this upstream, too
> - please add a patch that does this autoreconf. We should not rely on
>   the build-host to have autoconf nor automake installed, i think.
>
> Thanks alot for looking into this!
>


-- 
Julien Letessier
<julien.letessier@technosens.fr>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_autoconf-automake-libtool-host.patch
Type: application/octet-stream
Size: 6685 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070626/177f17c3/attachment-0002.obj 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_fontconfig-v2.patch
Type: application/octet-stream
Size: 7880 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070626/177f17c3/attachment-0003.obj 
