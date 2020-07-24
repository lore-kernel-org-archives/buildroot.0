From: Petr Vorel <petr.vorel@gmail.com>
Date: Fri, 24 Jul 2020 07:43:31 +0200
Subject: [Buildroot] [PATCH v2 1/3] package/ima-evm-utils: fix build on
 musl
In-Reply-To: <20200723224044.3dc2fefe@windsurf.home>
References: <20200723200457.3996-1-petr.vorel@gmail.com>
 <20200723224044.3dc2fefe@windsurf.home>
Message-ID: <20200724054331.GB4183@dell5510>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

> On Thu, 23 Jul 2020 22:04:55 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:

> > Fixes:
> >                    br-arm-cortex-a9-musl [ 7/44]: FAILED
> >                 br-i386-pentium-mmx-musl [12/44]: FAILED
> >                           br-x86-64-musl [34/44]: FAILED
> >                           linaro-aarch64 [36/44]: FAILED

> > Fix will be released in future release (after 1.3), but was needed since
> > initial release.

> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>

> Why don't we have autobuilder failures ?

> If you look at:

>   http://autobuild.buildroot.net/index.php?libc=musl&symbols%5BBR2_PACKAGE_IMA_EVM_UTILS%5D=y

> you will see that we have plenty of builds that succeed, with
> BR2_PACKAGE_IMA_EVM_UTILS=y, with musl toolchains.

> Notes:

>  - There are failures above, but none of them are due to ima-evm-utils.
>    You can also look at
>    http://autobuild.buildroot.net/?reason=ima-evm-utils% which shows we
>    never had a single build failure caused by this package (it seems).

>  - The above URL is slow to load, please give it some time, the SQL
>    query is slow!

Error is:
In file included from pcr_tss.c:59:
imaevm.h:96:2: error: unknown type name ?uid_t?
  uid_t uid;
  ^~~~~
imaevm.h:97:2: error: unknown type name ?gid_t?
  gid_t gid;
  ^~~~~
imaevm.h:104:2: error: unknown type name ?uid_t?
  uid_t uid;
  ^~~~~
imaevm.h:105:2: error: unknown type name ?gid_t?
  gid_t gid;
  ^~~~~
imaevm.h:112:2: error: unknown type name ?uid_t?
  uid_t uid;
  ^~~~~
imaevm.h:113:2: error: unknown type name ?gid_t?
  gid_t gid;
  ^~~~~
imaevm.h:118:2: error: unknown type name ?uid_t?
  uid_t uid;
  ^~~~~
imaevm.h:119:2: error: unknown type name ?gid_t?
  gid_t gid;
  ^~~~~

Although this error was here for long time (I was wrong, not from the beginning,
but from v0.7 2014), but this error probably propagated recently (thus in 1.3)
in 80d3fda, where src/pcr_tss.c and src/pcr_tsspcrread.c started to use
imaevm.h.

=> could you please squash all 3 patches into single one?

> Best regards,

> Thomas

Kind regards,
Petr
