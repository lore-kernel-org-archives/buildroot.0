From: Joshua Kinard <kumba@gentoo.org>
Date: Thu, 27 Mar 2014 20:02:47 -0400
Subject: [Buildroot] [PATCH v3] Disable o32 ABI for MIPS64 architectures
In-Reply-To: <5333F5E6.1040604@imgtec.com>
References: <1395843340-18539-1-git-send-email-Vincent.Riera@imgtec.com>
 <53330BEB.3090206@mind.be> <5333165D.90100@imgtec.com>
 <87txakk5tr.fsf@dell.be.48ers.dk> <5333F5E6.1040604@imgtec.com>
Message-ID: <5334BC27.5000400@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/27/2014 05:56, Vicente Olivert Riera wrote:
> On 03/26/2014 09:28 PM, Peter Korsgaard wrote:
>>>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
>>
>> Hi,
>>
>>   >>> +config BR2_MIPS_OABI32
>>   >>> +    bool
>>   >>> +    default y        if BR2_mips || BR2_mipsel
>>   >>> +    default n        if BR2_mips64 || BR2_mips64el
>>   >>
>>   >> Did you forget to remove this or is there a reason to keep it? In the
>>   >> latter case, please add an explanatory comment.
>>
>>   > Why would I want to remove this? The BR2_MIPS_OABI32 symbol is used by
>>   > glibc and uclibc packages.
>>
>> Arnout is just asking about the 'default n' line. Symbols are 'n' by
>> default, so the line doesn't do anything as far as I can see.
>>
> 
> I have maintained that line because if you remove it and then select any
> MIPS64 target, the "# BR2_MIPS_OABI32 is not set" is not present on the
> .config file.
> 
> Isn't that a problem?

Is the definition of BR2_MIPS_OABI32 missing completely, or do you see
"BR2_MIPS_OABI32=y"?  If it's missing completely, then it's virtually the
same as it being there as a comment, which will get stripped out/ignored by
the build system.  Kconfig/Kbuild (whatever it is called) only cares if the
symbol is defined to "y".  I believe that is then checked for in Makefiles
and is in a generated config.h file for use as a C #define.

That's how it works in the Linux kernel at least...

-- 
Joshua Kinard
Gentoo/MIPS
kumba at gentoo.org
4096R/D25D95E3 2011-03-28

"The past tempts us, the present confuses us, the future frightens us.  And
our lives slip away, moment by moment, lost in that vast, terrible in-between."

--Emperor Turhan, Centauri Republic
