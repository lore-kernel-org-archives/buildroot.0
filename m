From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 25 Oct 2015 22:08:07 +0100
Subject: [Buildroot] [PATCH v5 19/36] package/libevas-generic-loaders:
 bump to version 1.15.0
In-Reply-To: <20151025160143.GQ11692@free.fr>
References: <1445720476-21517-1-git-send-email-romain.naour@openwide.fr>
 <1445720476-21517-20-git-send-email-romain.naour@openwide.fr>
 <20151025160143.GQ11692@free.fr>
Message-ID: <20151025210807.GJ11692@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2015-10-25 17:01 +0100, Yann E. MORIN spake thusly:
> On 2015-10-24 23:00 +0200, Romain Naour spake thusly:
> > Use the newly added libefl package wich provide a new version
> > of libeina.
> > 
> > Also, update the upstream url and add a hash file.
> > 
> > While at it, remove BR2_TOOLCHAIN_HAS_THREADS and BR2_INSTALL_LIBSTDCPP
> > dependencies since the efl package already depend on them.
> > 
> > Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> 
> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

As we discussed on another patch, you can indeed drop threads, because
they are not used by evas-generic-loader.

However, it has a C++ file (for PDF rendering), and configure.ac checks
for it with AC_PROG_CXX, so you need to keep the dependency on C++.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
