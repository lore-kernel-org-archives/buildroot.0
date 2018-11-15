From: Nicolas Cavallari <Nicolas.Cavallari@green-communications.fr>
Date: Thu, 15 Nov 2018 11:17:41 +0100
Subject: [Buildroot] [PATCH] gcc: Enable __cxa_atexit for final GCC
In-Reply-To: <20181115040150.11472-1-abrodkin@synopsys.com>
References: <20181115040150.11472-1-abrodkin@synopsys.com>
Message-ID: <f4e74170-b562-b93b-316c-b62dad8f7a4f@green-communications.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 15/11/2018 05:01, Alexey Brodkin wrote:
> This is what GCC manual says [1]:
> -------------------------->8----------------------
> --enable-__cxa_atexit
> 
>     Define if you want to use __cxa_atexit, rather than atexit,
>     to register C++ destructors for local statics and global objects.
> 
>     This is essential for fully standards-compliant handling of destructors,
>     but requires __cxa_atexit in libc.
> 

For what is is worth, we enabled cxa_atexit in BR2_EXTRA_GCC_CONFIG_OPTIONS five
years ago, to fix a crash that occurred when catching exceptions and logging
them using a log system that used global variables.  But we couldn't remember
the details.
