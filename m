From: Sergio Prado <sergio.prado@e-labworks.com>
Date: Fri, 4 Mar 2016 20:48:29 -0300
Subject: [Buildroot] [PATCH] libcap-ng: bump to version 0.7.7
In-Reply-To: <56DA16A5.4010703@gmail.com>
References: <1457132440-20407-1-git-send-email-sergio.prado@e-labworks.com>
 <56DA16A5.4010703@gmail.com>
Message-ID: <CANu7NGu5qgahQaStQnrjeWouD_+9j9HmVgcLwFBuqAngod2qqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Romain,

Thanks for reviewing the patch.

2016-03-04 20:13 GMT-03:00 Romain Naour <romain.naour@gmail.com>:
>
> Hi Sergio,
>
> Le 05/03/2016 00:00, Sergio Prado a ?crit :
> > Also disable optimization when compiling for nios2 to prevent a compiler
> > bug.
>
> The bump and the nios2 fix must be two separate patches.

Right.

> > Fixes:
> >
http://autobuild.buildroot.net/results/3afc4c006a74fd7512dace90b5f884bf7be4cc58/
> >
http://autobuild.buildroot.net/results/2c53f611a705506ca86fedb0f1129df1d315632c/
> >
http://autobuild.buildroot.net/results/c3d9477688b55987591b5b5efed5ee65499aa0e6/
> >
http://autobuild.buildroot.net/results/052ff24f3985b652c11ac390f342e9ad3d862431/
>
> Also the compiler bug is due to an issue with gcc <= 5.2. All theses build
> issues are trigged by br-nios2-full-2015.11-rc1-71-g90d1299.tar.bz2
toolchain
> which is based on gcc 4.9.
>
> I propose to add an exception in the autobuilder script:
> http://patchwork.ozlabs.org/patch/582313/
>
> Also see:
> http://lists.busybox.net/pipermail/buildroot/2015-December/146308.html

Adding an exception in the autobuilder will not fix the problem in
production, right? The user that wants to use this package with NIOS2 and
GCC <= 5.2 will still catch this problem. Working around the problem
disabling GCC optimizations fixes in all cases. What do you think?

>
> Best regards,
> Romain
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160304/ee2eaf52/attachment.html>
