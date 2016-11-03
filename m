From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 23:34:39 +0100
Subject: [Buildroot] [PATCH 1/4] package/pseudo: needs sqlite
In-Reply-To: <66a2e2ef68a1edaaaee0d92c60279cc8b2e5325b.1478211656.git.yann.morin.1998@free.fr>
References: <cover.1478211656.git.yann.morin.1998@free.fr>
 <66a2e2ef68a1edaaaee0d92c60279cc8b2e5325b.1478211656.git.yann.morin.1998@free.fr>
Message-ID: <20161103233439.02cd07a4@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu,  3 Nov 2016 23:21:05 +0100, Yann E. MORIN wrote:

> +HOST_PSEUDO_DEPENDENCIES = host-sqlite
> +HOST_PSEUDO_CONF_OPTS = \
> +	--libdir=$(HOST_DIR)/usr/lib \
> +	--with-sqlite=$(HOST_DIR)/usr

I've added a comment above this to explain why we pass --libdir even
though this shouldn't be needed for autotools packages.

However, the fact that pseudo doesn't use a real autoconf configure
script also means that it shouldn't be using the autotools-package
infra: it should use the generic-package infra. Something to fix in a
follow-up patch.

Applied with the comment added, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
