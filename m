From: Rohit Kumar <rkthebest@gmail.com>
Date: Thu, 31 Jul 2014 13:07:08 +0900
Subject: [Buildroot] configure HOSTAPD build to enable nl80211 driver
	support
In-Reply-To: <20140731035151.GG2480@tarshish>
References: <CABzetm3JrRH7f4R8ErDqd96XKUBEH=9ARqsQdm86UDfU89D4aw@mail.gmail.com>
 <53D9AC46.9000704@zacarias.com.ar>
 <CABzetm16jMzxh9PjgrA_CA1_8y1a4Lj5pCn2B+Wqmpfoq7eV0A@mail.gmail.com>
 <20140731035151.GG2480@tarshish>
Message-ID: <CABzetm2uARm_yNv8P3vuW7VvMSKk-WFSg4WcZhf-vy3DnznYQA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Jul 31, 2014 at 12:51 PM, Baruch Siach <baruch@tkos.co.il> wrote:

> Hi Rohit,
>
> On Thu, Jul 31, 2014 at 12:40:30PM +0900, Rohit Kumar wrote:
> > On Thu, Jul 31, 2014 at 11:39 AM, Gustavo Zacarias <
> gustavo at zacarias.com.ar>
> > wrote:
> > > On 07/30/2014 10:48 PM, Rohit Kumar wrote:
> > > > how can i configure hostapd build with nl80211 driver support.
> > > > currenty when i run hostapd, it says
> > > >>nl80211 driver initialization failed.
> > >
> > > That error message is terribly generic, how about a little more
> > > information on what hostapd says before that and your hostapd config?
> > >
> > hostapd.conf is very basic :
> > interface=wlan0
> > driver=nl80211
> > ssid=test
> > channel=1
>
> [...]
>
> > > A dump of the wlan card information would be useful too, typically via
> > > the iw package "iw phy0 info" since it's possible you're trying to do
> > > master mode on a device that doesn't support it.
> >
> > iw wlan0 info
> > command failed: No such device (-19)
> >
> > but iwconfig works fine even when i run
> > iwconfig wlan0 mode master
> > it does not show error.
> >
> > the USB wifi device works well on PC, so device supports master mode
>
> It seems that your driver only support the old deprecated wireless
> extension
> API. You may have better luck if you enable CONFIG_DRIVER_WEXT in
> hostapd/defconfig. You'll also need 'driver=wext' in you hostapd.conf.
>
> i tried to edit defconfig at buildroot/output/build/hostapd-2.2/hoatapd
but "CONFIG_DRIVER_WEXT" parameter does not exist in the file.
how do i do it?

i also have the source for wifi driver which i am using, can i change
something in driver to make it support new API?

>  baruch
>
> --
>


With Regards,

Rohit Kumar
+82 1073149173

>       http://baruch.siach.name/blog/                  ~. .~   Tk Open
> Systems
> =}------------------------------------------------ooO--U--Ooo------------{=
>    - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140731/40f48c8a/attachment.html>
