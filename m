From: Ilya Kuzmich <ilya.kuzmich@gmail.com>
Date: Wed, 22 Mar 2017 11:06:51 +0300
Subject: [Buildroot] [PATCH 1/1] toolchain-external: improve musl
 external check
In-Reply-To: <20170321231856.014bc6a7@free-electrons.com>
References: <1489989370-22377-1-git-send-email-ilya.kuzmich@gmail.com>
 <20170321231856.014bc6a7@free-electrons.com>
Message-ID: <20170322080651.GC29607@uxa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Current check fails on crosstool-ng musl toolchain,
ctng puts libc.so at sysroot/usr/lib/, not sysroot/lib

On 21/03, Thomas Petazzoni wrote:
> Hello,
> 
> On Mon, 20 Mar 2017 08:56:10 +0300, Ilya Kuzmich wrote:
> > Test whether musl used or not: compile minimal C program and check if
> > interpreter contains /lib/ld-musl.
> > 
> > Signed-off-by: Ilya Kuzmich <ilya.kuzmich@gmail.com>
> 
> This doesn't look bad, but what is the motivation behind the change? Is
> the current check not working for you?
> 
> Thanks!
> 
> Thomas
> -- 
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com
