From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2015 22:00:31 +0200
Subject: [Buildroot] [PATCHv2] inadyn: fix init script and default
 config file
In-Reply-To: <1445090722-4297-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1445090722-4297-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <20151017200031.GG3717@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-10-17 16:05 +0200, Thomas Petazzoni spake thusly:
> This commit does a number of fixes to the inadyn package to make it
> work properly "out of the box":
> 
>  * inadyn is installed in /usr/sbin, not /usr/bin, so we fix the path
>    in the init script
> 
>  * Use "printf" for the Starting and Stopping messages, so that the OK
>    / FAIL stay on the same line.
> 
>  * Pass the -q option to the start sequence, since it's passed in the
>    stop sequence.
> 
>  * Fix the configuration file to use an existing dyndns_system and
>    avoid a failure at startup.
> 
>  * Use a variable called ENABLED in /etc/default/inadyn to decide
>    whether to start the service or not. By default, it is not started,
>    as suggested by Gustavo, and an explicit ENABLED="yes" is needed.
> 
>  * Store the PID file in /var/run/inadyn.pid, like we do for all other
>    daemons.
> 
> Cc: Alex Suykov <alex.suykov@gmail.com>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Twice your SoB line.

Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

Yet, still a minor thingy...

[--SNIP--]
> diff --git a/package/inadyn/inadyn.conf b/package/inadyn/inadyn.conf
> index b5877f7..aef5870 100644
> --- a/package/inadyn/inadyn.conf
> +++ b/package/inadyn/inadyn.conf
> @@ -1,11 +1,11 @@
>  # Basic configuration file for inadyn
>  #
>  # /etc/inadyn.conf
> -background
> +pidfile /var/run/inadyn.pid
>  update_period_sec 600 # Check for a new IP every 600 seconds
>  username test		# replace 'test' with your username
>  password test		# replace 'test' with your password
> -dyndns_system dyndns at dyndns.org   # replace w/ your provider
> +dyndns_system default at dyndns.org   # replace w/ your provider
>  
>  #  uncomment the alias statement below to test it on your system
>  alias test.homeip.net

The alias line is not commented, which makes the comment above a bit
confusing...

Regards,
Yann E. MORIN.


-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
