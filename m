From: Chu, Zhuliang (NSB - CN/Shanghai) <zhuliang.chu@nokia-sbell.com>
Date: Thu, 9 Nov 2017 08:19:10 +0000
Subject: [Buildroot] [RFCv1 0/4] Per-package SDK and target directories
In-Reply-To: <20171108172914.GA4602@scaer>
References: <5DBA847110A28B46BBA17BE675F0C9B2181A8D38@cnshjmbx01>,
 <20171108172914.GA4602@scaer>
Message-ID: <5DBA847110A28B46BBA17BE675F0C9B2181AA4B9@cnshjmbx01>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Yann E,

>
>So, I wonder what openssl you are using... :-/
I am sorry to cause your confusion. This is an imaginary example I give.
I've already explained this issue in the email that responded to Thomas Petazzoni.

>> Q2: Space Expension
>> in qemu_x86_defconfig, the size of output increased from 3.4G to 3.6G between mainstream with 'ppsh'.
>> in my private, the rate of space occupancy growth is higher. it`s crazy from 3.6G to 9G .This obviously can not accept. (A large
>> part of reason is that I use a very large toolchain-external which about 1.5G)
>> Before a package only consumes one space, but now a package maybe reoccupied space below per-package.
>
>As others already stated, in may depend on the tools you use to report
>the disk usage, but can also depend on the type of filesystem.
>
>What filesystem are you using: ext3/4, btrfs, xfs, other?
>
>What command did you run to come up with those numbers?

my filesystem is xfs of centos7.
Sorry.This problem is likely to be one of my mistake rather than 'per-package'.
That day I encountered a compilation error 'toolchain HOST_DIR' which had been reported to Thomas Petazzoni.
The details:
when run the command 'output/per-package/toolchain/host//usr/bin/mips64-octeon-linux-gnu-gcc  --version'.
there will raise a error 'output/per-package/toolchain-external-custom/host/opt/ext-toolchain/bin/mips64-octeon-linux-gnu-gcc: No such file or directory'
When I encountered this error. I made a patch to solve it.
But after I saw thomas reply, I carefully checked my patch and I found out that my patch duplicates the toolchain-tar in the per-package/ package which dependent toolchain.

I am currently testing per-package. I have not finished all the compilation.
I have encountered many problems, of which some are my own environment issues and others are per-package issues.
I am trying to solve these problems to promote its progress.
Hopefully per-package SDK can be pushed into the mainstream as soon as possible.

Chu,Zhuliang
Best Regards,
