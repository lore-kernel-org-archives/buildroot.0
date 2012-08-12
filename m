From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Aug 2012 18:18:45 +0200
Subject: [Buildroot] [PATCH] python: Use fixed path for sys.executable
In-Reply-To: <1344773165-5165-1-git-send-email-net147@gmail.com>
References: <1344773165-5165-1-git-send-email-net147@gmail.com>
Message-ID: <20120812181845.48a1d8f7@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Sun, 12 Aug 2012 22:06:05 +1000,
Jonathan Liu <net147@gmail.com> a ?crit :

> +Index: Python-2.7.2/Modules/getpath.c
> +===================================================================
> +--- Python-2.7.2.orig/Modules/getpath.c
> ++++ Python-2.7.2/Modules/getpath.c
> +@@ -686,9 +686,7 @@ Py_GetExecPrefix(void)
> + char *
> + Py_GetProgramFullPath(void)
> + {
> +-    if (!module_search_path)
> +-        calculate_path();
> +-    return progpath;
> ++    return "/usr/bin/python";
> + }

The 'python' package builds both a host variant and a target variant.
While this solves the problem for the target variant, it may now create
a problem for the host variant, no? Maybe in practice there is no
problem, I don't know.

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
