From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Fri, 21 Sep 2018 00:06:11 +0200
Subject: [Buildroot] [PATCH v2 1/1] check-package: detect the use of ${}
 in .mk files
In-Reply-To: <20180709015647.6619-1-ricardo.martincoski@gmail.com>
References: <20180708051701.3153-5-ricardo.martincoski@gmail.com>
 <20180709015647.6619-1-ricardo.martincoski@gmail.com>
Message-ID: <20180921000611.055be497@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun,  8 Jul 2018 22:56:47 -0300, Ricardo Martincoski wrote:
> And warn to use $() instead.
> For examples see [1] and [2].
> 
> In the regexp, search for ${VARIABLE} but:
>  - ignore comments;
>  - ignore variables to be expanded by the shell "$${}".
> 
> [1] http://lists.busybox.net/pipermail/buildroot/2018-July/225211.html
> [2] https://github.com/buildroot/buildroot/commit/36305380db1312442623128689fe5067d9058381
> 
> Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> Cc: Yann E. MORIN <yann.morin.1998@free.fr>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
> Changes v1 -> v2:
>   - use \w instead of [A-Z0-9_] because we do have lowercase make
>     variables and macros, and we want to catch them as well;  (suggested
>     by Arnout)
>   - collect review tag.

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
