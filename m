From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 4 Apr 2015 18:36:06 +0200
Subject: [Buildroot] [PATCH 7/8] libssh2: fix static link with libgcrypt
In-Reply-To: <1411465547-6847-7-git-send-email-jezz@sysmic.org>
References: <1411465547-6847-1-git-send-email-jezz@sysmic.org>
 <1411465547-6847-7-git-send-email-jezz@sysmic.org>
Message-ID: <20150404183606.6ddc9c9f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear J?r?me Pouiller,

On Tue, 23 Sep 2014 11:45:46 +0200, J?r?me Pouiller wrote:
> BR call configure script with environment variable
> lt_cv_sys_lib_search_path_spec="" (see packages/Makefile.in). This prevent
> libtool to detect compiler builtin paths. Thus, in case where
> BR2_PREFER_STATIC_LIB is enabled, libtool does not find libgpg-error
> dependency:
> 
> /home/jezz/br-continuous/cfgs/31-x86_64-core2-uclibc-static/host/usr/i686-buildroot-linux-uclibc/sysroot/usr/lib/libgcrypt.a(rsa.o):
> In function `run_selftests':
> rsa.c:(.text+0xd2): undefined reference to `gpg_strerror'
> rsa.c:(.text+0xfc): undefined reference to `gpg_strerror'
> 
> For this case, we may remove $lt_cv_sys_lib_search_path_spec from environment.
> However, it not easy to remove a variable from default environment. So, we
> prefer to pass a correct value.
> 
> Signed-off-by: J?r?me Pouiller <jezz@sysmic.org>

Since this patch, some other changes have been made to the libssh2
package, and it now links fine in a static configuration. I've marked
this patch as Rejected in patchwork, then.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
