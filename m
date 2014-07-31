From: Rohit Kumar <rkthebest@gmail.com>
Date: Thu, 31 Jul 2014 12:40:30 +0900
Subject: [Buildroot] configure HOSTAPD build to enable nl80211 driver
	support
In-Reply-To: <53D9AC46.9000704@zacarias.com.ar>
References: <CABzetm3JrRH7f4R8ErDqd96XKUBEH=9ARqsQdm86UDfU89D4aw@mail.gmail.com>
 <53D9AC46.9000704@zacarias.com.ar>
Message-ID: <CABzetm16jMzxh9PjgrA_CA1_8y1a4Lj5pCn2B+Wqmpfoq7eV0A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
On Thu, Jul 31, 2014 at 11:39 AM, Gustavo Zacarias <gustavo@zacarias.com.ar>
wrote:

> On 07/30/2014 10:48 PM, Rohit Kumar wrote:
>
> > Hello,
> >
> > how can i configure hostapd build with nl80211 driver support.
> > currenty when i run hostapd, it says
> >>nl80211 driver initialization failed.
> > With Regards,
>
> Hi.
> That error message is terribly generic, how about a little more
> information on what hostapd says before that and your hostapd config?
>
hostapd.conf is very basic :
interface=wlan0
driver=nl80211
ssid=test
channel=1

hostapd hostapd.conf -dd

generates following output

 random: Trying to read entropy from
/dev/random
Configuration file:
/root/hostapd-test.conf

nl80211: Could not add multicast membership for vendor events: -2 (No such
file or directory)
rfkill: Cannot open RFKILL control
device
nl80211: RFKILL status not
available
nl80211: Remove monitor interface:
refcount=0
netlink: Operstate: ifindex=3 linkmode=0 (kernel-control), operstate=6
(IF_OPER_UP)
nl80211: Set mode ifindex 3 iftype 2
(STATION)
nl80211: Failed to set interface 3 to mode 2: -19 (No such
device)
nl80211 driver initialization
failed.
hostapd_interface_deinit_free(0xe78b8)

hostapd_interface_deinit_free: num_bss=1
conf->num_bss=1
hostapd_interface_deinit(0xe78b8)

hostapd_bss_deinit: deinit bss
wlan0
hostapd_cleanup(hapd=0xe8518
(wlan0))
hostapd_free_hapd_data: Interface wlan0 wasn't
started
hostapd_interface_deinit_free: driver=(nil) drv_priv=(nil) ->
hapd_deinit
hostapd_interface_free(0xe78b8)

hostapd_interface_free: free hapd
0xe8518
hostapd_cleanup_iface(0xe78b8)

hostapd_cleanup_iface_partial(0xe78b8)

hostapd_cleanup_iface: free iface=0xe78b8

A dump of the wlan card information would be useful too, typically via
> the iw package "iw phy0 info" since it's possible you're trying to do
> master mode on a device that doesn't support it.
>

iw wlan0 info
command failed: No such device (-19)

but iwconfig works fine even when i run
iwconfig wlan0 mode master
it does not show error.

the USB wifi device works well on PC, so device supports master mode

> Regards.
>
> with regards,
Rohit Kumar
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20140731/262598b1/attachment.html>
