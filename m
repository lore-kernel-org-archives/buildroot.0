From: Hamish Moffatt <hamish@cloud.net.au>
Date: Tue, 2 Sep 2008 10:58:37 +1000
Subject: [Buildroot] Still "Can't open /dev/tty1[2,3]", Please HELP
In-Reply-To: <ed4892840808311857w6532170co3ae626bb8dae34a2@mail.gmail.com>
References: <ed4892840808311857w6532170co3ae626bb8dae34a2@mail.gmail.com>
Message-ID: <20080902005836.GA1637@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 01, 2008 at 09:57:49AM +0800, Steven Woody wrote:
> After guess and guess and build and burn,  my rootfs still can not
> boot, it always get "Can't open /dev/tty1[2,3...]" after kernel loaded
> just load it.  I attached the full boot message and my buildroot
> .config, I hope, with best regards, someone could help me.

I couldn't work out where your target_skeleton and device table are
coming from based on your config. Do you have a device table, and does
it have those /dev/tty1,2,3,4 devices?

Maybe you could post the output of the build process.

> VFS: Mounted root (cramfs filesystem) readonly.
> Freeing init memory: 84K
> mkdir: cannot create directory '/dev/pts': Read-only file system
> mount: mounting devpts on /dev/pts failed: No such file or directory

Your inittab is obviously trying to make directories in a read-only file
system which isn't going to work. Not that it's related.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
