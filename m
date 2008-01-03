From: Will Wagner <will_wagner@carallon.com>
Date: Thu, 03 Jan 2008 16:37:43 +0000
Subject: [Buildroot] Build error
In-Reply-To: <40135.127.0.0.1.1198453846.squirrel@localhost>
References: <476A7DA6.7000102@carallon.com> <476A9199.4080900@promwad.com>
	<476BF768.3050201@carallon.com>
	<40135.127.0.0.1.1198453846.squirrel@localhost>
Message-ID: <477D0F57.9050204@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ivan,

Thanks for your help. Think I have worked out the problem. Appeared to 
have too large a rootfs so that the initramfs being built was very 
large. Have worked round it for now by reducing the size of the rootfs 
(qtopia4 was copying some unneeded files).

Any idea what the size limit is for a rootfs used with initramfs?

Thanks,

Will.

Ivan Kuten wrote:
>> Thanks for the hint.
>>
>> I have compiled both with and without qtopia4 and got the verbose log. I
>> can not see any difference on what is on the command line between the
>> two versions.
>>
> 
> Will,
> 
> I can suggest as workaround to set BR2_KERNEL_none=y
> and build kernel outside a buildroot tree and see if it working this way.
> 
> Regards,
> Ivan

-- 
------------------------------------------------------------------------
Will Wagner                                     will_wagner at carallon.com
Senior Project Engineer                  Office Tel: +44 (0)20 7371 2032
Carallon Ltd, Studio G20, Shepherds Building, Rockley Rd, London W14 0DA
------------------------------------------------------------------------
