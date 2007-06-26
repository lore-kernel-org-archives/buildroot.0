From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Tue, 26 Jun 2007 19:07:27 +0200
Subject: [Buildroot] [PATCH] fontconfig package : cross-compilation
In-Reply-To: <f0528b5b0706260819i3cc09a10v2b015d6293d2f92a@mail.gmail.com>
References: <f0528b5b0706240958h5b0c9148k319aea532df6eda0@mail.gmail.com>
	<f0528b5b0706241133v5f294ba0o6117a599a85cc39a@mail.gmail.com>
	<20070625083203.GA5134@aon.at>
	<f0528b5b0706260819i3cc09a10v2b015d6293d2f92a@mail.gmail.com>
Message-ID: <20070626170727.GC4096@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jun 26, 2007 at 05:19:28PM +0200, Julien Letessier wrote:
>Note that quite a few Buildroot packages require autoconf to be
>installed on the host (openssh, dropbear, avahi, gawk, dbug, glib)...
>they'll need to be changed, too.

yes
>
>Attached are patches for
>* autoconf-host, automake-host, libtool-host
> and an $(AUTORECONF) variable that runs autoreconf with the
>appropriate arguments
>* the fontconfig package using custom-built autoreconf (replaces previous 
>patch)
>
>This still requires perl on the build host, but I assume that's reasonable 
>:)

no :)
>
>Tell me how this works for you.

In order to avoid to have the sources unpacked in two locations, we
usually unpack them into $(TOOL_BUILD_DIR), i.e.:
AUTOMAKE_SRC_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VER)
AUTOMAKE_DIR:=$(BUILD_DIR)/automake-$(AUTOMAKE_VER)
AUTOMAKE_HOST_DIR:=$(TOOL_BUILD_DIR)/automake-$(AUTOMAKE_VER)-host

Can you please adjust accordingly?

Thanks for the nice patch!
