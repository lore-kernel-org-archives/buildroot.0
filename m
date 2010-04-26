From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 26 Apr 2010 09:25:22 +0200
Subject: [Buildroot] /dev/bus/usb on BR
In-Reply-To: <x2j630286c71004260020s9acd6240u55ed0215380bc461@mail.gmail.com>
	(Nataraj S. Narayan's message of "Mon, 26 Apr 2010 07:20:54 +0000")
References: <p2l630286c71004252341l5ed447f0sd5cb0c0bf3c68a75@mail.gmail.com>
	<87tyqy4ryg.fsf@macbook.be.48ers.dk>
	<x2j630286c71004260020s9acd6240u55ed0215380bc461@mail.gmail.com>
Message-ID: <87ljca4qvx.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Nataraj" == Nataraj S Narayan <natarajsn@gmail.com> writes:

Please keep mails on the buildroot list, thanks.

 Nataraj> Hi
 Nataraj> As per strace of the code, it seems first it tries to open
 Nataraj> /dev/bus/usb then checks for /proc/bus/usb.

 Nataraj> As for udev, i didn't find an option in 'make menuconfig' to enable.
 Nataraj> Hence did a "make udev" and copied the *udev* files onto target. Hope
 Nataraj> that was ok.

It's there (do "/ udev in make menuconfig to search):

    Symbol: BR2_PACKAGE_UDEV [=n]
  ? Prompt: udev
  ?   Defined at package/udev/Config.in:1
  ?   Depends on: BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
  ?   Location:
  ?     -> Package Selection for the target
  ?       -> Hardware handling
  ?   Selected by: BR2_PACKAGE_HAL

Make sure you have BR2_PACKAGE_BUSYBOX_SHOW_OTHERS enabled.

-- 
Bye, Peter Korsgaard
