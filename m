From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Mon, 30 Aug 2010 15:37:30 +0000 (UTC)
Subject: [Buildroot] systemtap support?
References: <i58qcn$k3i$1@dough.gmane.org>
Message-ID: <i5gj7q$tev$1@dough.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2010-08-27, Grant Edwards <grant.b.edwards@gmail.com> wrote:

> I've figured out how to cross-compile a systemtap script ( generating
> a kernel module for the target).  Now I need to build "staprun" for
> the target.

I've added a systemtap "AUTOTARGETS" package, but the configure is
failing because the configure script is trying to check for existence
of files.

AFAICT, the fix for that is to pass some environment variables to the
configure script that will short-circuit the file existence checks.

Something like this:

  ac_cv_file__usr_include_nspr=no \
  ac_cv_file__usr_include_nspr4=no \
  ac_cv_file__usr_include_nss=no \
  ac_cv_file__usr_include_nss3=no \
  ac_cv_func_malloc_0_nonnull=yes ./configure

How do you pass environment variables to the configure script when
using AUTOTARGETS?  

-- 
Grant Edwards               grant.b.edwards        Yow! I hope something GOOD
                                  at               came in the mail today so
                              gmail.com            I have a REASON to live!!
