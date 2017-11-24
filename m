From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 24 Nov 2017 08:38:55 +0200
Subject: [Buildroot] Static IP
In-Reply-To: <CAM27=5g_TOTu__LdjWcUKaMUiLtBxXD-t2g2N9VEx5JN69ZYUA@mail.gmail.com>
References: <CAM27=5g_TOTu__LdjWcUKaMUiLtBxXD-t2g2N9VEx5JN69ZYUA@mail.gmail.com>
Message-ID: <20171124063855.rtkwmk5fadw3rlsd@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Roy,

On Fri, Nov 24, 2017 at 07:05:48AM +0200, Roy Arav wrote:
> I am trying to set static IP on a raspberry pi3 device running buildroot.
> 
> I edited /etc/network/interfaces, using rootfs overlay.
> 
> auto eth0
> allow-hotplug eth0
> iface eth0 inet static
> address 192.168.0.1
> netmask 255.255.255.0
> 
> And still IP address is provided using DHCP/
> 
> Is there anything else to so that I am missing?
> Perhaps a BR2 flag or package that I need to enable?

What is your .config?
Do you have BR2_PACKAGE_IFUPDOWN_SCRIPTS enabled?
What about BR2_PACKAGE_SYSTEMD_NETWORKD?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
