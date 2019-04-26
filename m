From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 27 Apr 2019 01:26:43 +0200
Subject: [Buildroot] TestPerlDBDmysql continues to fail
In-Reply-To: <20190423095813.767fe22c@windsurf>
References: <20190422221208.3b4349c8@windsurf>
 <CAB0FRsvE=G_FOFMsj8awHrCBK3fDJLqD1AZdCLaafsMJ90cQeg@mail.gmail.com>
 <20190423095813.767fe22c@windsurf>
Message-ID: <591fb130-985f-8d8f-b99e-7c7b76e4469d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 23/04/2019 09:58, Thomas Petazzoni wrote:
> On Tue, 23 Apr 2019 09:44:33 +0200
> Fran?ois Perrad <francois.perrad@gadz.org> wrote:
> 
>> I could reproduce the issue.
>> It is weird:
>> - the build step seems good, the image  rootfs.cpio is created
>> - but the system does not boot, there is a kernel panic, see
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/199339668/artifacts/file/test-output/TestPerlDBDmysql-run.log
> 
> I can reproduce the issue locally. If I take the same rootfs.cpio, and
> boot it with -M versatilepb and the kernel-versatile kernel image, it
> boots fine.
> 
> However that is strange because:
> 
>  - The ARMv5 user-space that is being built should work fine under an
>    ARMv7 machine
> 
>  - All other Perl test cases are using the same base configuration
>    (ARMv5) and booting under an ARMv7 Qemu machine + kernel, and they
>    work fine.

 The actual error is:

Unpacking initramfs...

Initramfs unpacking failed: write error

(it's quite a bit before the end of the file).

 This rootfs is about 40MB, while the others are around 32MB. So I guess it just
doesn't fit in the 128MB given to the system.

 Regards,
 Arnout
