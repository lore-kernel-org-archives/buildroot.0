From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Nov 2012 23:28:18 -0800
Subject: [Buildroot] mkcramfs invalid option 'q'
In-Reply-To: <slrnkbg0lg.2kq.narkewoody@zuhnb712.local.com> (Woody Wu's
 message of "Fri, 30 Nov 2012 00:50:48 +0000 (UTC)")
References: <slrnkbg0lg.2kq.narkewoody@zuhnb712.local.com>
Message-ID: <87fw3rczxp.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Woody" == Woody Wu <narkewoody@gmail.com> writes:

 Woody> Hi, list
 Woody> What now concerns me is an warning message in the output of building
 Woody> cramfs image:


 Woody> ...
 Woody> tdir=/home/buildroot/buildroot-2012.08/output/target
 Woody> table='/home/buildroot/buildroot-2012.08/output/build/_device_table.txt'
 Woody> /home/buildroot/buildroot-2012.08/output/host/usr/bin/mkcramfs: invalid
 Woody> option -- 'q'
 Woody> ...

 Woody> I just want to ensure that this is normal and I don't need to warry
 Woody> about it. Otherwise, please someone tell me a fix.  Thanks!

I looked back in git history, and we have apparently had this -q option
ever since cramfs support was introduced in 2003! I've removed it now
from git as mkcramfs doesn't take a -q option, thanks.

Notice: I would strongly suggest you move to squashfs instead of the
ancient cramfs.

-- 
Bye, Peter Korsgaard
