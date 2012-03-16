From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 16 Mar 2012 13:32:27 -0300
Subject: [Buildroot]
 =?utf-8?q?curl_sagmentatation_fault_-_=3E_is_openssl_?=
 =?utf-8?q?theculprit_=3F?=
In-Reply-To: <CE5E726BAFB84B30B0525A23A17DB718@JohanW7>
References: <F4A167A0B310422C906F05845738AE17@JohanW7>
 <201203161653.39678.arnout@mind.be>
 <CE5E726BAFB84B30B0525A23A17DB718@JohanW7>
Message-ID: <d58c7acbbf1edf604b56d7724b89b2d8@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-03-16 13:08, Sagaert Johan wrote:

> Hi Arnout ;
>
> I looked into the openssl.mk.
>
> I don't know where armv4 stands for i am using arm9 on my target..
>
> Snip....
>
> # Some architectures are optimized in OpenSSL
> ifeq ($(ARCH),arm)
> ifneq ($(BR2_generic_arm),y)
> ifneq ($(BR2_arm610),y)
> ifneq ($(BR2_arm710),y)
> OPENSSL_TARGET_ARCH = armv4
> endif
> endif
> endif
> endif
>
> Snip...
>
> This needs some more research...
> Gone give it a try commenting it out.

Newer openssl versions incorporated ARM assembly optimizations which 
require at least an ARMv4 ISA-capable processor to utilize them.
Similar to the optimizations already in place for PowerPC and others.
So it's just a basic check that you've got at least a v4-capable CPU as 
target to enable them.
Regards.
