From: Rahul Bedarkar <Rahul.Bedarkar@imgtec.com>
Date: Sat, 20 Aug 2016 14:47:03 +0530
Subject: [Buildroot] Analysis of build results for 2016-08-18
In-Reply-To: <20160820000709.0ceef3cd@free-electrons.com>
References: <20160819063024.55AF4101904@stock.ovh.net>
 <20160820000709.0ceef3cd@free-electrons.com>
Message-ID: <57B8200F.8030305@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

On Saturday 20 August 2016 03:37 AM, Thomas Petazzoni wrote:

>
>>           arc |                  jack2-v1.9.10 | NOK | http://autobuild.buildroot.net/results/8a8d533a0f785591fee10f1c09c9294f892ef7f7/
>
> gcc 6.x issue:
>
> ../tests/iodelay.cpp:170:49: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
> ../tests/iodelay.cpp:171:50: error: narrowing conversion of '-1' from 'int' to 'jack_nframes_t {aka unsigned int}' inside { } [-Wnarrowing]
>
> I guess
> https://github.com/jackaudio/jack2/commit/ff1ed2c4524095055140370c1008a2d9cccc5645
> should fix it.
>

Thanks. I have sent patch to fix this issue. 
https://patchwork.ozlabs.org/patch/661117/

>
>>        x86_64 |                trousers-0.3.13 | NOK | http://autobuild.buildroot.net/results/c9b13ae8d4af9ae6a65921de142c0e8da30664e0/
>
> tsp_tcsi_param.c:14:28: fatal error: bits/local_lim.h: No such file or directory
>   #include <bits/local_lim.h>
>
> No?, since you added this package, could you have a look?
>

I have fixed similar issue for mtd package and can take a look. 
https://git.buildroot.net/buildroot/commit/?id=850e74c3639733986ff40b96fbca7d355aee738c

Thanks,
Rahul
