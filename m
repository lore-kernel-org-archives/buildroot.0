From: Michael S. Zick <minimod@morethan.org>
Date: Mon, 21 Nov 2011 12:10:26 -0600
Subject: [Buildroot] help needed with realtek gigabit network adapter
In-Reply-To: <4ECA8C28.1020306@neotion.com>
References: <4ECA36CB.5010803@neotion.com> <20111121134405.02151918@skate>
 <4ECA8C28.1020306@neotion.com>
Message-ID: <201111211210.30736.minimod@morethan.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon November 21 2011, Emmanuel BOUAZIZ wrote:
> 
> On 11/21/2011 01:44 PM, Thomas Petazzoni wrote:
> > Le Mon, 21 Nov 2011 13:41:52 +0100,
> > Sven Neumann <s.neumann@raumfeld.com> a ?crit :
> 
> > Note that Busybox mdev is also capable of pushing firmwares to the
> > kernel. FEATURE_MDEV_LOAD_FIRMWARE needs to be enabled in the Busybox
> > configuration, though, and it is not part of the default Busybox
> > configuration we have in Buildroot, so it requires manual tweaking.
> 
> 
> It worked, thank you very much!
> 
> I enabled mdev with loading firmware support and added a S30mdev file in init.d with
>         mount -t tmpfs -o size=64k,mode=0755 tmpfs /dev
>         echo /sbin/mdev > /proc/sys/kernel/hotplug
>         mdev -s
> 
> 
> The "irq 7: nobody cared" error is still there though. 
> It was not related after all. Any idea about that ? 
> 

That one is usually indicating that a kernel driver is not present
or that the driver that is present, is not optioned (or written) to
claim the irq.

Find what hardware is diddling irq 7 and then check you kernel config.

Mike
> regards,
> 
