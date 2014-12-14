From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Dec 2014 00:17:08 +0100
Subject: [Buildroot] [PATCH 1/1]  package/gdb: fix shared-only build
In-Reply-To: <1418597244-31844-1-git-send-email-romain.naour@openwide.fr>
References: <1418597244-31844-1-git-send-email-romain.naour@openwide.fr>
Message-ID: <20141214231708.GI4121@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Romain, All,

On 2014-12-14 23:47 +0100, Romain Naour spake thusly:
>  When --disable-static is given to the gdb's main configure script,
>  it also disable the static build of bundled libraries like bfd, readline
>  and opcodes, which must be build statically.
> 
>  Fixes:
>  http://autobuild.buildroot.net/results/219/21979e730dca1fce5bdda9a4c7fad4485e788866/
>  http://autobuild.buildroot.net/results/c10/c1096d0bd22de5c6feba848f743601ad0416a944/
>  http://autobuild.buildroot.net/results/d8a/d8a5bcc7fa374fb0c916a9d0f33ef283109cb404/
>  http://autobuild.buildroot.net/results/22a/22a86d0f1df0fc4698c0f734f3d659e6317404a4/
>  http://autobuild.buildroot.net/results/404/404e61e5c30040ee5756f4b5839149dca38660d4/
> 
> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

[--SNIP--]
> diff --git a/package/gdb/0003-libopcodes-force-static-build.patch b/package/gdb/0003-libopcodes-force-static-build.patch
> new file mode 100644
> index 0000000..1f1bd09
> --- /dev/null
> +++ b/package/gdb/0003-libopcodes-force-static-build.patch
> @@ -0,0 +1,80 @@
> +From b82d3918cc7dd4c758848ba596f6577c5486ba48 Mon Sep 17 00:00:00 2001
> +From: Romain Naour <romain.naour@openwide.fr>
> +Date: Sun, 14 Dec 2014 17:42:15 +0100
> +Subject: [PATCH 3/3] libopcodes: force static build
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +When --disable-static is given to the main configure script,
> +it also disable the static build of bundled libraries like opcodes.
> +
> +Fixes:
> +No rule to make target ? ../opcodes/libopcodes.a ?, needed by ? gdb ?.

You forgot to SoB that patch.

Otherwise, I do not have much to say about that. That will be need
build-testing, but I see no reason that would be bad. But it's too late
for me to do the tests now. ;-) I'll do that tomorrow, unless someone
beats me to it and this gets applied, so (with your SoB added):

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
