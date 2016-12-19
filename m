From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 19 Dec 2016 23:28:24 +0100
Subject: [Buildroot] [PATCH 1/1] package/freeswitch: bump version to
 1.6.13
In-Reply-To: <jebjidx41h.ln2@ID-313208.user.individual.net>
References: <20161207212535.6479-1-bernd.kuhls@t-online.de>
 <20161207225215.663fca31@free-electrons.com>
 <jebjidx41h.ln2@ID-313208.user.individual.net>
Message-ID: <20161219232824.4730592a@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 18 Dec 2016 22:25:07 +0100, Bernd Kuhls wrote:

> no, 1.6.13 did not fix the build failures, freeswitch git master is also 
> affected, tested with http://autobuild.buildroot.net/results/b37/
> b370813ce8bde65a9208d7678e67a3b2f22ef36c/defconfig and personal patches 
> containing the version bump to fsw git master.
> 
> The build failures started on Dec 5th:
> http://autobuild.buildroot.net/?reason=freeswitch-1.6.12
> 
> only several hours after you updated all pre-built toolchains used on 
> autobuild.b.o:
> 
> http://lists.busybox.net/pipermail/buildroot/2016-December/179017.html
> 
> Maybe the failures[1] result from the updated toolchains?
> They only occur with uclibc and only on arc/arm/powerpc/xtensa.
> 
> Regards, Bernd
> 
> [1] Quoting http://autobuild.buildroot.net/results/b37/
> b370813ce8bde65a9208d7678e67a3b2f22ef36c/build-end.log

Thanks for this analysis!

And indeed, after looking deeply, it's bug that was introduced in
uclibc between version 1.0.19 and 1.0.20. It was introduced by commit
cee0b058fa0b4501b289a2da365182d60314d746 in uClibc-ng.

I've now sent a patch to Buildroot
(https://patchwork.ozlabs.org/patch/707262/), and uClibc-ng upstream to
fix the problem. I've tested, and freeswitch now builds fine on uClibc.

Thanks again!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
