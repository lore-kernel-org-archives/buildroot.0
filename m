From: Roy Arav <roy.arav@shieldiot.io>
Date: Mon, 27 Nov 2017 14:50:30 +0200
Subject: [Buildroot] Static IP
In-Reply-To: <20171126193811.64fkhpxhc3of6cwj@tarshish>
References: <CAM27=5g_TOTu__LdjWcUKaMUiLtBxXD-t2g2N9VEx5JN69ZYUA@mail.gmail.com>
 <20171124063855.rtkwmk5fadw3rlsd@tarshish>
 <CAM27=5ijTMYOyBmy1r7k9ByGQ6_tZhGkGWyfd4jG98ijhAffxQ@mail.gmail.com>
 <20171126193811.64fkhpxhc3of6cwj@tarshish>
Message-ID: <CAM27=5gEznPh9FTg1Y4vdEYPNAhXR-cZV5gw9KSFZwF6iLwhHA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks Baruch,

As you suggested - I removed the attribute "--disable-ifupdown" from
network-manager.mk.
Still same results:
[   32.982121] NetworkManager[286]: <warn>  [1478193422.8681] settings:
could not load plugin 'ifupdown' from file
'/usr/lib/NetworkManager/libnm-settings-plugin-ifupdown.so': No such file
or directory


Thanks


On Sun, Nov 26, 2017 at 9:38 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Roy,
>
> Please keep the list on Cc so that everyone can benefit from your
> experience.
>
> On Sun, Nov 26, 2017 at 02:22:44PM +0200, Roy Arav wrote:
> > I enabled BR2_PACKAGE_IFUPDOWN_SCRIPTS as you suggested,
> > and now I get this warning: 34.193270] NetworkManager[272]: <warn>
> > [1478193422.9602] settings: could not load plugin 'ifupdown' from file
> > '/usr/lib/NetworkManager/libnm-settings-plugin-ifupdown.so': No such
> file
> > or directory
> >
> > Any ideas how to solve this thing? (sorry if I seem clue-less, I am new
> to
> > buildroot...)
>
> This is most likely because we currently pass --disable-ifupdown to the
> configure script unconditionally. This has been so since commit
> 52c7f43fdefbe7
> (network-manager: bump to 0.9.8.0). Maybe Thomas, the author of said
> commit,
> can explain the reason for that.
>
> In case --enable-ifupdown does not increase the target size significantly
> (relatively speaking), then a patch enable ifupdown would probably be
> accepted.
>
> > Please see the entire.config.
>
> [skipped config fragments containing potentially sensitive information]
>
> Do you use all these fragments to generate a unified .config?
>
> Please send the minimal .config that exhibits your issue. Minimizing the
> .config further with 'make savedefconfig' would be nice as well.
>
> baruch
>
> > On Fri, Nov 24, 2017 at 8:38 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> > >
> > > On Fri, Nov 24, 2017 at 07:05:48AM +0200, Roy Arav wrote:
> > > > I am trying to set static IP on a raspberry pi3 device running
> buildroot.
> > > >
> > > > I edited /etc/network/interfaces, using rootfs overlay.
> > > >
> > > > auto eth0
> > > > allow-hotplug eth0
> > > > iface eth0 inet static
> > > > address 192.168.0.1
> > > > netmask 255.255.255.0
> > > >
> > > > And still IP address is provided using DHCP/
> > > >
> > > > Is there anything else to so that I am missing?
> > > > Perhaps a BR2 flag or package that I need to enable?
> > >
> > > What is your .config?
> > > Do you have BR2_PACKAGE_IFUPDOWN_SCRIPTS enabled?
> > > What about BR2_PACKAGE_SYSTEMD_NETWORKD?
>
> --
>      http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--
> Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20171127/2a0a1950/attachment.html>
