From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 16 Oct 2014 18:54:25 +0200
Subject: [Buildroot] [PATCH] inadyn: bump to version 1.99.11
In-Reply-To: <1413476733-3580-1-git-send-email-gustavo@zacarias.com.ar>
References: <1413476733-3580-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <20141016185425.7ea20c68@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Thu, 16 Oct 2014 13:25:33 -0300, Gustavo Zacarias wrote:
> Update initscript for the /usr/sbin -> /usr/bin change which is the
> default installation directory now that it's using autotools infra.
> Also add hash file.

And make the installation of the default config file conditional.


>  case "$1" in
>          start)
> -                echo "Starting inadyn."
> -                start-stop-daemon -S -x /usr/sbin/inadyn
> +                echo "Starting inadyn: "
> +                start-stop-daemon -S -x /usr/bin/inadyn
> +		[ $? == 0 ] && echo "OK" || echo "FAIL"
>                  ;;
>          stop)
> -                echo  "Stopping inadyn."
> -                start-stop-daemon -q -K -x /usr/sbin/inadyn
> +                echo  "Stopping inadyn: "
> +                start-stop-daemon -q -K -x /usr/bin/inadyn
> +		[ $? == 0 ] && echo "OK" || echo "FAIL"

There's a mix of tabs and spaces being used in the added lines.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
