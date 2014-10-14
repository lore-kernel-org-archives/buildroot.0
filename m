From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 14:34:26 -0300
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <5f5516c3-f0eb-478e-ae83-be53e797f4af@email.android.com>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
 <5f5516c3-f0eb-478e-ae83-be53e797f4af@email.android.com>
Message-ID: <543D5EA2.5030804@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2014 02:29 PM, Thomas De Schampheleire wrote:
>> +comment "spidev_test needs Linux kernel to be built"
> 
> This should be '... needs a Linux ...'

I'll fix it.

> Here I think we should define the license and if possible license files, if needed using a hook to copy the license from the kernel...

Well the kernel & linux-headers aren't defining them either :)
And perf (another kernel-source based package) isn't either.

> Good idea to make this a package. We once copied this test to our own test repo, but this makes more sense.

This is a "fragile" package though, a new enough kernel version against
older headers might not build because of missing spidev defines.
On the autobuilder side that's no problem since it depends on the kernel
being built which for the time being isn't the case, but it should
probably be noted as such.

Regards.
