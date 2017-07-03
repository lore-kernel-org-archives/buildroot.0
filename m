From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 3 Jul 2017 11:38:43 +0200
Subject: [Buildroot] [PATCH 1/3 v3] package/ifupdown-scripts: new package
In-Reply-To: <a9d13cba3762cec2139259304cb4a809c6147375.1499006091.git.yann.morin.1998@free.fr>
References: <cover.1499006091.git.yann.morin.1998@free.fr>
 <a9d13cba3762cec2139259304cb4a809c6147375.1499006091.git.yann.morin.1998@free.fr>
Message-ID: <20170703093843.GB3838@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, Thomas, All,

On 2017-07-02 16:35 +0200, Yann E. MORIN spake thusly:
> The ifupdown scripts can be used independently of the init system, be it
> sysv, busybox or systemd; they could even be used when there is no init
> system (i.e. the user is providing his own).
> 
> Currently, those ifupdown scripts are bundled in the skeleton.
> 
> But we soon will have a skeleton specific to systemd, so we would be
> missing those scripts (when systemd-networks is not enabled).
> 
> So, move those scripts to their own package.
> 
> To keep the current behaviour (before it is changed in future commits),
> we make that package default to y, but depend on the default skeleton.
> 
> Instead of being a target-finalize hook, the scripts are installed as
> any other package are, with a package install-target command.
> 
> Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> Cc: Arnout Vandecappelle <arnout@mind.be>
> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
[--SNIP--]
> diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
> new file mode 100644
> index 0000000000..fc58e0bc0a
> --- /dev/null
> +++ b/package/ifupdown-scripts/ifupdown-scripts.mk
> @@ -0,0 +1,57 @@
> +################################################################################
> +#
> +# ifupdown-scripts
> +#
> +################################################################################
> +
> +IFUPDOWN_SCRIPTS_SOURCE =

As seen IRL, this line is not needed.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
