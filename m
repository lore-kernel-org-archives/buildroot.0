From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 19 Sep 2007 14:35:27 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/package/libgcrypt
In-Reply-To: <20070919122053.4675CA4D19@busybox.net>
References: <20070919122053.4675CA4D19@busybox.net>
Message-ID: <20070919123527.GB14507@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Sep 19, 2007 at 05:20:53AM -0700, aldot at uclibc.org wrote:
>Author: aldot
>Date: 2007-09-19 05:20:52 -0700 (Wed, 19 Sep 2007)
>New Revision: 19888
>
>Log:
>- fix incorrect setting of $ac_cv_sys_symbol_underscore.
>  There is no reason not to AC_COMPILE and use the set cross-nm to look for
>  the symbol mangling scheme. Thus it is incorrect to check for cross compilation
>  in the GNUPG_SYS_SYMBOL_UNDERSCORE check.
>- fix bug when configuring (has to wipe config.cache !)

Ulf,

I'm curious how that did ever work for you?

I assume that if all was setup correctly, you would have ended up with:
  ../src/.libs/libgcrypt.so -lnsl
../src/.libs/libgcrypt.so: undefined reference to `_gcry_mpih_addmul_1'
../src/.libs/libgcrypt.so: undefined reference to `_gcry_mpih_rshift'
../src/.libs/libgcrypt.so: undefined reference to `_gcry_mpih_add_n'
../src/.libs/libgcrypt.so: undefined reference to `_gcry_mpih_mul_1'
../src/.libs/libgcrypt.so: undefined reference to `_gcry_mpih_submul_1'
../src/.libs/libgcrypt.so: undefined reference to `_gcry_mpih_lshift'
../src/.libs/libgcrypt.so: undefined reference to `_gcry_mpih_sub_n'

Same for vpnc that didn't even have libgcrypt as prerequisite, but that
doesn't matter much anyway since gcrypt was completely broken anyway.

Please audit your packages, as said in my previous mail..
