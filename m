From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 17 Jan 2011 20:41:28 +0100
Subject: [Buildroot] [PATCH 03/13] procps: convert to gentargets and
	bump to 3.2.8
In-Reply-To: <1294431182-27793-3-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Fri, 7 Jan 2011 17:12:52 -0300")
References: <1294431182-27793-1-git-send-email-gustavo@zacarias.com.ar>
	<1294431182-27793-3-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87r5cbnwrb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
 Gustavo> ---
 Gustavo>  package/procps/procps-make-3.82.patch |   15 ++++++++
 Gustavo>  package/procps/procps.mk              |   61 ++++++++++-----------------------
 Gustavo>  2 files changed, 33 insertions(+), 43 deletions(-)
 Gustavo>  create mode 100644 package/procps/procps-make-3.82.patch

 Gustavo> diff --git a/package/procps/procps-make-3.82.patch b/package/procps/procps-make-3.82.patch
 Gustavo> new file mode 100644
 Gustavo> index 0000000..b66945c
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/procps/procps-make-3.82.patch
 Gustavo> @@ -0,0 +1,15 @@
 Gustavo> +ps/module.mk depends on vars set up in proc/module.mk, so make sure we always
 Gustavo> +include the .mk files in the right order

Please add authorship / signed-off-by to patches. According to the name,
this patch is to fix an issue with make 3.82, but from reading the
description and fix, it doesn't look version dependent?

 Gustavo> +
 Gustavo> +--- procps-3.2.8/Makefile
 Gustavo> ++++ procps-3.2.8/Makefile
 Gustavo> +@@ -174,7 +174,8 @@
 Gustavo> + # want this rule first, use := on ALL, and ALL not filled in yet
 Gustavo> + all: do_all
 Gustavo> + 
 Gustavo> +--include */module.mk
 Gustavo> ++-include proc/module.mk
 Gustavo> ++-include ps/module.mk
 Gustavo> + 
 Gustavo> + do_all:    $(ALL)
 Gustavo> + 

Otherwise looks good.

-- 
Bye, Peter Korsgaard
