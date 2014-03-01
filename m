From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Mar 2014 14:46:09 +0100
Subject: [Buildroot] [PATCH] lzip: new package
In-Reply-To: <1393599281-28078-1-git-send-email-gustavo@zacarias.com.ar>
References: <1393599281-28078-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20140301144609.016009bd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Fri, 28 Feb 2014 11:54:41 -0300, Gustavo Zacarias wrote:
> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Since you're adding a host variant of the package, it would be good to
have some details in the commit log as to why this is necessary.

> +define LZIP_CONFIGURE_CMDS
> +	(cd $(@D); ./configure \
> +		CXX="$(TARGET_CXX)" \
> +		CPPFLAGS="$(TARGET_CPPFLAGS)" \
> +		CXXFLAGS="$(TARGET_CXXFLAGS)" \
> +		LDFLAGS="$(TARGET_LDFLAGS)" \
> +		--prefix=/usr )
> +
> +endef

Useless blank line before endef.

If you're using the generic-package infra, I suppose it's because the
configure script isn't autotools-based. It would be good to mention
that in a comment before LZIP_CONFIGURE_CMDS.

Also, what about using TARGET_CONFIGURE_OPTS / HOST_CONFIGURE_OPTS
instead of passing CXX, CPPFLAGS, CXXFLAGS and LDFLAGS ?

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
