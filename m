From: Rick Foos <rick@synchromeshcomputing.com>
Date: Thu, 12 Jul 2007 17:59:25 -0500
Subject: [Buildroot] PATCH: Re: svn commit:
	trunk/buildroot:package?package/busybox project target/ etc...
Message-ID: <017f01c7c4d8$4b530320$8200000a@k2>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I'm having a problem with the color corrected Makefile in revision 19078.

 The change to correct the vicolors to the PROJECT variable inserts a space
 after the uclibc target. Numerous warning messages are then displayed when
 building.

 I'm using GNU Make 3.81 on Fedora 7.

 I made an xxx target in Makefile, and displayed project, old project, and
 new project - a fix I am proposing.

 From the echo command, you can see that extra blanks are inserted after the
 target "uclibc  " that were not there in the previous release ("uclibc").

 echo "*** project: uclibc  "
 *** project: uclibc
 echo "*** oproject: uclibc"
 *** oproject: uclibc
 echo "*** nproject: uclibc"
 *** nproject: uclibc

 I simply removed the spaces between the last ' )' and the '#' start of the
 comment to correct the problem. The vi colors are still correct with this
 fix.

 Best Regards,
 Rick Foos

 ---- example of warnings.
> [rick at mspd00 build]$ make xxx
--- snip
> Makefile:231: warning: ignoring old commands for target
> `/home/rick/build/projec
> t_build_i386/uclibc'
> Makefile:247: warning: overriding commands for target
> `/home/rick/build/project_
> build_i386/uclibc'
> Makefile:242: warning: ignoring old commands for target
> `/home/rick/build/projec
> t_build_i386/uclibc'
> echo "*** project: uclibc  "
> *** project: uclibc
> echo "*** oproject: uclibc"
> *** oproject: uclibc
> echo "*** nproject: uclibc"
 *** nproject: uclibc
 --- snip


> ----- Original Message ----- 
> From: "Bernhard Fischer" <rep.dot.nop@gmail.com>
> To: "Yann E. MORIN" <yann.morin.1998@anciens.enib.fr>
> Cc: <buildroot@uclibc.org>
> Sent: Thursday, July 12, 2007 11:24 AM
> Subject: Re: [Buildroot] svn commit: 
> trunk/buildroot:package?package/busybox
> project target/ etc...
>
>
>> On Thu, Jul 12, 2007 at 05:51:47PM +0200, Yann E. MORIN wrote:
>>>Ulf, Bernhard,
>>>All,
>>>
>>>On Thursday 12 July 2007 15:56, Ulf Samuelsson wrote:
>>>> tor 2007-07-12 klockan 16:42 +0200 skrev Bernhard Fischer:
>>>> > On Thu, Jul 12, 2007 at 06:11:06AM -0700, ulf at uclibc.org wrote:
>>>> > >+PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
>>>> > >+HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
>>>> > >+BANNER:=$(strip $(subst ",, $(BR2_BANNER)))
>>>> > This breaks vi's syntax highlighing, please fix
>>>> Pls supply a template on what you want me to do.
>>>
>>>I guess something like the following:
>>>
>>>PROJECT:=$(strip $(subst ",, $(BR2_PROJECT)))
>>># Shut up you stupid vim! "
>>
>> close.
>> # ")))
>>
>> Ulf, just do :syntax on
>>
>>>HOSTNAME:=$(strip $(subst ",, $(BR2_HOSTNAME)))
>>># Shut up you stupid vim! "
>>>
>>>And so on... Maybe comments at the end of the line would do as well...
>>>
>>>Regards,
>>>Yann E. MORIN.
>>>
>>>PS. Using vi exclusively here, but no syntax highlighting, which I find
>>>    ultimately annoying. Thank you, I know (or tend to) what I'm doing!
>>> :-)
>>
>> It's handy at times..
>> _______________________________________________
>> buildroot mailing list
>> buildroot at uclibc.org
>> http://busybox.net/mailman/listinfo/buildroot
>>
>>
>>
>> -- 
>> No virus found in this incoming message.
>> Checked by AVG Free Edition.
>> Version: 7.5.476 / Virus Database: 269.10.4/897 - Release Date: 7/11/2007
-------------- next part --------------
A non-text attachment was scrubbed...
Name: vicolor-makefile.patch
Type: application/octet-stream
Size: 554 bytes
Desc: not available
Url : http://busybox.net/lists/buildroot/attachments/20070712/1763257f/attachment.obj 
