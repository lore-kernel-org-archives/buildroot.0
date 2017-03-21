From: Baruch Siach <baruch@tkos.co.il>
Date: Tue, 21 Mar 2017 18:28:17 +0200
Subject: [Buildroot] [PATCH v2] package/uclibc: Enable wordexp
 functionality
In-Reply-To: <1490112708.19767.139.camel@linux.intel.com>
References: <20170321160237.31058-1-andriy.shevchenko@linux.intel.com>
 <20170321160237.31058-2-andriy.shevchenko@linux.intel.com>
 <20170321170614.161e8eec@free-electrons.com>
 <1490112708.19767.139.camel@linux.intel.com>
Message-ID: <20170321162817.vlqaednn4dfjb3fw@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Andy,

On Tue, Mar 21, 2017 at 06:11:48PM +0200, Andy Shevchenko wrote:
> On Tue, 2017-03-21 at 17:06 +0100, Thomas Petazzoni wrote:
> > On Tue, 21 Mar 2017 18:02:36 +0200, Andy Shevchenko wrote:
> > > The commit d7c54cb0c0cf ("bluez5_utils: not available with uClibc")
> > > disables bluez5_utils (most of them) to be built with uClibc.
> > > Looking to
> > > the development of BlueZ user space support that commit basically
> > > makes
> > > the bluez5_utils package somewhat piece of junk.
> > 
> > Not sure I understand what you mean here.
> 
> Without new tools like bluetoothctl it's impossible to use Bluetooth
> modules, such as BCM43341 based.

This is a UART attached device, isn't it?

> hcitool, hciattach, hciconfig, etc (see the list under DEPRECATED in
> Makefile.tools in bluez5_utils sources) does *not* work with it.

How do you bind the driver to the UART device without hciattach?

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.52.368.4656, http://www.tkos.co.il -
