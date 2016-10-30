From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 30 Oct 2016 22:12:23 +0100
Subject: [Buildroot] [PATCH v2 2/5] lttng-tools: bump to version 2.8.2
In-Reply-To: <20161030195649.6415-3-eeppeliteloop@gmail.com>
References: <20161030195649.6415-1-eeppeliteloop@gmail.com>
 <20161030195649.6415-3-eeppeliteloop@gmail.com>
Message-ID: <20161030211223.GG18077@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Philippe, All,

On 2016-10-30 15:56 -0400, Philippe Proulx spake thusly:
> The current patches are dropped because they were merged upstream.
> 
> The new patches exist to fix the build with musl. They were submitted on
> the lttng-dev mailing list, but not merged yet, or not merged in v2.8.2.
> 
> LTTng-tools now has its man pages written in AsciiDoc and they get
> converted to troff at build time. This is not needed in a Buildroot
> image anyway.
> 
> The --enable-lttng-ust/--disable-lttng-ust configure options are renamed
> to --with-lttng-ust/--without-lttng-ust in v2.8.
> 
> Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>
[--SNIP--]
> diff --git a/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch b/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch
> new file mode 100644
> index 0000000..eb084aa
> --- /dev/null
> +++ b/package/lttng-tools/0001-Fix-snapshot-del-output-with-name-on-musl.patch

Filename OK (as you wondered about it on your cover letter).

> @@ -0,0 +1,28 @@
> +From: mjeanson at efficios.com Michael Jeanson
> +Date: Wed, 15 Jun 2016 17:18:02 -0400
> +Subject: [lttng-dev] [PATCH lttng-tools 1/6] Fix: snapshot del-output with name on musl

Change the subject to jsut:

    [PATCH] Fix: snapshot del-output with name on musl

> +Some implementations of strtol() like the one in musl will
> +return EINVAL in perror when no valid number was found in
> +the string.
> +
> +Signed-off-by: Michael Jeanson <mjeanson@efficios.com>

Here you would get:

    Signed-off-by: Michael Jeanson <mjeanson@efficios.com>
    [Philippe: grabbed from the mailing list;
        https://lists.lttng.org/pipermail/lttng-dev/2016-June/026192.html
    ]
    Signed-off-by: Philippe Proulx <eeppeliteloop@gmail.com>

Similarly for the other patches....

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
