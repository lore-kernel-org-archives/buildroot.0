From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 8 Apr 2014 18:16:53 +0200
Subject: [Buildroot] [PATCH 2/2] package/zile: add Zile is Lossy Emacs
 editor
In-Reply-To: <87y4zg3yyj.fsf@linaro.org>
References: <1396868422-5757-1-git-send-email-alex.bennee@linaro.org>
 <1396868422-5757-3-git-send-email-alex.bennee@linaro.org>
 <20140407203338.GC3215@free.fr> <87y4zg3yyj.fsf@linaro.org>
Message-ID: <20140408161653.GA3199@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Alex, All,

On 2014-04-08 11:19 +0100, Alex Benn?e spake thusly:
> Yann E. MORIN <yann.morin.1998@free.fr> writes:
[--SNIP--]
> >> diff --git a/package/zile/zile.mk b/package/zile/zile.mk
> >> new file mode 100644
> >> index 0000000..024595c
> >> --- /dev/null
> >> +++ b/package/zile/zile.mk
> >> @@ -0,0 +1,13 @@
> >> +################################################################################
> >> +#
> >> +# Zile
> >> +#
> >> +################################################################################
> >> +
> >> +ZILE_VERSION = 2.4.11
> >> +ZILE_SITE = http://ftp.gnu.org/gnu/zile/
> >> +ZILE_LICENSE = GPLv1+
> >> +ZILE_LICENSE_FILES = COPYING
> >> +ZILE_CONF_OPT += --without-help2man
> >
> > In the previous patch, you added libgc, stating that it was a dependency
> > of Zile, but you forgot to add it here.
> 
> Ahh I thought it was enforced by the Config.in select but of course you
> need to ensure it's built as well. I'll fix that up.

THere are two types of dependencies:
  - build-time dependencies, and
  - run-time dependencies.

The run-time dependencies (eg. I need *that* program to be present) are
handled purely in the Config.in.

The build-time dependencies (eg. I need to link to *that* library) are
handled both in Config.in and the .mk.

The dependencies in Config.in will ensure that the package is present in
the target, while the dependencies in the .mk guarantee the build order.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
