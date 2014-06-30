From: Stephan Hoffmann <sho@relinux.de>
Date: Mon, 30 Jun 2014 12:52:31 +0200
Subject: [Buildroot] Drivers for Realtek WLAN dongles
In-Reply-To: <20140630121735.41fa221b@free-electrons.com>
References: <53B12F66.7010508@relinux.de>
 <20140630121735.41fa221b@free-electrons.com>
Message-ID: <53B1416F.6050309@relinux.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas!
On 30.06.2014 12:17, Thomas Petazzoni wrote:
> Dear Stephan Hoffmann,
>
> On Mon, 30 Jun 2014 11:35:34 +0200, Stephan Hoffmann wrote:
>
>> did anyone download and compile drivers from realtek's website using
>> buildroot?
>>
>> While
>> http://www.armadeus.com/wiki/index.php?title=USB_to_WiFi_adapter#Chipset_RTL8188CUS
>> gives a recipe to do this by hand I need an integration in buildroot for
>> my current project.
>>
>> I searched the web but did not find anything, but maybe someone has a
>> not yet published solution. If not I will start my own patchset for this.
> Are you sure you need an out-of-tree driver for this? I see the
> mainline rtlwifi driver supports a number of rtl8188cus dongles. Which
> specific model do you have? Which USB vendor/product ID?
I am stuck to the 3.0.35 kernel for i.MX6 because the board vendor did
not provide a more recent kernel yet.

I tried the driver that the kernel loads when I plugged in the dongle,
that is (on the buildroot system)

# lsmod
Module                  Size  Used by    Not tainted
rtl8192cu              90081  0
rtlwifi                65735  1 rtl8192cu
rtl8192c_common        53218  1 rtl8192cu
mac80211              153566  3 rtl8192cu,rtlwifi,rtl8192c_common

lsusb on my development workstation says: ID 0bda:8176 Realtek
Semiconductor Corp. RTL8188CUS 802.11n WLAN Adapter

The driver brings up wlan0, looking good at the first view, but
wpa_supplicant cannot connect to the AP.

Using realtek's out-of-tree driver that I built by hand (named 8192cu)
the connection works well with nothing else changed. So my conclusion is
that the built in driver does not work for this dongle.

BTW: it is the 150 MBps dongle from CSL-Computer.com.

Kind regards

Stephan
>
> Thomas


-- 
reLinux     -    Stephan Hoffmann
Am Schmidtgrund 124    50765 K?ln
Tel. +49.221.95595-19    Fax: -64
www.reLinux.de Stephan at reLinux.de
