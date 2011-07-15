From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Fri, 15 Jul 2011 13:55:38 +0200
Subject: [Buildroot] linux: why is vmlinux only available for mips?
In-Reply-To: <4E200C58.4050401@daccii.it>
References: <CAAXf6LX2ApVsZ18tTuj4eqEYtAzKBHSXBMdhSJCPL+25YcJX8A@mail.gmail.com>
 <CAAXf6LUUFNFF+xCQJX2juonZTXh8V1HBVqDRjjSJ1VMJXUyQFg@mail.gmail.com>
 <201107151122.41685.yann.morin.1998@anciens.enib.fr>
 <CAAXf6LXwcpiXfJF26ABizR5y3KuJ2OCVHSyyhQePzxCeG-H6bg@mail.gmail.com>
 <4E200C58.4050401@daccii.it>
Message-ID: <CAAXf6LWs6bOc9xPhJOCLx3nbpOqCc0mrPOZZdXEhqvgREEdgOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Jul 15, 2011 at 11:46 AM, Daniele Salvatore Albano
<info@daccii.it> wrote:
> Il 15/07/2011 11:34, Thomas De Schampheleire ha scritto:
>>
>> This works fine in the context of buildroot. However, I need to access
>> these files from a non-buildroot context (external makefiles/scripts)
>> and so the variable BR2_LINUX_KERNEL_VERSION is not known.
>>
>> Thomas
>
> If you're using *sh scripts, you can just do something like
> . /PATH/TO/BUILDROOT/.config
>
> to access buildroot config variables so you can use that variable
>
> If you're using make file i don't know, but there is a way to do it too,
> sure :)
>
> In the end, if you're using anithing else you can try to parse using regular
> expressions (needs delimiters and/or backslashes around quotes)
> BR2_LINUX_KERNEL_VERSION="?([a-zA-Z0-9\.\-]+)"?
>
> or cat, grep and cut
> cat .config | grep BR2_LINUX_KERNEL_VERSION | cut -d"\"" -f2

This is indeed a good suggestion that I didn't think of before.
For Makefiles, you can also include the .config file as-is; in fact,
this is how the buildroot Makefile does it.
I will try and see if this solves all my use-cases.

Thanks!
Thomas
