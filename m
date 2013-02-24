From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sun, 24 Feb 2013 19:11:00 +0100
Subject: [Buildroot] editing device_table_dev.txt
In-Reply-To: <20130224182620.2283ceb3@skate> (Thomas Petazzoni's message of
 "Sun, 24 Feb 2013 18:26:20 +0100")
References: <1361403460.22521.44.camel@genx.eng.msli.com>
 <5125F38B.2030204@petroprogram.com>
 <5125F50C.7020902@petroprogram.com>
 <20130221102315.GB12155@sapphire.tkos.co.il>
 <5125F7BB.50403@petroprogram.com> <5126A675.2060308@mind.be>
 <5126A8C7.2000009@petroprogram.com> <5126AC9B.30302@mind.be>
 <20130224182620.2283ceb3@skate>
Message-ID: <877glxbn0r.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 >> Turns out that mdev still does device node creation. Makes me
 >> wonder if I'm not mistaken about udev as well... I just remember
 >> hearing that device node creation was removed when DEVTMPFS was
 >> introduced.

 Thomas> Yes, I think you got the thing wrong: udev and mdev are still
 Thomas> creating the device nodes. Of course, they might have already
 Thomas> been created by devtmpfs, but I don't think it is a
 Thomas> requirement. At least, devtmpfs is definitely not a requirement
 Thomas> for mdev to work (except in Buildroot, in which we made the
 Thomas> decision that if mdev is to be used, then devtmpfs support must
 Thomas> be there).

And the main reason for this is that you need a writable /dev and basic
device nodes before mdev starts up, and the simplest way of getting this
is using devtmpfs.

What mdev/udev buys you over pure devtmpfs is the possibility of custom
rules (names/permissions/programs executed).

-- 
Bye, Peter Korsgaard
