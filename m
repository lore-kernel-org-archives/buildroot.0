From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 5 May 2016 09:32:38 -0300
Subject: [Buildroot] [PATCH 1/2] configs/qemu: use zImage for sh4/sh4eb
 samples
In-Reply-To: <20160505142429.1853d011@free-electrons.com>
References: <1462447857-29400-1-git-send-email-gustavo@zacarias.com.ar>
 <20160505142429.1853d011@free-electrons.com>
Message-ID: <572B3D66.2090207@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/05/16 09:24, Thomas Petazzoni wrote:

> On Thu,  5 May 2016 08:30:56 -0300, Gustavo Zacarias wrote:
>> The default for ARM was changed to uImage in 5c67cb1d, however the
>
> 5c67cb1d changed ARM to default to *zImage*.

Hi, right, word puzzle!

> Right, that's a mistake. However, seems like the SPARC defconfig was
> also changed while it shouldn't have been changed.

That's not a problem - it was redudant, sparc doesn't support uImage 
hence zImage is the default anyway.
I've tested all of this with the qemu defconfig rebuilds and noticed 
sh4(eb) was still running 4.5.0 (rsync without delete when copying to 
run the tests, hence previous kernel).
Regards.
