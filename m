From: Jerzy Grzegorek <jerzy.grzegorek@trzebnica.net>
Date: Tue, 08 Oct 2013 23:59:44 +0200
Subject: [Buildroot] [PATCH 1/1] xlib_libpthread-stubs: needs thread
	support
In-Reply-To: <20131008235146.63b90c26@skate>
References: <1381267637-3957-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <20131008235146.63b90c26@skate>
Message-ID: <52548050.1070009@trzebnica.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Hi Thomas,

> Dear Jerzy Grzegorek,
>
> On Tue,  8 Oct 2013 23:27:17 +0200, Jerzy Grzegorek wrote:
>
>>   config BR2_PACKAGE_XLIB_LIBPTHREAD_STUBS
>>   	bool "libpthread-stubs"
>> +	depends on BR2_TOOLCHAIN_HAS_THREADS
> No, that doesn't work. When you add a toolchain dependency to one
> package, you must propagate it to the reverse dependencies of this
> package that are selecting this package.
>
> For example, libdrm and libxcb are both selecting
> XLIB_LIBPTHREAD_STUBS, but they do not have the
> BR2_TOOLCHAIN_HAS_THREADS, so you should add this dependency to libdrm
> and libxcb as well.

Thanks for clarification.

Regards,
Jerzy


> Best regards,
>
> Thomas
