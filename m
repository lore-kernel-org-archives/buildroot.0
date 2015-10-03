From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 3 Oct 2015 16:47:32 +0100
Subject: [Buildroot] [PATCH] package/skeleton: add a startup script to
 wait for slow network interfaces
In-Reply-To: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
References: <1443879105-3036-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151003164732.28d042e6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Oct 2015 14:31:45 +0100, Yann E. MORIN wrote:

> +    printf "Waiting for interface %s to appear" "${IF}"
> +    wait=${WAIT_DELAY}
> +    while [ ${wait} -gt 0 ]; do
> +        if [ -e "/sys/class/net/${IF}" ]; then
> +            printf " yes\n"
> +            return 0
> +        fi
> +        sleep 1
> +        printf "."
> +        : $((wait--))
> +    done

One thing that I really like in Buildroot is that by default, it
generates you a system that boots really fast. People often don't have
to do anything special with Buildroot to make it boot fast. So having a
shell script that is installed by default and does a "sleep 1" in a
loop is not very nice :-/

Though I agree that it will only slow the boot on systems where the
network interfaces are not available immediately at boot time.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
