From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sun, 28 Jul 2013 10:38:06 -0300
Subject: [Buildroot] [PATCH] busybox: register mdev as hotplug helper
In-Reply-To: <20130728151418.70891325@skate>
References: <1373574654-32427-1-git-send-email-gustavo@zacarias.com.ar>
 <CAAXf6LVSOCLS54uAwJHH6DwenrexRY=17v_PoOe_KTnmWWTvWg@mail.gmail.com>
 <51DFDA1F.60904@zacarias.com.ar>
 <CAAXf6LWVWj-Z2Od9Zc=QjWELd3_R+5MQ+gTBo=dO-VgFiDoxGg@mail.gmail.com>
 <51F50077.2060204@zacarias.com.ar> <20130728151418.70891325@skate>
Message-ID: <51F51EBE.4000701@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/28/2013 10:14 AM, Thomas Petazzoni wrote:

>> Proven failure: not building a kernel with buildroot.
> 
> Not really an argument: if you select 'devtmpfs' as the /dev management
> method and you build your kernel outside of Buildroot, you have to
> enable CONFIG_DEVTMPFS + CONFIG_DEVTMPFS_MOUNT, otherwise things won't
> work. I don't see what it shouldn't be the same for the hotplug helper
> selection: if you're building the kernel with Buildroot, then things are
> taken care of automatically, otherwise you're on your own.

Then we should just ditch the device managment options if the user isn't
building a kernel?
Double-edged knife there :)
For mdev that can be solved, at worst it'll be an (almost) no-op,
devtmpfs is another story.
Regards.
