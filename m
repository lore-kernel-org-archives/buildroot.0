From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 16:56:38 -0300
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <20141014195411.GI3500@tarshish>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
 <20141014195411.GI3500@tarshish>
Message-ID: <543D7FF6.6060302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2014 04:54 PM, Baruch Siach wrote:

> That is a heavy dependency. As you noted in another message, it also make the 
> autobuilder skip this package. I suggest to download just spidev_test.c from 
> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi/spidev_test.c?id=$(SPIDEV_TEST_VERSION), 
> and make it depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 (as of v3.17). This 
> solves both the autobuilder issue, and the toolchain headers dependency.
> 
> baruch

Hi Baruch.
Problem is that makes it need a newish kernel which i don't like since
you can't always run the latest and greatest.
For instance i'm using it on a 3.10-ish based kernel at the moment and
if i did that i wouldn't be able to use it.
I suspect the same logic will apply to other users as well.
Regards.
