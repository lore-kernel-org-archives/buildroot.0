From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 19 Nov 2014 23:14:03 +0100
Subject: [Buildroot] [PATCH 3/9] manual: Rework makedevs syntax
In-Reply-To: <1416068964-22529-3-git-send-email-maxime.hadjinlian@gmail.com>
References: <1416068964-22529-1-git-send-email-maxime.hadjinlian@gmail.com>
 <1416068964-22529-3-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <20141119221403.GE3779@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Maxime, All,

On 2014-11-15 17:29 +0100, Maxime Hadjinlian spake thusly:
> State that it should be a space separated list and fix the example.
> Also reduce the number of dash used to 4.
> 
> Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
> ---
>  docs/manual/makedev-syntax.txt | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
> 
> diff --git a/docs/manual/makedev-syntax.txt b/docs/manual/makedev-syntax.txt
> index 2fd7b59..22d4c10 100644
> --- a/docs/manual/makedev-syntax.txt
> +++ b/docs/manual/makedev-syntax.txt
> @@ -11,13 +11,14 @@ create and how to create them, in order to avoid calls to mknod.
>  This syntax is derived from the makedev utility, and more complete
>  documentation can be found in the +package/makedevs/README+ file.
>  
> -It takes the form of a line for each file, with the following layout:
> +It takes the form of a space separated list of fields, one file per
> +line; the fields are:
>  
>  |===========================================================
>  |name |type |mode |uid |gid |major |minor |start |inc |count
>  |===========================================================
>  
> -There are a few non-trivial blocks here:
> +There are a few non-trivial blocks:
>  
>  - +name+ is the path to the file you want to create/modify
>  - +type+ is the type of the file, being one of:
> @@ -35,22 +36,23 @@ There are a few non-trivial blocks here:
>  
>  Let's say you want to change the permissions of a given file; using
>  this syntax, you will need to put:
> --------------------------------------------------------------------
> -/usr/bin/foobar	f	644	0	0	-	-	-	-	-
> --------------------------------------------------------------------
> +
> +----
> +/usr/bin/foobar	f 644 0 0 - - -	- -

There's still a TAB between 'foobar' and 'f'

I usually set tabstop=256 in vim so tabs really stand out. ;-)

Otherwise, OK. So, with this fixed:

    Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> +----
>  
>  On the other hand, if you want to create the device file +/dev/hda+
>  and the corresponding 15 files for the partitions, you will need for
>  +/dev/hda+:
>  
> --------------------------------------------------------------------
> -/dev/hda	b	640	0	0	3	0	0	0	-
> --------------------------------------------------------------------
> +----
> +/dev/hda b 640 0 0 3 0 0 0 -
> +----
>  
>  and then for device files corresponding to the partitions of
>  +/dev/hda+, +/dev/hdaX+, +X+ ranging from 1 to 15:
>  
> --------------------------------------------------------------------
> -/dev/hda	b	640	0	0	3	1	1	1	15
> --------------------------------------------------------------------
> +----
> +/dev/hda b 640 0 0 3 1 1 1 15
> +----
>  
> -- 
> 2.1.3
> 
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
