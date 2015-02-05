From: Thierry Bultel <tbultel@free.fr>
Date: Thu, 05 Feb 2015 15:56:00 +0100
Subject: [Buildroot] grub2 failure with gcc-4.9
In-Reply-To: <54D37B54.7080700@free.fr>
References: <54D367F9.4060108@free.fr>
 <20150205142015.4318baa2@free-electrons.com> <54D37B54.7080700@free.fr>
Message-ID: <54D38480.3040101@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Le 05/02/2015 15:16, Thierry Bultel a ?crit :
> Le 05/02/2015 14:20, Thomas Petazzoni a ?crit :
>> Dear Thierry Bultel,
>>
>> On Thu, 05 Feb 2015 13:54:17 +0100, Thierry Bultel wrote:
>>
>>> After some (printf) debugging, I found out that when 'loading' the
>>> builtin modules at startup, some modules names are corrupted.
>>> I am about to get into deeper investigation, but has anyone
>>> encountered it ?
>>
>> Interesting.
>>
>> First suggestions:
>>
>>   - try with another gcc 4.9 toolchain (distro toolchain or something)
>>
>>   - try with different optimization levels (default of Buildroot is -Os,
>>     try with -O0 and -O2)
>>
>
> It seems that when building the target part, grub is using CXXFLAGS
> (from $(HOST_CONFIGURE_OPTS)) in addition of TARGET_CFLAGS.
> Thus we have both -0s and -O2 in command line.
>
> Unfortunately that is not the cause of the bug, because -02 (twice)
> makes it happen.
>
> Trying another toolchain ...

FYI, loops rebooting with gcc-4.7 from 
BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_201209

>
>> Thomas
>>
>
