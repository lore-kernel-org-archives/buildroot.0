From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 15 Jan 2017 22:27:54 +0100
Subject: [Buildroot] [PATCH] board/beaglebone: fix build issue with gcc6
In-Reply-To: <20170115211115.GA4277@free.fr>
References: <20170115203551.6121-1-romain.naour@gmail.com>
 <20170115211115.GA4277@free.fr>
Message-ID: <dce0dca5-64b8-343d-da54-c34abae1cc28@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 15/01/2017 ? 22:11, Yann E. MORIN a ?crit :
> Romain, All,
> 
> On 2017-01-15 21:35 +0100, Romain Naour spake thusly:
>> Backport a patch from linux-4.1.y stable branch (4.1.23) to support
>> gcc >= 6 compilers. The current kernel is based on 4.1.6 from ti's
>> processor-sdk-linux-02.00.00.00 branch.
> 
> I'm not quite sure we want to handle this backport on a vendor tree.
> It's up to them to handle it.

Yes probably but there is no activity on the processor-sdk-linux-02.00.00.00
branch. I'm not sure if it still really maintained.

> 
> Why don't we simply force gcc to gcc-5 in beaglebone_defconfig and
> beaglebone_qt5_defconfig instead?

Well, It will not work for the external Linaro toolchain for example.
I guess, some user want to load the beaglebone defconfig and be able to switch
to the Linaro external toolchain.

> 
> Regards,
> Yann E. MORIN.
> 
>> Signed-off-by: Romain Naour <romain.naour@gmail.com>
>> Cc: Lothar Felten <lothar.felten@gmail.com>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
>> ---
>> The processor-sdk-linux-02.00.00.00 branch is not maintained since a
>> while (2015-10-02), maybe it's time to move to the
>> processor-sdk-linux-03.02.00 branch (4.4.32) ?

Actually, it would be great if someone can bump to this version.

Best regards,
Romain
