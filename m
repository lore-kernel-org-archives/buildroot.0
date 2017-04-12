From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Apr 2017 21:37:58 +0200
Subject: [Buildroot] [PATCH 01/14] package/hiredis: add missing library
 symlink
In-Reply-To: <20170411222643.9770-1-romain.naour@gmail.com>
References: <20170411222643.9770-1-romain.naour@gmail.com>
Message-ID: <20170412213758.5441ef7e@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 12 Apr 2017 00:26:30 +0200, Romain Naour wrote:

> +	ln -sf libhiredis.so $(STAGING_DIR)/usr/lib/libhiredis.so.$(HIREDIS_VERSION_MAJOR)

I don't think this was the correct fix, the symbolic link should be the
other way around, and indeed the "make install" of hiredis does it the
other way around.

So I've tweaked your patch to instead install the library itself as
libhiredis.so.0.13, and create a symbolic link named libhiredis.so.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
