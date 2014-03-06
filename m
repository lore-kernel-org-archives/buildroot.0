From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 6 Mar 2014 18:13:31 +0100
Subject: [Buildroot] [PATCH 1/2] system/skeleton: add mail group
In-Reply-To: <1394124890-29254-2-git-send-email-luca@lucaceresoli.net>
References: <1394124890-29254-1-git-send-email-luca@lucaceresoli.net>
 <1394124890-29254-2-git-send-email-luca@lucaceresoli.net>
Message-ID: <20140306171331.GC3625@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2014-03-06 17:54 +0100, Luca Ceresoli spake thusly:
> ---
>  system/skeleton/etc/group | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/system/skeleton/etc/group b/system/skeleton/etc/group
> index 864d1db..85a1fa2 100644
> --- a/system/skeleton/etc/group
> +++ b/system/skeleton/etc/group
> @@ -6,6 +6,7 @@ adm:x:4:
>  tty:x:5:
>  disk:x:6:
>  lp:x:7:
> +mail:x:8:
>  kmem:x:9:
>  wheel:x:10:root
>  cdrom:x:11:

There is no reason to add the 'mail' group to the default skeleton. If
it is missing, 'mkuser' is expected to create it (if not, that's a bug.)

So the EXIM_USER in your second patch should be enough.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
