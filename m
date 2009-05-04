From: Michael Roth <mroth@nessie.de>
Date: Mon, 04 May 2009 11:04:17 +0200
Subject: [Buildroot] [PATCH] Add a .gitignore file
In-Reply-To: <49FEE4470200007000014C15@gwia.alliedtelesyn.co.nz>
References: <49FEE4470200007000014C15@gwia.alliedtelesyn.co.nz>
Message-ID: <49FEAF91.8050403@nessie.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> diff --git a/.gitignore b/.gitignore
> new file mode 100644
> index 0000000..191e148
> --- /dev/null
> +++ b/.gitignore
> @@ -0,0 +1,16 @@
> +build_*
> +project_*
> +toolchain_*
> +binaries/*
> +.auto.deps
> +.config.cmd
> +.config.old

Add leading slashes to match only in top level dir:

/build_*
/project_*
/toolchain_*
/binaries
/.auto.deps
/.config.cmd
/.config.old


> +package/config/.depend
> +package/config/*.o
> +package/config/lxdialog/*.o

Maybe two global patterns:

*.o
*.depend
