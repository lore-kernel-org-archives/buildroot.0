From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Dec 2010 15:05:20 +0100
Subject: [Buildroot] cannot log to my build root
In-Reply-To: <AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
References: <AANLkTine190SpsTRLjzsOvdTFjAXiEwDK4yd8Vmkhsj_@mail.gmail.com>
	<20101214142544.7863d2d2@surf>
	<AANLkTi=GjsSptGonZv0S+BqCgYZZYoTOC=K+mTYpLrSd@mail.gmail.com>
Message-ID: <20101214150520.253b9bae@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, 14 Dec 2010 15:39:45 +0200
Diego Iastrubni <diegoiast@gmail.com> wrote:

> Nope. In my original case /dev/tty was not a char device (a null file
> instead). Creating these files fixed the problem:

This is because you are using the output/target/ directory, but you
should *not* do this. From the Buildroot documentation:

?
target/ which contains almost the complete root filesystem for the
target: everything needed is present except the device files in /dev/
(Buildroot can't create them because Buildroot doesn't run as root and
doesn't want to run as root). Therefore, this directory should not be
used on your target. Instead, you should use one of the images built in
the images/ directory. If you need an extracted image of the root
filesystem for booting over NFS, then use the tarball image generated
in images/ and extract it as root.
?

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
