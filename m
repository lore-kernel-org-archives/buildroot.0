From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 14 Oct 2014 22:14:57 +0200
Subject: [Buildroot] [PATCH] spidev_test: new package
In-Reply-To: <20141014195411.GI3500@tarshish>
References: <1413301553-1592-1-git-send-email-gustavo@zacarias.com.ar>
 <20141014195411.GI3500@tarshish>
Message-ID: <d5114688-5ab5-4233-9038-8177f0f29d2e@email.android.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Baruch Siach <baruch@tkos.co.il> schreef:
>Hi Gustavo,
>
>On Tue, Oct 14, 2014 at 12:45:53PM -0300, Gustavo Zacarias wrote:
>> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
>
>[snip]
>
>> diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
>> new file mode 100644
>> index 0000000..c0ed9ef
>> --- /dev/null
>> +++ b/package/spidev_test/Config.in
>> @@ -0,0 +1,15 @@
>> +config BR2_PACKAGE_SPIDEV_TEST
>> +	bool "spidev_test"
>> +	depends on BR2_LINUX_KERNEL
>
>That is a heavy dependency. As you noted in another message, it also make the 
>autobuilder skip this package. I suggest to download just spidev_test.c from 
>http://git.kernel.org/cgit/linux/kernel/git/torvalds/linux.git/plain/Documentation/spi/spidev_test.c?id=$(SPIDEV_TEST_VERSION), 
>and make it depend on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15 (as of v3.17). This 
>solves both the autobuilder issue, and the toolchain headers dependency.

From where comes this dependency on 3.15/3.17?

The test program was in the kernel for a very long time (2.6.x)...

Also, what is the autobuilder issue you are talking about?
