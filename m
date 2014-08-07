From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 7 Aug 2014 07:47:50 +0300
Subject: [Buildroot] Buildroot 2014.08-git-01152-g10b6d10 make error
In-Reply-To: <CABzetm2N+k4Vo6xQ7yVaRKf2-sh4ni-D4Btm82qHwy+K0kAw=w@mail.gmail.com>
References: <CABzetm2N+k4Vo6xQ7yVaRKf2-sh4ni-D4Btm82qHwy+K0kAw=w@mail.gmail.com>
Message-ID: <20140807044750.GQ2322@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Rohit Kumar,

On Thu, Aug 07, 2014 at 01:37:28PM +0900, Rohit Kumar wrote:
> Hello,
> 
> i tried to build toolchain and file system for ARM cortex-A9 but stuck
> with this error.
> configuration file is also attached.
> --------------------------------------------------
> You will probably need to make your busybox binary
> setuid root to ensure all configured applets will
> work properly.
> --------------------------------------------------
> 
> make[1]: Leaving directory
> `/home/rohit/Desktop/buildroot_odroid/output/build/busybox-1.22.1'
> if [ ! -f /home/rohit/Desktop/buildroot_odroid/output/target/usr/share/udhcpc/default.script
> ]; then /usr/bin/install -m 0755 -D package/busybox/udhcpc.script
> /home/rohit/Desktop/buildroot_odroid/output/target/usr/share/udhcpc/default.script;
> fi
> [ -f /home/rohit/Desktop/buildroot_odroid/output/target/etc/init.d/S10mdev
> ] || /usr/bin/install -D -m 0755 package/busybox/S10mdev
> /home/rohit/Desktop/buildroot_odroid/output/target/etc/init.d/S10mdev
> [ -f /home/rohit/Desktop/buildroot_odroid/output/target/etc/mdev.conf
> ] || /usr/bin/install -D -m 0644 package/busybox/mdev.conf
> /home/rohit/Desktop/buildroot_odroid/output/target/etc/mdev.conf
> if grep -q CONFIG_SYSLOGD=y
> /home/rohit/Desktop/buildroot_odroid/output/build/busybox-1.22.1/.config;
> then [ -f /home/rohit/Desktop/buildroot_odroid/output/target/etc/init.d/S01logging
> ] || /usr/bin/install -m 0755 -D package/busybox/S01logging
> /home/rohit/Desktop/buildroot_odroid/output/target/etc/init.d/S01logging;
> else rm -f /home/rohit/Desktop/buildroot_odroid/output/target/etc/init.d/S01logging;
> fi
> >>> linux 0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b Downloading
> /home/rohit/Desktop/buildroot_odroid/support/download/git: line 30: [:
> -eq: unary operator expected
> fatal: Not a git repository: 'linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b'
> --2014-08-07 13:35:00--
> http://sources.buildroot.net/linux-0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
> Connecting to sources.buildroot.net
> (sources.buildroot.net)|176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-08-07 13:35:01 ERROR 404: Not Found.

Commit 9d1ab4321168fd should fix your problem following your previous report 
(http://lists.busybox.net/pipermail/buildroot/2014-August/103733.html). See 
http://git.buildroot.net/buildroot/commit/?id=9d1ab4321168fdda714be30c6b53e2ce0027509d.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
