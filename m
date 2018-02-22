From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 22 Feb 2018 07:04:50 +0200
Subject: [Buildroot] Noob with a Beaglebone black wireless
In-Reply-To: <CALw7ttFsg6vxrCVvtRJVu1x34XhBkC4mSrRTuBH4z1wUoTJKgQ@mail.gmail.com>
References: <CALw7ttFsg6vxrCVvtRJVu1x34XhBkC4mSrRTuBH4z1wUoTJKgQ@mail.gmail.com>
Message-ID: <20180222050450.pn6jhsmciyddojj2@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rick,

On Wed, Feb 21, 2018 at 09:43:12PM -0600, Mister Woland wrote:
> I am new to all this.  I found a tutorial for the BBB on the net.  I built
> and put it on my BBBWireless.  Naturally it booted the operating system ,
> but how would I get wireless to work?  Could I take the def config for the
> BBB and modify it?  Do I need a dts file?

Do you see your WiFi interface in the output of 'iw list' (you need the iw 
package for that)?

Provided that your kernel configuration and dts enable support for the WiFi 
module on your board, the rest is just standard Linux WiFi configuration. You 
can try the Buildroot network-manager or connman packages to do the configure 
for you for the WiFi station case.

If you want to configure your board as AP you most likely need hostapd.

In any case, Linux WiFi configuration is not in scope for this mailing list.

Hope this helps,
baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
