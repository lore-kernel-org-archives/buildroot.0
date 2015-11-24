From: Romain Naour <romain.naour@openwide.fr>
Date: Tue, 24 Nov 2015 22:29:16 +0100
Subject: [Buildroot] [PATCH 5/7] toolchain-external: bump CodeSourcery
 aarch64 to 2014.11
In-Reply-To: <565482C8.5030609@imgtec.com>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
 <1448123780-30067-5-git-send-email-romain.naour@openwide.fr>
 <565482C8.5030609@imgtec.com>
Message-ID: <5654D6AC.40908@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Vicente,

Le 24/11/2015 16:31, Vicente Olivert Riera a ?crit :
> Dear Romain Naour,
> 
> the patch subject is wrong. You are bumping to 2015.11 instead of
> 2014.11. I guess the maintainer will not mind to fix it for you.

Thanks for the review and testing :)

Actually the patch subject is correct, this is the aarch64 CodeSourcery 2014.11
toolchain... but the typo is in the Config.in prompt:

s/2015.11/2014.11/

Dear maintainer, can you fix it while applying. Thanks!

Best regards,
Romain

> 
> On 21/11/15 16:36, Romain Naour wrote:
>> Like for 2014.05 [1], this toolchain need a small fixup:
>>
>> Buildroot picks up aarch64-linux-gnu/libc/lib64 and all its contents, but
>> does not pickup aarch64-linux-gnu/libc/lib to populate the staging directory.
>> aarch64-linux-gnu/libc/lib contain a single symlink which is lost during
>> Buildroot staging install :
>>   aarch64-linux-gnu/libc/lib/ld-linux-aarch64.so.1 -> ../lib64/ld-2.20.so
>>
>> Add a custom post install staging hook to create it manually.
>>
>> A runtime testing show that /lib/ld-2.20.so and /lib/ld-linux-aarch64.so.1
>> are missing in the file system.
>>
>> Add another post install target hook to copy ld-2.20.so and create the
>> symlink.
>>
>> Runtime tested using qemu_aarch64_virt_defconfig.
>>
>> [1] http://patchwork.ozlabs.org/patch/467857/
>>
>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
>> Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> 
> Build a minimal rootfs using that toolchain after applying this patch.
> 
> Regards,
> 
> Vincent.
> 
