From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 13 Jun 2016 22:00:03 +0200
Subject: [Buildroot] [PATCH] package/systemd: Optionally disable hwdb
In-Reply-To: <b8499799-7f77-e90f-65aa-29cae92d53d5@grinn-global.com>
References: <1460717190-29291-1-git-send-email-m.niestroj@grinn-global.com>
 <20160608201910.GA3694@free.fr>
 <b8499799-7f77-e90f-65aa-29cae92d53d5@grinn-global.com>
Message-ID: <20160613200003.GA3786@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Marcin, All,

On 2016-06-13 11:20 +0200, Marcin Niestroj spake thusly:
> On 08.06.2016 22:19, Yann E. MORIN wrote:
> >On 2016-04-15 12:46 +0200, Marcin Niestroj spake thusly:
> >>By default hwdb files are installed in /usr/lib/udev/hwdb.d
> >>Currently they take about ~5MB. After first boot, systemd-hwdb tool
> >>parses them and creates a binary in /etc/udev/hwdb.bin, which takes
> >>another ~6.5MB.
> >>
> >>In case of initramfs images, hwdb parsing is done every boot. This adds
> >>about 2-3 seconds to boot time in case of rootfs on SDHC class 10
> >>card (benchmarked with am335x board). NAND boot takes even longer.
[--SNIP--]
> >Yet, I'd like to know what would be the impact of not having hwdb
> >support at runtime. Care to shed some light, please?
> 
> HWDB is mainly a database of device classes and vendors (for PCI, SDIO,
> USB). This is helpfull during development, because tools like lsusb are
> able to show vendor and usb class for each device. However we don't
> need this in production most of the time.
> Additionally there are some files for input devices, like mouse,
> keyboard and pointstick. In keyboard files for example there are
> defined some special keys, like play/pause, volumeup etc.

OK, thanks for the info, definitively usefull.

So, it seems this is not systematically needed on production systems,
but mostly a "debugging" aid in most cases. And for those that need it,
it's still an option.

However, people that do need it and that are working either on a
read-only filesystem or a transient one (initramfs) would need a mean
to avoid building this hwdb at every boot... That would be so cool...

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
