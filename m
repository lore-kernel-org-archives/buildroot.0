From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 15 Sep 2020 15:28:24 +0200
Subject: [Buildroot] Weird ping behaviour
In-Reply-To: <008a01d68b49$9ab9a720$d02cf560$@gmail.com>
References: <008a01d68b49$9ab9a720$d02cf560$@gmail.com>
Message-ID: <20200915152824.4230e780@windsurf.hq.k.grp>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Rob,

On Tue, 15 Sep 2020 12:18:48 +0200
<rob.r374@gmail.com> wrote:

> I'm following this buildroot build and get quite strange behaviour on
> ethernet network.
> 
> Ping response times vary quite a lot and then ping crashes at the end.
> 
> Is there any setting, compile option that would help in this case ?
> 64 bytes from 192.168.0.2: seq=1282 ttl=64 time=152.114 ms
> 
> 64 bytes from 192.168.0.2: seq=1283 ttl=64 time=1001.781 ms
> 
> 64 bytes from 192.168.0.2: seq=1284 ttl=64 time=1.992 ms
> 
> 64 bytes from 192.168.0.2: seq=1285 ttl=64 time=850.570 ms
> 
> [ 2345.039206][    C0] ------------[ cut here ]------------
> 
> [ 2345.044434][    C0] WARNING: CPU: 0 PID: 0 at net/sched/sch_generic.c:448
> dev_watchdog+0x7f/0xe8
> 
> [ 2345.053163][    C0] NETDEV WATCHDOG: eth0 (stm32-dwmac): transmit queue 0
> timed out

This is really not a Buildroot issue, but rather a kernel problem. You
would have this problem regardless of the build system / distribution
you use.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
