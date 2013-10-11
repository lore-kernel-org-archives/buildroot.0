From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 11 Oct 2013 23:17:43 +0200
Subject: [Buildroot] [PATCH 3/3] weston: add help text for compositor
 backends
In-Reply-To: <1381525213-14034-3-git-send-email-arnout@mind.be>
References: <1381525213-14034-1-git-send-email-arnout@mind.be>
 <1381525213-14034-3-git-send-email-arnout@mind.be>
Message-ID: <20131011211743.GB29458@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2013-10-11 23:00 +0200, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> ---
>  package/weston/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/weston/Config.in b/package/weston/Config.in
> index ea0e87e..4322aaa 100644
> --- a/package/weston/Config.in
> +++ b/package/weston/Config.in
> @@ -42,8 +42,12 @@ config BR2_PACKAGE_WESTON_RPI
>  	depends on BR2_TOOLCHAIN_HAS_THREADS    # rpi-userland
>  	select BR2_PACKAGE_RPI_USERLAND
>  	select BR2_PACKAGE_WESTON_HAS_COMPOSITOR
> +	help
> +	  Compositor backend for the Raspberry Pi.
>  
>  config BR2_PACKAGE_WESTON_FBDEV
>  	bool "fbdev compositor"
> +	help
> +	  Compositor backend for the Linux framebuffer.

I am not sure adding such terse help entries is helpfull.

Surely "RPi compositor" is no less explicit than "Compositor backend for
the Raspberry Pi". Arguably, the prompt oculd be changed to "Raspberry Pi
compositor", which would be as much descriptive as the help entry.

Ditto for fbdev: the prompt is explicit enough, the help entry does not
add any value.

If I have to read a help entry, I expect to find more information than
the prompt provides. Just repeating the prompt (even in other trerms) is
just deceiving IMHO.

So, either we provide hepl entries that actually provide information
that can not fit in the prompt, or we do not provide help entries at
all.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
