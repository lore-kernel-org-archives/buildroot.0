From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 30 Aug 2010 15:56:17 +0000 (UTC)
Subject: [Buildroot] systemtap support?
References: <i58qcn$k3i$1@dough.gmane.org> <i5gj7q$tev$1@dough.gmane.org>
Message-ID: <i5gkb0$72g$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-08-30, Grant Edwards <grant.b.edwards@gmail.com> wrote:
> On 2010-08-27, Grant Edwards <grant.b.edwards@gmail.com> wrote:
>
>> I've figured out how to cross-compile a systemtap script ( generating
>> a kernel module for the target).  Now I need to build "staprun" for
>> the target.
>
> I've added a systemtap "AUTOTARGETS" package, but the configure is
> failing because the configure script is trying to check for existence
> of files.
>
> AFAICT, the fix for that is to pass some environment variables to the
> configure script that will short-circuit the file existence checks.
>
> Something like this:
>
>   ac_cv_file__usr_include_nspr=no \
>   ac_cv_file__usr_include_nspr4=no \
>   ac_cv_file__usr_include_nss=no \
>   ac_cv_file__usr_include_nss3=no \
>   ac_cv_func_malloc_0_nonnull=yes ./configure
>
> How do you pass environment variables to the configure script when
> using AUTOTARGETS?  

Never mind, I finally noticed xxxx_CONF_EVN in the documentation.

-- 
Grant Edwards               grant.b.edwards        Yow! I've read SEVEN
                                  at               MILLION books!!
                              gmail.com            
