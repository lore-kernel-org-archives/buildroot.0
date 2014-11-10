From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 10 Nov 2014 19:46:01 +0100
Subject: [Buildroot] [PATCH v2 0/4] elfutils: version bump
In-Reply-To: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1415637521-57583-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20141110184601.GB22119@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Vicente, All,

On 2014-11-10 16:38 +0000, Vicente Olivert Riera spake thusly:
> Changes since v1:
> - Don't use one single patch to rename patches and adapt them to the new 
>   version. Now it's done in two separated patches. Thanks to Yann E.
>   Morin for the advice.
> - Don't use a hook to remove the -Werror options. Instead of that, 
>   modify the config/eu.am to make the --disable-werror configure option
>   do its job properly. Thanks to Yann E. Moring for the patch.
> 
> Vicente Olivert Riera (4):
>   elfutils: rename patches to follow the new name structure
>   elfutils: bump version to 0.160
>   elfutils: adapt patches to the new version
>   elfutils: really make -Werror conditional to BUILD_WERROR

As I said in my previous review, you need to fold patches 2, 3 and 4
into a single patch.

When you bump a version, you should do it as a whole:
  - bump the version
  - update the patches
  - add new patches
all in the same changeset, so that it is always possible to build at
each step, after each patch.

It is posible to split (like you did) to ease review, but then state so
in the cover letter.

Regards,
Yann E. MORIN.

>  ...isable-progs.patch => 0001-disable-progs.patch} |   54 ++++++------
>  package/elfutils/0002-argp-support.patch           |   92 ++++++++++++++++++++
>  ...s-03-memcpy-def.patch => 0003-memcpy-def.patch} |   15 ++--
>  .../{elfutils-04-fts.patch => 0004-fts.patch}      |   69 +++++++--------
>  package/elfutils/0005-disable-po.patch             |   23 +++++
>  ...y-make-werror-conditional-to-build-werror.patch |   16 ++++
>  package/elfutils/elfutils-02-argp-support.patch    |   92 --------------------
>  package/elfutils/elfutils-05-disable-po.patch      |   22 -----
>  package/elfutils/elfutils.hash                     |    3 +
>  package/elfutils/elfutils.mk                       |    6 +-
>  10 files changed, 204 insertions(+), 188 deletions(-)
>  rename package/elfutils/{elfutils-01-disable-progs.patch => 0001-disable-progs.patch} (60%)
>  create mode 100644 package/elfutils/0002-argp-support.patch
>  rename package/elfutils/{elfutils-03-memcpy-def.patch => 0003-memcpy-def.patch} (58%)
>  rename package/elfutils/{elfutils-04-fts.patch => 0004-fts.patch} (97%)
>  create mode 100644 package/elfutils/0005-disable-po.patch
>  create mode 100644 package/elfutils/0006-really-make-werror-conditional-to-build-werror.patch
>  delete mode 100644 package/elfutils/elfutils-02-argp-support.patch
>  delete mode 100644 package/elfutils/elfutils-05-disable-po.patch
>  create mode 100644 package/elfutils/elfutils.hash
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
