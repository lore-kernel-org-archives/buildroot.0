From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 15 Jul 2011 11:34:13 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <201107151122.41685.yann.morin.1998@anciens.enib.fr>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <201107151122.41685.yann.morin.1998@anciens.enib.fr>
Message-ID: <CAAXf6LXwcpiXfJF26ABizR5y3KuJ2OCVHSyyhQePzxCeG-H6bg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 15, 2011 at 11:22 AM, Yann E. MORIN
<yann.morin.1998@anciens.enib.fr> wrote:
> Thomas, All,
>
> On Friday 15 July 2011 08:34:34 Thomas De Schampheleire wrote:
>> If you stick with one kernel version, then you can hardcode it in the
>> relevant scripts and Makefiles. However, when switching to another
>> version, you have to update all of these files.
>> One approach to solve all of this would be to create a symbolic link
>> output/build/linux, pointing to the output/build/linux-X directory
>> corresponding to the actually configured version.
>>
>> What do you think of that?
>
> Or you can use the BR2_LINUX_KERNEL_VERSION variable:
> ?output/build/linux-${BR2_LINUX_KERNEL_VERSION}/

This works fine in the context of buildroot. However, I need to access
these files from a non-buildroot context (external makefiles/scripts)
and so the variable BR2_LINUX_KERNEL_VERSION is not known.

Thomas
