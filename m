From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 1 Feb 2016 16:47:49 +0100
Subject: [Buildroot] [PATCH v2 1/2] toolchain-external: add a check for
 unsupported toolchains
In-Reply-To: <56AF7262.1080002@gmail.com>
References: <1454334017-12326-1-git-send-email-romain.naour@gmail.com>
 <20160201153839.6325ebba@free-electrons.com>
 <56AF7262.1080002@gmail.com>
Message-ID: <20160201164749.29d9afd5@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 1 Feb 2016 15:57:38 +0100, Romain Naour wrote:

> > The variable should not be named non_existent_sysroot since it may
> > exist. Also, you could use the existing toolchain_find_libc_a function,
> > no? So maybe:
> > 
> > 	libc_a_path=$(call toolchain_find_libc_a,$${__CROSS_CC}) ; \
> 
> ok for the variable naming, but I didn't used toolchain_find_libc_a directly
> because realpath -f is used by this function.
> 
> The path returned is $PWD/libc.a when something go wrong with the sysroot.
> So the test would be test -d in this case but I think it's better to test the
> path returned by __CROSS_CC directly against "libc.a".

Ah, right. So just keep your code as it was: call gcc directly with
-print-file-name.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
