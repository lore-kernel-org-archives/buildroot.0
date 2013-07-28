From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 28 Jul 2013 15:14:18 +0200
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <51F50077.2060204@zacarias.com.ar>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
 <51DFDA1F.60904@zacarias.com.ar>
 <CAAXf6LWVWj-Z2Od9Zc=QjWELd3_R+5MQ+gTBo=dO-VgFiDoxGg@mail.gmail.com>
 <51F50077.2060204@zacarias.com.ar>
Message-ID: <20130728151418.70891325@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Sun, 28 Jul 2013 08:28:55 -0300, Gustavo Zacarias wrote:
> On 07/28/2013 05:33 AM, Thomas De Schampheleire wrote:
> 
> > So what do we do with this patch?
> > I ask it because it's still marked as 'New' in patchwork:
> > http://patchwork.ozlabs.org/patch/258619/
> > If we agree that it shouldn't be needed, I suggest to mark it as such.
> > If someone can come up with a proven failure scenario, we can still reopen it.
> > 
> > What do you think?
> 
> Proven failure: not building a kernel with buildroot.

Not really an argument: if you select 'devtmpfs' as the /dev management
method and you build your kernel outside of Buildroot, you have to
enable CONFIG_DEVTMPFS + CONFIG_DEVTMPFS_MOUNT, otherwise things won't
work. I don't see what it shouldn't be the same for the hotplug helper
selection: if you're building the kernel with Buildroot, then things are
taken care of automatically, otherwise you're on your own.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
