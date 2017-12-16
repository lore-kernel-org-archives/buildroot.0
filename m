From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 16 Dec 2017 16:06:36 +0100
Subject: [Buildroot] [PATCH] traceroute: new package
In-Reply-To: <1513429309-16761-1-git-send-email-sergio.prado@e-labworks.com>
References: <1513429309-16761-1-git-send-email-sergio.prado@e-labworks.com>
Message-ID: <20171216160636.028739fe@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 16 Dec 2017 11:01:49 -0200, Sergio Prado wrote:

> +define TRACEROUTE_INSTALL_TARGET_CMDS
> +	$(RM) -f $(TARGET_DIR)/usr/bin/traceroute

I didn't see why this is needed. The package does a simple "cp", so
reinstallation works fine. So I've dropped this.

> +	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) \
> +		prefix=$(TARGET_DIR)/usr install -C $(@D)

This value of prefix is not really correct. A more correct approach is
DESTDIR=$(TARGET_DIR) prefix=/usr. Even though it changes nothing in
practice for this package, it is more consistent with what we do in
other packages (and what is technically correct).

Applied with those changes. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
