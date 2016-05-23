From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 May 2016 17:26:31 +0200
Subject: [Buildroot] [PATCH] ruby: fix build for nommu
In-Reply-To: <1463667790-2335-1-git-send-email-gustavo@zacarias.com.ar>
References: <1463667790-2335-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20160523172631.1eaa6e79@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 19 May 2016 11:23:10 -0300, Gustavo Zacarias wrote:

> +Subject: [PATCH] process.c: fix rb_spawn_process() for nommu
> +
> +rb_spawn_process() in process.c tries different solutions for when fork
> +and/or spawnv are/aren't available.
> +The last resort when both aren't is to use the system() call which
> +stores the value in the status variable, which isn't declared.
> +
> +Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
> +---
> +Patch status: reported https://bugs.ruby-lang.org/issues/12398

The maintainer asked some questions there, and seemed to suggest that
he might remove support for no-MMU platforms in the future.

In the mean time, patch applied to master.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
