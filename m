From: Joao Pinto <Joao.Pinto@synopsys.com>
Date: Tue, 2 May 2017 14:42:20 +0100
Subject: [Buildroot] [PATCH] buildroot: adding perftest and necessary
 libraries
In-Reply-To: <20170429153713.2d079b97@free-electrons.com>
References: <68a54f3789b2b633f39c532cac87f87949368c4f.1493049330.git.jpinto@synopsys.com>
 <20170429153713.2d079b97@free-electrons.com>
Message-ID: <44b04d95-297d-0b48-033c-e86335b456d4@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hello Thomas,

?s 2:37 PM de 4/29/2017, Thomas Petazzoni escreveu:
> Hello,
> 
> On Wed, 26 Apr 2017 12:00:42 +0100, Joao Pinto wrote:
>> This patch adds the tool perftest, which a collection of tests
>> written using Infiniband verbs intended for use as a performance
>> micro-benchmark. The tests can measure the latency and bandwidth
>> of Infiniband fabrics. It also adds 3 necessary libraries:
>>
>> a) libibverbs (library that allows userspace processes to use RDMA "verbs")
>> b) librdmacm (library that allows applications to set up reliable connected
>> and unreliable datagram transfers when using RDMA adapters)
>> c) libibumad (library that provides userspace Infiniband Management Datagram
>> (uMAD) functions which sit on top of the uMAD modules in the kernel)
>>
>> Signed-off-by: Joao Pinto <jpinto@synopsys.com>
> 
> Thanks for this, but it should be split in four patches, one for each
> package you're adding. Patches should be in the right order, so that if
> we apply only the first patches, nothing breaks.
> 
> Also, please add yourself for those packages in the DEVELOPERS file.
> 

(...) snip

>> +endef
>> +PERFTEST_POST_PATCH_HOOKS += PERFTEST_RUN_AUTOGEN
> 
> Same comment as above: this doesn't work, because there is no
> dependency on host-autoconf, host-automake and host-libtool. In
> addition, the tarball you are downloading already contains the
> configure script pre-generated, so it doesn't seem really useful to
> autoreconf this package.
> 
> Could you fix the above issues and submit an updated patch series?

Of course I will check them out and send a v2 soon. Tahnks for the feedback.

> 
> Thanks a lot!
> 
> Thomas
> 

Joao
