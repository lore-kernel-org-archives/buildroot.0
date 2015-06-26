From: Arthur LAMBERT <lambertarthur22@gmail.com>
Date: Fri, 26 Jun 2015 14:24:08 +0200
Subject: [Buildroot] [PATCH v2 1/1] board: add support for Warpboard
In-Reply-To: <20150625223823.GI4178@free.fr>
References: <1434988018-16391-1-git-send-email-lambertarthur22@gmail.com>
 <558B254C.2090606@mind.be> <20150625085428.GA3400@arthur-dreem>
 <558C800F.5030702@mind.be> <20150625223823.GI4178@free.fr>
Message-ID: <20150626122408.GA20530@arthur-dreem>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le Friday 26 Jun 2015 ? 00:38:23 (+0200), Yann E. MORIN a ?crit :
> Arnout, Arthur, All,
> 
> On 2015-06-26 00:26 +0200, Arnout Vandecappelle spake thusly:
> > On 06/25/15 10:54, Arthur LAMBERT wrote:
> > > Arnout, All,
> > > 
> > > Le Wednesday 24 Jun 2015 ? 23:46:52 (+0200), Arnout Vandecappelle a ?crit :
> > >>> +
> > >>> +Enable bluetooth
> > >>> +================
> > >>> +hciattach /dev/ttymxc4 any
> > >>> +hciconfig hci0 up
> > >>> +
> > >>> +Enable Wifi
> > >>> +==========
> > >>> +modprobe brcmfmac
> > >>> +ifconfig wlan0 up
> > >>
> > >>  To do something useful, you'll also need a wpa-supplicant I guess...
> > >>
> > >>  Since you anyway have a rootfs overlay, you could add init scripts to start
> > >> wifi and bluetooth. We don't usually do that, but I think it would be a good idea.
> > > 
> > > In fact I need bluez-util (to be able to run hciattach command also). And yes I also need wpa_supplicant for wifi.
> > > So ok I will enable these two packages and add init script
> > 
> >  Question for the other BR developers (especially Peter): do you agree it's a
> > good idea to make a non-minimal defconfig that includes bluez and wpa_supplicant?
> 
> Our board defconfig files are ususally just enough to bring up the board
> and get a shell in there. If network is wired, then a dhcp client is OK
> (usually udhcpc from busybox).
> 
> Everything (bluez and wpa-supplicant included) else is out of scope for
> a defconfig, IMHO.
> 
> One case where I'd be inclined to accept more than the above is a
> full-wireless device (like the soon-to-come-I-hope 96boards stuff).
> But since wpa-supplicant needs configuration that we can't provide
> (SSID and key), I don't see the point of adding it to the defconfig.
> 
> However, we've decided to accept "demo" defconfigs, which can be packed
> with more features than a simple board defconfig. We haven't had any
> single such demo defconfig submitted so far.
> 
> Still, even if we accept demo defconfigs, I stil think we should have a
> small board defconfig file before we get a demo.
> 

Ok I will no keep init script for bluetooth and wifi and will remove wpa/bluez stuff.


> Regards,
> Yann E. MORIN.

Regards,
Arthur.

> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
