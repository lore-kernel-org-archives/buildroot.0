From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 22 Jan 2018 12:53:04 +0200
Subject: [Buildroot] [PATCH 1/1] open-lldp: add patch to remove pid_t
 error
In-Reply-To: <20180122103001.26798-1-laurent_pubs@yahoo.com>
References: <20180122103001.26798-1-laurent_pubs@yahoo.com>
Message-ID: <20180122105304.njwgtiky6nzr2wme@sapphire.tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Laurent,

On Mon, Jan 22, 2018 at 11:30:01AM +0100, Laurent Charpentier wrote:
> Added #include <sys/types.h> to fix unknown type 'pid_t' errors.

Please add a reference to an autobuild failure like

  http://autobuild.buildroot.net/results/c18/c18969411e7b2aa12e283831042d75427d2cebd9/

> 
> Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>
> ---
>  .../open-lldp/0004-fixed-unknown-type-pid_t.patch  | 41 ++++++++++++++++++++++
>  1 file changed, 41 insertions(+)
>  create mode 100644 package/open-lldp/0004-fixed-unknown-type-pid_t.patch
> 
> diff --git a/package/open-lldp/0004-fixed-unknown-type-pid_t.patch b/package/open-lldp/0004-fixed-unknown-type-pid_t.patch
> new file mode 100644
> index 0000000000..2d3b9148e0
> --- /dev/null
> +++ b/package/open-lldp/0004-fixed-unknown-type-pid_t.patch
> @@ -0,0 +1,41 @@
> +From 41e9e6b5aa13d65480cc960a7f15f97d74d64090 Mon Sep 17 00:00:00 2001
> +From: Laurent Charpentier <laurent_pubs@yahoo.com>
> +Date: Mon, 22 Jan 2018 10:49:45 +0100
> +Subject: [PATCH] fixed unknown type pid_t
> +
> +Fixed 'unknown type pid_t' gcc compile error in dcbtool_cmds.c and
> +lldptool_cmds.c
> +
> +Signed-off-by: Laurent Charpentier <laurent_pubs@yahoo.com>

What is the upstream status of this patch?

> +---
> + dcbtool_cmds.c  | 1 +
> + lldptool_cmds.c | 1 +
> + 2 files changed, 2 insertions(+)
> +
> +diff --git a/dcbtool_cmds.c b/dcbtool_cmds.c
> +index a5cd0fe..ee5c144 100644
> +--- a/dcbtool_cmds.c
> ++++ b/dcbtool_cmds.c
> +@@ -27,6 +27,7 @@
> + #include <stdlib.h>
> + #include <stdio.h>
> + #include <ctype.h>
> ++#include <sys/types.h>
> + #include "clif.h"
> + #include "dcbtool.h"
> + #include "lldp_dcbx_cmds.h"
> +diff --git a/lldptool_cmds.c b/lldptool_cmds.c
> +index daef8c8..c793e34 100644
> +--- a/lldptool_cmds.c
> ++++ b/lldptool_cmds.c
> +@@ -27,6 +27,7 @@
> + #include <stdio.h>
> + #include <stdlib.h>
> + #include <ctype.h>
> ++#include <sys/types.h>
> + #include "clif.h"
> + #include "dcb_types.h"
> + #include "lldptool.h"

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
