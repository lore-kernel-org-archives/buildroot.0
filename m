From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 18 Oct 2008 15:32:14 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/target/device/Atmel:
	atngw100/target_skeleton atngw100/target etc...
In-Reply-To: <20081018124742.CEE273C848@busybox.net>
References: <20081018124742.CEE273C848@busybox.net>
Message-ID: <200810181532.15141.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

jacmet at uclibc.org, 18.10.2008:
> 
> Log:
> target/device/Atmel: add /sys to target skeletons
> 
> Reported by John Schimandle
> 
> Added:
>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/sys/
>    trunk/buildroot/target/device/Atmel/atngw100/target_skeleton/sys/.empty
>    trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/sys/
>    trunk/buildroot/target/device/Atmel/atstk100x/target_skeleton/sys/.empty
>    trunk/buildroot/target/device/Atmel/root/target_skeleton/sys/
>    trunk/buildroot/target/device/Atmel/root/target_skeleton/sys/.empty

The AVR32 based boards atngw100 and atstk100x should have already worked,
though I've only used them with Atmel's Buildroot. They create this directory
from Atmel/{atngw100,atstk100x}/device_table.txt, but it isn't included in
Atmel/root/device_table.txt, so it didn't work for the ARM boards.

There are several directories in various device_table.txt files, not related
to device files and not all those need special file permissions.

Markus
