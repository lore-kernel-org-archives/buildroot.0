From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Sun, 14 Mar 2021 22:45:07 +0100
Subject: [Buildroot] [PATCH v2 3/3] package/zeromq: disable package if
 binutils is affected from bug 21464
In-Reply-To: <20210314223616.5bfcc62f@windsurf.home>
References: <20210305161211.4396-1-giulio.benetti@benettiengineering.com>
 <20210305161211.4396-4-giulio.benetti@benettiengineering.com>
 <20210314223616.5bfcc62f@windsurf.home>
Message-ID: <bfde2763-b4f6-a816-101e-033b3801c003@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 3/14/21 10:36 PM, Thomas Petazzoni wrote:
> On Fri,  5 Mar 2021 17:12:11 +0100
> Giulio Benetti <giulio.benetti@benettiengineering.com> wrote:
> 
>>   config BR2_PACKAGE_ZEROMQ
>>   	bool "zeromq"
>>   	depends on BR2_INSTALL_LIBSTDCPP
>>   	depends on BR2_TOOLCHAIN_HAS_THREADS
>> +	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_21464
> 
> This is not sufficient: there are numerous packages that "select
> BR2_PACKAGE_ZEROMQ", so this "depends on" would have to be propagated.

Oh, again forgotten about Kconfig dependencies, I'm going to fix this
and the other patches too.

Thanks for reviewing.

Best regards
-- 
Giulio Benetti
Benetti Engineering sas
