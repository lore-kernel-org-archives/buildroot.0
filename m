From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Wed, 24 Oct 2018 16:22:19 +0200
Subject: [Buildroot] iptable configuration
In-Reply-To: <CAJ2oMh+J4qTm_L575-UyehbH+6oCuLJygZ_N6YLJfo5OsUAw-w@mail.gmail.com>
References: <CAJ2oMh+J4qTm_L575-UyehbH+6oCuLJygZ_N6YLJfo5OsUAw-w@mail.gmail.com>
Message-ID: <CALtfCQaqxQ1uzbH1_JhgVvGw7HRYmZfvrVDMv3GRQ6Ra1b-_wg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Ranra,

> Is there a configuration for iptables filter, or should we manually
> add it to a new init script ? (I have a build image from buildroot,
> but didn't find iptable config file in rootfs or in menuconfig)

I had the same problem. You can find how to make some rules in this
link [1], and then you will have to save the configuration file with
this command:

$ iptables-save > /etc/iptables.rules

You can restore the configuration file with this other command:

$  iptables-restore < /etc/iptables.rules

But YES, buildroot doesn't make a default configuration file and you
will have to load it with a init script made on your own.


Best regards.

[1] https://crybit.com/iptables-rules-for-icmp/
