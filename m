From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Tue, 5 Sep 2017 11:01:17 +0200
Subject: [Buildroot] [PATCH] package/netplug: init script create needed
 lock directory
In-Reply-To: <20170905083917.8625-1-corjon.j@ecagroup.com>
References: <20170905083917.8625-1-corjon.j@ecagroup.com>
Message-ID: <20170905090117.GA3713@scaer>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Julien, All,

On 2017-09-05 10:39 +0200, Julien Corjon spake thusly:
> Init script use /var/lock/subsys/netplugd but directory
> /var/lock/subsys can be missing.
> 
> Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
> ---
>  package/netplug/S29netplug | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/package/netplug/S29netplug b/package/netplug/S29netplug
> index 88f933d556..fe63c1b79a 100755
> --- a/package/netplug/S29netplug
> +++ b/package/netplug/S29netplug
> @@ -11,6 +11,9 @@
>  
>  # Copyright 2003 Key Research, Inc.
>  
> +# Create needed directories
> +[ -d /var/lock/subsys ] || mkdir -p /var/lock/subsys

mkdir -p will only create what is needed, so if the directory already exists,
it will do nothing, and will not whine either. So, don't test, just mkdir.

Regards,
Yann E. MORIN.

>  # Source function library.
>  if [ -f /etc/init.d/functions ]; then
>  	. /etc/init.d/functions
> -- 
> 2.11.0
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
