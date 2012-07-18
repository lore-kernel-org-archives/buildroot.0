From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 18 Jul 2012 19:37:50 +0200
Subject: [Buildroot] [PATCH 1/4] add host arch detection and Kconfig
 BR2_HOSTARCH
In-Reply-To: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
References: <1342619953-15512-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20120718193750.2020db34@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Wed, 18 Jul 2012 15:59:09 +0200,
Francois Perrad <fperrad@gmail.com> a ?crit :

> This will allow to install binary package only if they are supported by the
> host. As example Atmel SAM-BA (x86 only).
> 
> Signed-off-by: Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>

I have applied this patch and the 3 other Lua-related patches.

Could you however work on something that ensures that the
BR2_PACKAGE_LUA option, when enabled, actually installs something?
Maybe the BR2_PACKAGE_LUA_SHARED_LIBRARY option needs to be removed,
and just enabling BR2_PACKAGE_LUA should unconditionally install the
shared library. Sub-options could be used to selectively install the
interpreter and/or the compiler. Do you think it makes sense?

Another thing that would be great is probably to rename all Lua modules
to lua<something>, like luaexpat and luacjson. Do you think it is
possible? The only drawback is probably that the package name would no
longer match the upstream project name, but it would make Lua modules
much easier to identify in the list of packages in package/.

Thanks,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
