From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 17 May 2020 21:48:39 +0200
Subject: [Buildroot] [PATCH] package/nodejs: expose capability to
 compile host library
In-Reply-To: <072a45c0-b60d-4bc9-cc67-60b2cdffb691@cosmos-ink.net>
References: <20200516235745.3551-1-linus@cosmos-ink.net>
 <20200517093524.66886802@gmx.net>
 <072a45c0-b60d-4bc9-cc67-60b2cdffb691@cosmos-ink.net>
Message-ID: <20200517194839.GW12536@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux, All,

On 2020-05-17 13:31 +0200, Linus spake thusly:
> Hi Peter,
> 
> > Indent should use tabs (instead of spaces)...
> 
> I'm sorry for that. I've overlooked that change (ported it
> from the repository I'm working with).
> I git fixuped it. The fixed patch is below.

Please use git send-email to send patches; the way you sent this new
iteration is not a proper patch, and did not get picked up by patchwork:
    https://patchwork.ozlabs.org/project/buildroot/list/

Besides, there are still issues, see below...

[--SNIP--]
> diff --git a/package/nodejs/Config.in.host b/package/nodejs/Config.in.host
> new file mode 100644
> index 0000000000..2169762b1b
> --- /dev/null
> +++ b/package/nodejs/Config.in.host
> @@ -0,0 +1,5 @@
> +config BR2_PACKAGE_HOST_NODEJS
> +??? bool "host nodejs"
> +??? select BR_PACKAGE_HOST_LIBOPENSSL
> +??? select BR_PACKAGE_HOST_PYTHON
> +??? select BR_PACKAGE_HOST_ZLIB

You used 4 spaces here, when Peter explicitly stated that TABs should be
used. Run "make check-pacakge" to check for these kind of issues.

Also, those three options, BR_PACKAGE_HOST_LIBOPENSSL, BR_PACKAGE_HOST_ZLIB,
and BR_PACKAGE_HOST_PYTHON, do not exist. For host packages, the options
do not exist, unless they have to be visible in the menuconfig, which is
not the case for those three.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
