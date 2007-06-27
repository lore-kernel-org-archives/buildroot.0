From: Julien Letessier <julien.letessier@technosens.fr>
Date: Wed, 27 Jun 2007 15:59:56 +0200
Subject: [Buildroot] [PATCH] fontconfig package : cross-compilation
In-Reply-To: <20070626170727.GC4096@aon.at>
References: <f0528b5b0706240958h5b0c9148k319aea532df6eda0@mail.gmail.com>
	<f0528b5b0706241133v5f294ba0o6117a599a85cc39a@mail.gmail.com>
	<20070625083203.GA5134@aon.at>
	<f0528b5b0706260819i3cc09a10v2b015d6293d2f92a@mail.gmail.com>
	<20070626170727.GC4096@aon.at>
Message-ID: <f0528b5b0706270659w72029034q696ae178f7285e71@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2007/6/26, Bernhard Fischer <rep.dot.nop@gmail.com>:

In order to avoid to have the sources unpacked in two locations, we
> usually unpack them into $(TOOL_BUILD_DIR), i.e.:
> AUTOMAKE_SRC_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VER)
> AUTOMAKE_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VER)
> AUTOMAKE_HOST_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VER)-host
>
> Can you please adjust accordingly?
>

Done.
I took the liberty to add a few 'touch -c $@' where relevant.
I also changed the targets from foo-host to host-foo, as seems to be the
policy elswhere in buildroot.

Cheers,
-- 
Julien Letessier
< julien.letessier@technosens.fr>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070627/15d17043/attachment-0001.htm 
-------------- next part --------------
A non-text attachment was scrubbed...
Name: buildroot_autoconf-automake-libtool-host-v2.patch
Type: application/octet-stream
Size: 10411 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070627/15d17043/attachment-0001.obj 
