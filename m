From: Wojciech Zabolotny <wzab01@gmail.com>
Date: Sat, 7 Jul 2012 13:58:56 +0100
Subject: [Buildroot] msgpack-python (0.1.10) and libmsgpack (0.5.7) packaged
	for buildroot-2011.11
Message-ID: <CAMduVEc6PwEARbD7ABkEamjzJ5MyDM_wfn_mBJXhqTiqMwMmCg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

I had to add two packages msgpack-python and libmsgpack to my embedded
system running Linux compiled with buildroot-2011.11
Unfortunately this version of buildroot does not support setuptools,
so I couldn't use the msgpack-python v. 0.2.0, and had to use older v.
0.1.10.
As my buildroot is compiled without C++ support, I had also to disable
the C++ API in libmsgpack.
Adding of those packages to buildroot required small modifications.
Attached is the patch, which adds definition for those packages in the
"package" directory.
Of course you'll need also to add lines:

source "package/libmsgpack/Config.in"
source "package/msgpack-python/Config.in"

in the appropriate section of the package/Config.in file
-- 
Regards,
Wojtek
-------------- next part --------------
A non-text attachment was scrubbed...
Name: libmsgpack_and_msgpack-python.patch
Type: application/octet-stream
Size: 4171 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20120707/a1803dc9/attachment.obj>
