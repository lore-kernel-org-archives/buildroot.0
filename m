From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 14 Oct 2014 17:18:58 -0300
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <d5114688-5ab5-4233-9038-8177f0f29d2e@email.android.com>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
 <20141014195411.GI3500@tarshish>
 <d5114688-5ab5-4233-9038-8177f0f29d2e@email.android.com>
Message-ID: <543D8532.7070602@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/14/2014 05:14 PM, Thomas De Schampheleire wrote:
>> That is a heavy dependency. As you noted in another message, it also make the 
>> autobuilder skip this package. I suggest to download just spidev_test.c from 
>> http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi/spidev_test.c?id=$(SPIDEV_TEST_VERSION), 
>> and make it depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 (as of v3.17). This 
>> solves both the autobuilder issue, and the toolchain headers dependency.
> 
> From where comes this dependency on 3.15/3.17?
> 
> The test program was in the kernel for a very long time (2.6.x)...
> 
> Also, what is the autobuilder issue you are talking about?

SPI_RX_QUAD/SPI_TX_QUAD (quad-pumped spi).
The autobuilder issue is that older kernel headers won't have this
defined (example: external toolchains with newish kernel).
What Baruch proposes is probably the best solution, otherwise a ton of
#ifdefs is option 2 which would probably wouldn't be acceptable upstream.
Regards.
