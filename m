From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 4 Feb 2016 00:02:08 +0100
Subject: [Buildroot] [PATCH v2 3/5] COPYING: add exception about patch
	licensing
In-Reply-To: <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
References: <1454365196-26319-1-git-send-email-luca@lucaceresoli.net>
 <1454365196-26319-4-git-send-email-luca@lucaceresoli.net>
Message-ID: <20160203230208.GB3428@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Luca, All,

On 2016-02-01 23:19 +0100, Luca Ceresoli spake thusly:
> Several people have been asking what is the license of the patches
> provided by Buildroot. COPYING is the authoritative place to state it.
> 
> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>

> ---
> Changes v1 -> v2:
>  - Rewrite it almost entirely (Arnout, Thomas).
> ---
>  COPYING | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/COPYING b/COPYING
> index d511905..3596777 100644
> --- a/COPYING
> +++ b/COPYING
> @@ -1,3 +1,11 @@
> +Except for the patches provided for packages, Buildroot is licensed
> +under the GNU General Public License, version 2.

There a gotcha here. The manual states, in chapter 12.3:

    Buildroot [is] released under the GNU General Public License,
    version 2 or (at your option) any later version.

So, we have to clarify: is it GPLv2 or GPLV2+ ?

It's too late today for me to go digging; I'll do that tomorrow. Just
rmind me before the end of the week if there's not feedback from my part
on this topic.

Until then, NAK.

> +Patches provided by Buildroot for packages are released under the same
> +license as the software that they modify.

Here's an alternative proposal, to replace both sentences:

    Buildroot comes with its own license, reproduced below.

    Buildroot also bundles patch files, which are applied to the
    sources of the various packages. Those patches are not covered
    by the license of Buildroot. See those individual packages for
    their license (running 'make legal-info' after your build may
    help).

Regards,
Yann E. MORIN.

> +-----------------------------------------------------------------
> +
>  		    GNU GENERAL PUBLIC LICENSE
>  		       Version 2, June 1991
>  
> -- 
> 1.9.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
