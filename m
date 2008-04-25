From: Arun Reddy <reddyac@gmail.com>
Date: Fri, 25 Apr 2008 11:47:45 -0700
Subject: [Buildroot] Encountered error when building ARM toolchain (sed)
In-Reply-To: <46a136670804251136y2ff75f65s62ed647f80cbe7f2@mail.gmail.com>
References: <326f33790804242133q559ed57bjcec04560001611f9@mail.gmail.com>
	<326f33790804251043x18a84ea6wbd5ebea1385b206d@mail.gmail.com>
	<46a136670804251132g3b77c228i4a8e5e9c744f7f28@mail.gmail.com>
	<46a136670804251136y2ff75f65s62ed647f80cbe7f2@mail.gmail.com>
Message-ID: <326f33790804251147s6a726034rfbce9edb647855fd@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi John

I believe you are correct in that the problem occurs at the kernel build. I
am obtaining the error at the point where the build process states:

# let the user create his/her own config

Then it goes through and looks at the .config file in
/root/buildroot/project_build_arm/uclibc/linux-2.6.24/.config, and I get the
error shortly after.

http://img140.imageshack.us/img140/2812/sederroroo7.jpg

I will certainly contact Ulf and let him know of this problem. Thank you for
your help!

Arun

On Fri, Apr 25, 2008 at 11:36 AM, John Voltz <john.voltz@gmail.com> wrote:

> Looks to me like the kernel build is where it is failing, I think it's
> trying to sed in the EXTRA_VERSION to your kernel makefile and dropped the
> makefile path. I would complain to Ulf on the mailing list since he takes
> care of most of the ARM stuff. Tell him what kernel version you are building
> for and maybe attach your buildroot .config file. It sounds like some bug in
> the buildroot scripts to me.
>
> John
>
>
> On Fri, Apr 25, 2008 at 2:32 PM, John Voltz <john.voltz@gmail.com> wrote:
>
>> What package is the build failing at? look at that package's makefile in
>> package/your-pkg/your-pkg.mk to see if there is a bogus sed command in
>> there.
>>
>> John
>>
>>  On Fri, Apr 25, 2008 at 1:43 PM, Arun Reddy <reddyac@gmail.com> wrote:
>>
>>>  Sorry to bump my own thread, but I just want to include some more
>>> questions that hopefully someone can take a look at. I went into the sed
>>> package directory and found a script called sedcheck.sh. It makes use of a
>>> script called check-host-sed.sh, which will determine whether to build or
>>> use a sed host binary. Can someone who has used or even created this script
>>> tell me what this does?
>>>
>>> Can it somehow solve my problem shown above? Also, within the same
>>> package directory there is a sed.mk file. Does this file need to be
>>> edited for the ARM build to work? I am quite stuck on how to proceed with
>>> getting through this problem so any hint would help. Thanks a lot!
>>>
>>> On Thu, Apr 24, 2008 at 9:33 PM, Arun Reddy <reddyac@gmail.com> wrote:
>>>
>>>> Hi everyone,
>>>>
>>>> After successfully doing a build for an x86 platform, I am now
>>>> attempting to build for an ARM platform. After about half an hour into the
>>>> build process I encountered the error:
>>>>
>>>> /root/buildroot/toolchain_build_arm/bin/sed -i -e
>>>> 's,^EXTRA_VERSION=.*,EXTRA_VERSION==""."4""",g'
>>>> /root/buildroot/toolchain_build_arm/bin/sed: no input files
>>>>
>>>> Does anyone happen to know what this error is referring to? I understand
>>>> that the editor sed requires an input stream where it performs text
>>>> transformations, but why am I getting "no input files" here? Is the syntax
>>>> for the line above that's being passed for sed not correct? Any tips on how
>>>> to fix this? Thanks a lot for looking into this.
>>>>
>>>
>>>
>>> _______________________________________________
>>> buildroot mailing list
>>> buildroot at uclibc.org
>>> http://busybox.net/mailman/listinfo/buildroot
>>>
>>
>>
>
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20080425/e94bf4b0/attachment.htm 
