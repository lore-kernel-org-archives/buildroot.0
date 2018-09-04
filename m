From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Tue, 4 Sep 2018 14:31:46 +0200
Subject: [Buildroot] Problmes with eth0 on Raspberry Pi 3B+
In-Reply-To: <CALtfCQYbuFj8HMLNpk4t=M4FeZF4_=wXjNw7YcQPcN=iGYsR7Q@mail.gmail.com>
References: <CALtfCQYbuFj8HMLNpk4t=M4FeZF4_=wXjNw7YcQPcN=iGYsR7Q@mail.gmail.com>
Message-ID: <1560ed39-cf1b-046e-9855-c35dde778374@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 9/4/18 12:58 PM, Oscar Gomez Fuente wrote:
> auto eth0
> iface eth0 inet manual
>        wait-delay 10
>         pre-up ifconfig eth0 up
>         pre-up /sbin/udhcpc -R -b -p /var/run/udhcpc.eth0.pid -i eth0
>         pre-up /etc/network/nfs_check
>         post-down kill -9 $(cat /var/run/udhcpc.eth0.pid)
>         post-down ifconfig eth0 down

pre-up will run before the wait_iface hook.  For things that are actually
configuring the interface, you should use up.
(and ifconfig is a bid deprecated these days)
