From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 7 Apr 2013 22:42:06 +0200
Subject: [Buildroot] [PATCH v2 2/7] arch: toolchain: Introduce target
 CPU revision.
In-Reply-To: <1364550643-11793-2-git-send-email-sonic.adi@gmail.com>
References: <1364550643-11793-1-git-send-email-sonic.adi@gmail.com>
 <1364550643-11793-2-git-send-email-sonic.adi@gmail.com>
Message-ID: <20130407224206.5948990b@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Sonic Zhang,

On Fri, 29 Mar 2013 17:50:38 +0800, Sonic Zhang wrote:

> +config BR2_GCC_TARGET_CPU_REVISION
> +	string "Target CPU revision"
> +	help
> +	  Specify target cpu revision which is passed to compiler as a parameter.

I think this line is slightly too long, it should be wrapped. And I
would like more details here in the help text. Maybe something like:

	Specify a target CPU revision, which will be appended to the
	value of the -mcpu option. For example, if the selected CPU is
	bf607, and then selected CPU revision is "r2", then gcc will
	receive the -mcpu=bf607-r2 option.

Other than this detail, looks good to me.

Thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
