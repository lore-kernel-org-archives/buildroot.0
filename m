From: Area234 <area234@gmail.com>
Date: Tue, 28 May 2013 22:51:48 +0200
Subject: [Buildroot] kernel panic on VIA C3 Samuel2
In-Reply-To: <20130527132455.43298317@skate>
References: <51A3368F.4010607@gmail.com> <20130527132455.43298317@skate>
Message-ID: <51A518E4.6000703@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/27/2013 01:24 PM, Thomas Petazzoni wrote:
> Hello,
>
> On Mon, 27 May 2013 12:33:51 +0200, area234 at gmail.com wrote:
>
>> a root fs built with buildroot-2013.05-rc2 and defconfig BR2_x86_c3=y
>> BR2_TOOLCHAIN_EXTERNAL=y, terminates booting with a kernel panic at init
>> start, when run on a VIA EPIA PD board with Eden 600+256MB.
>> The same root fs works fine on qemu and on a netbook (atom n570+1GB).
>> This happens with different types of linux kernels and different boot
>> loaders.
> The base library configuration for the CodeSourcery x86 toolchain is
> Intel Pentium 4. I am not sure the VIA C3 implements the Pentium 4
> instruction set, I am not very familiar with those x86 clones.
>
>> The problem disappears changing the busybox of buildroot with a
>> statically linked one.
> Hum, this is interesting. Maybe when it's statically linked you don't
> hit the problematic code paths?
>
> Can you paste the complete panic message, so we can have a look?

Here it is. The root fs is built with the buildroot internal toolchain.

     ...

rtc_cmos 00:05: setting system clock to 2013-05-28 18:00:11 UTC (1369764011)

Freeing unused kernel memory: 364k freed

Kernel panic - not syncing: Attempted to kill init! exitcode=0x00000004

Pid: 1, comm: init Not tainted 3.6.11-mmx #1

Call Trace:

[<c0697b7a>] ? panic+0x7b/0x153

[<c04271ef>] ? do_exit+0x2ac/0x64d

[<c0427790>] ? do_group_exit+0x56/0x83

[<c042e9db>] ? get_signal_to_deliver+0x461/0x478

[<c04027e3>] ? do_bounds+0x4b/0x4b

[<c0401c7a>] ? do_signal+0x1d/0x5d5

[<c042dd55>] ? force_sig_info+0x8c/0x96

[<c04027e3>] ? do_bounds+0x4b/0x4b

[<c041dec1>] ? do_page_fault+0x328/0x363

[<c041de92>] ? do_page_fault+0x2f9/0x363

[<c041dec1>] ? do_page_fault+0x328/0x363

[<c041de92>] ? do_page_fault+0x2f9/0x363

[<c040818d>] ? sys_execve+0x4b/0x53

[<c069dcaf>] ? work_notifysig+0x24/0x35

[<c04027e3>] ? do_bounds+0x4b/0x4b

[<c04023ac>] ? do_notify_resume+0x30/0x64

[<c069dcaf>] ? work_notifysig+0x24/0x35

[<c04027e3>] ? do_bounds+0x4b/0x4b

>
>> What is wrong with the VIA board? Any suggestion is appreciated, thank
>> you in advance.
> Probably nothing is wrong with the VIA board, most likely with the
> toolchain configuration.
>
> Can you try BR2_x86_c3=y, dynamic linking, with the Buildroot internal
> toolchain?

I tried, but there is no change, the same kernel panic on EPIA board.

>
> Thanks,
>
> Thomas

Thanks again,

Fabrizio
