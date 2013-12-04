From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 4 Dec 2013 23:22:06 +0100
Subject: [Buildroot] [PATCHv5 4/5] docs/manual: add explanations about
 BR2_EXTERNAL
In-Reply-To: <1386183373-17611-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1386183373-17611-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1386183373-17611-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20131204222206.GF3332@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-12-04 19:56 +0100, Thomas Petazzoni spake thusly:
> This commit updates the manual to add details on how to use the
> BR2_EXTERNAL feature.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

On its own, this patch breaks the manual generation, which is fixed by
the collowing patch. Maybe you could either switch them, or squash them
together (I'd prefer the first option).

Otherwise, see comments below...

[--SNIP--]
> +Then, have a +BR2_EXTERNAL/external.mk' file that looks like:

Incorrect formatting.

> +-----

I would add a leading line (but could well lie without it) like:

$(BR2_EXTERNAL)/
+-- Config.in
+-- external.mk
[...]

> ++-- Config.in
> ++-- external.mk
> ++-- board/
> +|   +-- <boardname>/
> +|       +-- linux.config
> +|       +-- overlay/
> +|           +-- etc/
> +|               +-- <some file>
> ++-- configs/
> +|   +-- <boardname>_defconfig
> ++-- package/
> +    +-- package1/
> +    |    +-- Config.in
> +    |    +-- package1.mk
> +    +-- package2/
> +        +-- Config.in
> +        +-- package2.mk
> +------

With the formatting fixed, you can add my:

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Not Tested-by, since the build breaks without the next patch, even
though the manual gets generated OK in this case.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
