From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Oct 2016 16:50:16 +0100
Subject: [Buildroot] [PATCH 1/5] lttng-libust: bump to version 2.8.1
In-Reply-To: <20161029180339.24535-2-eeppeliteloop@gmail.com>
References: <20161029180339.24535-1-eeppeliteloop@gmail.com>
 <20161029180339.24535-2-eeppeliteloop@gmail.com>
Message-ID: <20161030165016.06b121eb@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 29 Oct 2016 14:03:35 -0400, Philippe Proulx wrote:
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

It would be great to not have an empty commit log here. In fact, you
included a lot of information in your cover letter, but the cover
letter contents is not part of any Git commit, so it isn't present in
the Git history.

So please transfer more details about the different patches in the
description of each patch. Thanks.

> ---
>  ...lf.c-define-NT_GNU_BUILD_ID-if-not-define.patch | 31 ++++++++++++++++++++++
>  package/lttng-libust/lttng-libust.hash             | 12 +++++----
>  package/lttng-libust/lttng-libust.mk               | 10 +++----
>  3 files changed, 42 insertions(+), 11 deletions(-)
>  create mode 100644 package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch

This patch looks good, but I'm going to wait for the entire series to
be ready before applying them. See below one question, though.

> diff --git a/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch b/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
> new file mode 100644
> index 0000000..7fc2148
> --- /dev/null
> +++ b/package/lttng-libust/0001-lttng-ust-elf.c-define-NT_GNU_BUILD_ID-if-not-define.patch
> @@ -0,0 +1,31 @@
> +From d400314757a8d5d52bd5722d263bfd5886bb6595 Mon Sep 17 00:00:00 2001
> +From: Philippe Proulx <eeppeliteloop@gmail.com>
> +Date: Sat, 29 Oct 2016 13:32:57 -0400
> +Subject: [PATCH] lttng-ust-elf.c: define NT_GNU_BUILD_ID if not defined
> +
> +On uClibc, NT_GNU_BUILD_ID is not defined, so we define it
> +manually in this case.

Did you submit this patch upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
