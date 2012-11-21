From: Markos Chandras <markos.chandras@gmail.com>
Date: Wed, 21 Nov 2012 10:19:27 +0000
Subject: [Buildroot] [PATCH v3] fs/common: Create initial console device
In-Reply-To: <509DBB40.1050100@mind.be>
References: <1352108694-11875-1-git-send-email-markos.chandras@gmail.com>
 <509DBB40.1050100@mind.be>
Message-ID: <CAG2jQ8gOXf=uREZt1D0Vwy7RwzBvjGeyqXtbqL=fiiykbXG5Ow@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Nov 10, 2012 at 2:26 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On 11/05/12 10:44, Markos Chandras wrote:
>>
>> From: Markos Chandras<markos.chandras@imgtec.com>
>>
>> A /dev/console node must be present in rootfs when the Linux kernel
>> boots otherwise the kernel will print the following warning:
>> "Warning: unable to open an initial console"
>>
>> This is because when we use an initramfs the /dev directory is not
>> populated at this point. This can cause problems when a program
>> (e.g ldso with early debugging enabled) opens a standard file
>> descriptor for read/write before these descriptors are actually
>> created by the init process later on.
>>
>> Signed-off-by: Markos Chandras<markos.chandras@imgtec.com>
>
>
> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  Regards,
>  Arnout
>
Hi Arnout,

Thanks. Lets see if this will make it to the final release as this
warning is a bit annoying :)

-- 
Regards,
Markos
