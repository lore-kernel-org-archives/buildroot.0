From: Emmanuel BOUAZIZ <ebouaziz@neotion.com>
Date: Mon, 21 Nov 2011 18:36:40 +0100
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <20111121134405.02151918@skate>
References: <4ECA36CB.5010803@neotion.com>	<1321879312.2085.18.camel@sven>
 <20111121134405.02151918@skate>
Message-ID: <4ECA8C28.1020306@neotion.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 11/21/2011 01:44 PM, Thomas Petazzoni wrote:
> Le Mon, 21 Nov 2011 13:41:52 +0100,
> Sven Neumann <s.neumann@raumfeld.com> a ?crit :

> Note that Busybox mdev is also capable of pushing firmwares to the
> kernel. FEATURE_MDEV_LOAD_FIRMWARE needs to be enabled in the Busybox
> configuration, though, and it is not part of the default Busybox
> configuration we have in Buildroot, so it requires manual tweaking.


It worked, thank you very much!

I enabled mdev with loading firmware support and added a S30mdev file in init.d with
        mount -t tmpfs -o size=64k,mode=0755 tmpfs /dev
        echo /sbin/mdev > /proc/sys/kernel/hotplug
        mdev -s


The "irq 7: nobody cared" error is still there though. It was not related after all. Any idea about that ?

regards,

-- 
Emmanuel
