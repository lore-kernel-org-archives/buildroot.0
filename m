From: Antoine Tenart <antoine.tenart@free-electrons.com>
Date: Fri, 19 Feb 2016 15:32:20 +0100
Subject: [Buildroot] [PATCH v4] qt5tools: new package
In-Reply-To: <1454682615-3448-1-git-send-email-ps.report@gmx.net>
References: <1454682615-3448-1-git-send-email-ps.report@gmx.net>
Message-ID: <20160219143219.GA30826@kwain>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

I tested your patch to build the QT5 Linguistic Tools, and it worked
well :)

However I have one comment:

On Fri, Feb 05, 2016 at 03:30:15PM +0100, Peter Seiderer wrote:
> +
> +define QT5TOOLS_INSTALL_STAGING_CMDS

I think you need to call the 'install' target here, to install the QT5
Tools cmake modules in the host directory:

	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install

> +	$(foreach p,$(QT5TOOLS_INSTALL_STAGING_y), \
> +		$(INSTALL) -D -m0755 $(@D)/bin/$(p) $(HOST_DIR)/usr/bin/$(p)$(sep))
> +endef

Thanks,

Antoine

-- 
Antoine T?nart, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 819 bytes
Desc: Digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160219/08621b59/attachment.asc>
