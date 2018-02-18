From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
Date: Sun, 18 Feb 2018 19:45:08 +0100
Subject: [Buildroot] __mcount on ARC
Message-ID: <8e90a87a-7e64-6662-3309-ce0325bc686f@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear All,

I'm investigating this [1] autobuild error, where the gpsd build fails
while profiling is enabled, due to undefined reference to `__mcount', on
ARC arch.

Ironically enough due to a bug in the gpsd build config the -pg flag is
not passed to the linker only to the compiler, but after patching that
one, the build issue remains.
According to this thread [2] this happened earlier with ARC but other
package, so is there anything particular about ARC regarding to
profiling? Should we just disable the gpsd profiling option on ARC?



[1]
http://autobuild.buildroot.net/results/88870f5bf4aff557d8eac4e1cc5d3e397e607af0/

[2]
http://buildroot-busybox.2317881.n4.nabble.com/autobuild-buildroot-net-Build-results-for-2017-11-19-td180416.html


Thanks,

-- 
Zoltan Gyarmati
https://zgyarmati.de


-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 473 bytes
Desc: OpenPGP digital signature
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180218/d3452e7c/attachment.asc>
