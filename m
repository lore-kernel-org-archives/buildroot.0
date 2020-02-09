From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 09:48:02 +0100
Subject: [Buildroot] [PATCH] package/Config.in: fix make failure by
 removing gstreamer/Config.in
In-Reply-To: <20200209083651.117868-1-giulio.benetti@benettiengineering.com>
References: <20200209083651.117868-1-giulio.benetti@benettiengineering.com>
Message-ID: <20200209084802.GE23769@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Giulio, All,

On 2020-02-09 09:36 +0100, Giulio Benetti spake thusly:
> After commit:
> https://git.buildroot.net/buildroot/commit/?id=fb49c7a26182f9d48f8283e7328fddc216962c94
> gstreamer entry in package/Config.in was left behind resulting in every
> make call to fail. So let's remove orphaned gstreamer entry from
> package/Config.in

How did we even miss that to begin with? Damn...

> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks!

Regards,
Yann E. MORIN.

> ---
>  package/Config.in | 1 -
>  1 file changed, 1 deletion(-)
> 
> diff --git a/package/Config.in b/package/Config.in
> index 72630d4ee9..dfa3f34b9d 100644
> --- a/package/Config.in
> +++ b/package/Config.in
> @@ -26,7 +26,6 @@ menu "Audio and video applications"
>  	source "package/fluid-soundfont/Config.in"
>  	source "package/fluidsynth/Config.in"
>  	source "package/gmrender-resurrect/Config.in"
> -	source "package/gstreamer/Config.in"
>  	source "package/gstreamer1/Config.in"
>  	source "package/jack1/Config.in"
>  	source "package/jack2/Config.in"
> -- 
> 2.20.1
> 

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
