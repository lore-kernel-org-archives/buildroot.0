From: Etienne Carriere <etienne.carriere@linaro.org>
Date: Tue, 9 Mar 2021 21:40:45 +0100
Subject: [Buildroot] [PATCH] package/optee-client: fix git_d build issue
 in OP-TEE 3.12 libckteec
In-Reply-To: <20210309202244.GN2737665@scaer>
References: <20210309113348.22974-1-etienne.carriere@linaro.org>
 <20210309202244.GN2737665@scaer>
Message-ID: <CAN5uoS_+MS=qu0vT_DdL=dESUs-3pAA+Sg7TsiF1b7g4-K0dTg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Tue, 9 Mar 2021 at 21:22, Yann E. MORIN <yann.morin.1998@free.fr> wrote:
>
> Etienne, All,
>
> On 2021-03-09 12:33 +0100, Etienne Carriere spake thusly:
> > Include missing unistd.h to support type gid_t in ckteec library
> > of optee-client 3.12.0. This change fixes [1]. The fix has been
> > posted to optee-client forum, see [2].
> >
> > Link: [1] http://autobuild.buildroot.net/results/34b9946e6d59112a7eead304933534ad4739a84c/build-end.log
> > Link: [2] https://github.com/OP-TEE/optee_client/pull/262
> > Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
>
> Applied to master, with the folowing changes:
>
>   - use an actual backport now that upstream applied it
>   - fix typo in title
>
> Thanks.

Thanks for those updates.

Regards,
Etienne

>
> Be carefull if you rebase your tree: the patch was renamed to accomodate
> the upstream commit title.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  ...d-missing-unistd.h-for-group-ID-type.patch | 28 +++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >  create mode 100644 package/optee-client/0001-libckteec-add-missing-unistd.h-for-group-ID-type.patch
> >
> > diff --git a/package/optee-client/0001-libckteec-add-missing-unistd.h-for-group-ID-type.patch b/package/optee-client/0001-libckteec-add-missing-unistd.h-for-group-ID-type.patch
> > new file mode 100644
> > index 0000000000..f47c6ad865
> > --- /dev/null
> > +++ b/package/optee-client/0001-libckteec-add-missing-unistd.h-for-group-ID-type.patch
> > @@ -0,0 +1,28 @@
> > +From 34b992d7e5d4ffaa955ea8f6a3dff7ea789e1def Mon Sep 17 00:00:00 2001
> > +From: Etienne Carriere <etienne.carriere@linaro.org>
> > +Date: Tue, 9 Mar 2021 11:52:32 +0100
> > +Subject: [PATCH] libckteec: add missing unistd.h for group ID type
> > +
> > +Include missing unistd.h to support type gid_t. This change fixes [1].
> > +
> > +Link: [1] http://autobuild.buildroot.net/results/34b9946e6d59112a7eead304933534ad4739a84c/build-end.log
> > +Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
> > +---
> > + libckteec/src/invoke_ta.c | 1 +
> > + 1 file changed, 1 insertion(+)
> > +
> > +diff --git a/libckteec/src/invoke_ta.c b/libckteec/src/invoke_ta.c
> > +index 7c4c5a7..444e099 100644
> > +--- a/libckteec/src/invoke_ta.c
> > ++++ b/libckteec/src/invoke_ta.c
> > +@@ -17,6 +17,7 @@
> > + #include <string.h>
> > + #include <tee_client_api.h>
> > + #include <teec_trace.h>
> > ++#include <unistd.h>
> > +
> > + #include "ck_helpers.h"
> > + #include "invoke_ta.h"
> > +--
> > +2.17.1
> > +
> > --
> > 2.17.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot at busybox.net
> > http://lists.busybox.net/mailman/listinfo/buildroot
>
> --
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
