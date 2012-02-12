From: Eial Czerwacki <eial@scalemp.com>
Date: Sun, 12 Feb 2012 10:25:57 +0200
Subject: [Buildroot] segfault when running a simple c program on env
 build with buildroot
In-Reply-To: <4F3766F0.1070006@scalemp.com>
References: <4F33DCBE.7080606@scalemp.com> <20120209161150.36d6c6d6@skate>
 <4F33E363.5040107@scalemp.com> <20120209165457.2a99305b@skate>
 <4F3766F0.1070006@scalemp.com>
Message-ID: <4F377795.1000508@scalemp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/12/2012 09:14 AM, Eial Czerwacki wrote:

> On 02/09/2012 05:54 PM, Thomas Petazzoni wrote:
> 
>> Le Thu, 09 Feb 2012 17:16:51 +0200,
>> Eial Czerwacki <eial@scalemp.com> a ?crit :
>>
>>>> What is your hardware platform?
>>>>
>>>> Thomas
>>>
>>> any generic Intel/AMD cpu
>>
>> Sorry this does not exist. Your configuration states i686. If your
>> processor is only i486 or i586 compatible, then those segfaults are
>> expected since the generated code might use instructions that do not
>> exist on your processor.
>>
> 
> correction, the cpus are any cpus from the last 4-5 years, my cpu is
> e6600 for the matter.
> all of them are i686
> 
>>> I've compiled iasl, dmidecode and biosdecode with same image, you say
>>> that I cannot do that?
>>> I need the bin linked to uclibc and my desktop doesn't support uclibc
>>
>> Buildroot generates for you an uClibc cross-compilation toolchain in
>> output/host/usr/bin that you can use to cross-compile applications for
>> the target platform.
>>
>> Best regards,
>>
>> Thomas
> 
> 
> that is what I need.
> 
> Eial.
> 


ok, I've found my issue, for some reason, although I was inside the
busybox (using chroot to compile it), configure used the host's compiler
and not the uclibc based compiler, passing the
--host=i686-unknown-linux-uclibc solved this issue.

Thanks for the help.
