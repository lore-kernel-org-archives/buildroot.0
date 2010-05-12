From: Will Wagner <will_wagner@carallon.com>
Date: Wed, 12 May 2010 22:36:59 +0100
Subject: [Buildroot] Status of external toolchain support
In-Reply-To: <201005122319.35163.yann.morin.1998@anciens.enib.fr>
References: <4BEAE23A.2000906@carallon.com>
	<201005122319.35163.yann.morin.1998@anciens.enib.fr>
Message-ID: <4BEB1F7B.8010301@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>> Should you even be able to set
>> thread library when using an external toolchain?
>>      
> An external toolchain can be built to not support threading. It's an option
> in crosstool-NG, at least. Maybe other means to build toolchain also offer
> this possibility.
>
> So yes, we also have to select threading model in buildroot, and it has to
> match the external toolchain capabilities.
>
>    

I understand that options that affect packages have to be set the same. 
I can also see that you need to know if the toolchain supports threads 
or not, however once you have an external toolchain surely the packages 
you build with it do not care what version of threading is used.

If you need to tell buildroot the type of threading used (linuxthread 
old/new or nptl) then currently buildroot does not check that they match 
up, as I have an nptl toolchain but am unable to select that in 
buildroot so it is set to linuxthreads new, but I got no error.
