From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 7 Sep 2010 16:55:46 +0200
Subject: [Buildroot] Why is extfs filesystem mandatory?
In-Reply-To: <4C863CDD.8020805@jdines.net>
References: <4C863CDD.8020805@jdines.net>
Message-ID: <20100907165546.06ed2a29@surf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 07 Sep 2010 09:23:41 -0400
"James J. Dines" <jdines@jdines.net> wrote:

> While trying to build a large system I keep getting an error stating
> that there is no room left on the device during the generation of the
> ext2 filesystem.  It is my understanding that this is due to a hard
> upper limit imposed by the genext2fs utility.

Hum, interesting. It is not the first time we have report from people
saying that fairly big filesystems cause failures while generating the
ext2 image. I don't know if it's a genext2fs problem, or if it's our
script that computes the number of inodes and blocks needed that does
something wrong. Would be good if someone could have a look into this.

> This would not be an issue for me if I could simply disable said step,
> however there seems to be no way to disable generation of the ext2
> filesystem in the menuconfig.
> 
> Is there a reason why this cannot be disabled?

make menuconfig
 -> Target filesystem options
   -> disable 'ext2 root filesystem'

Works here. It doesn't work for you ?

Regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
