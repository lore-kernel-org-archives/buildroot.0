From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 04 Oct 2012 18:40:42 +0200
Subject: [Buildroot] eGalax Touchscreen
In-Reply-To: <CAA8O6f7aq+f95GQMLhLMx+4ystqCcj5JOMAnLDD01dQfRHU36g@mail.gmail.com>
References: <CAA8O6f7aq+f95GQMLhLMx+4ystqCcj5JOMAnLDD01dQfRHU36g@mail.gmail.com>
Message-ID: <506DBC0A.4030501@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/10/12 11:39, Christian M?ller wrote:
> Hello all
> I'm trying to setup EGalax Touchscreen. The controller-ic is an etr-4000 usb.
> I patched the Kernel described in "eGTouch Linux Programming Guide v2.5c".
> (http://home.eeti.com.tw/web20/eGalaxTouchDriver/linuxDriver.htm)
> In dmesg output the controller is listet, but there is no /dev/uinput and no /dev/hidrawX devicefile.
> Device isn't also listet under /proc/bus/input/devices.
> What I have to do to get the touchscreen running?
> Any help will be welcome.

  This is not really a buildroot-related question, linux-input at vger.kernel.org
would be more appropriate.

  Still, some ideas:

- I never heard of /dev/uinput or /dev/hidraw.  Input devices can usually be
found in /dev/input/.  Perhaps you need udev rules to create /dev/uinput or
/dev/hidraw?

- Look in /sys/devices/pci0000:00/0000:00:1d.1/usb2/2-2/2-2:1.0/input/input6
(and 7, 8, 9, 10); it should have an eventXX directory containing a 'dev' file.
That file contains the major:minor number of the (character) device node for
the input event device.  You should have a /dev/input/eventXX device node
with the same numbers.  That's the device you need.


  For future posts, please

- mention the buildroot and kernel versions you use;

- post a defconfig instead of a a full config;

- post text attachments with disposition:inline so people can quote them.


  Good luck!

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
