From: Romain Naour <romain.naour@gmail.com>
Date: Mon, 14 Jan 2019 22:00:04 +0100
Subject: [Buildroot] [PATCH 2/2] package/bcc: new package
In-Reply-To: <CANQCQpbETXs2W10sKBkJtqzcs1trhCSLf+1x7C7eOQW+TZMaSg@mail.gmail.com>
References: <20190113212118.14512-1-romain.naour@gmail.com>
 <20190113212118.14512-2-romain.naour@gmail.com>
 <CANQCQpbETXs2W10sKBkJtqzcs1trhCSLf+1x7C7eOQW+TZMaSg@mail.gmail.com>
Message-ID: <f8ce25c9-d492-a723-8aff-8cdb8ad1c9a0@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matt,

Le 14/01/2019 ? 21:43, Matthew Weber a ?crit?:
> Romain,
> 
> 
> On Sun, Jan 13, 2019 at 3:21 PM Romain Naour <romain.naour@gmail.com> wrote:
>>
>> From: Romain Naour <romain.naour@smile.fr>
>>
>> Before using bcc, you need to copy the kernel source code to
>> "/lib/module/<kernel version>/build" on the target.
>> That's because the clang frontend build eBPF code at runtime.
>>
>> There are some issues with this frontend due to the hardcoded
>> architecture support and the use of GNU tuple (x86_64-unknown-linux-gnu).
>> That's why the bcc package dependency is limited to Glibc toolchain.
>>
>> bcc needs tracing support, at least CONFIG_KPROBES, CONFIG_BPFILTER
>> and CONFIG_BPF_JIT. See [1] for details.
>>
>> bcc needs BPF target support in llvm libraries.
>> Add a patch disabling man pages.
>>
>> [1] https://github.com/iovisor/bcc/blob/master/docs/kernel-versions.md
>>
>> Signed-off-by: Romain Naour <romain.naour@smile.fr>
>> Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>
>> ---
>> The needs of kernel sources on the target is anoying for small devices.
>> At least, I'm able to complete the bcc tutorial [1] on my x86_64 target.
> 
> Suggest updating LINUX_KCONFIG_FIXUP_CMDS to include enabling of the
> BPF features when this package is selected.

Indeed, I thought about it but I need to double check the kernel options that
are mandatory.

> 
>>
>> [1] https://github.com/iovisor/bcc/blob/master/docs/tutorial.md
>> ---

[...]

>> +       help
>> +         BPF Compiler Collection (BCC)
>> +
>> +         BCC is a toolkit for creating efficient kernel tracing and
>> +         manipulation programs, and includes several useful tools and
>> +         examples. It makes use of extended BPF (Berkeley Packet
>> +         Filters), formally known as eBPF, a new feature that was
>> +         first added to Linux 3.15. Much of what BCC uses requires
>> +         Linux 4.1 and above.
>> +
>> +         Note: Before using bcc, you need to copy the kernel source
>> +         code to the target. By default bcc use:
>> +         "/lib/module/<kernel version>/build". That's because the
>> +         clang frontend build eBPF code at runtime.
> 
> Very interesting patch and package.  Thanks for sending it in.  I know
> I've added it to my list to tinker with.

You're welcome :)

My colleague Jugurtha was working on debugging tools like bcc during his
internship. We are experimenting bcc in the context of Buildroot.

Also, it allow to have (yet) another use case for llvm/clang merged this year
thanks to Valentin's work.

Best regards,
Romain

> 
> Matt
> 
