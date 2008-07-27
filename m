From: Hamish Moffatt <hamish@cloud.net.au>
Date: Sun, 27 Jul 2008 11:33:17 +1000
Subject: [Buildroot] Makefile.autotools.in does not work
	wellwith	projects
In-Reply-To: <80DE307AE1CF4656A7072295EA2408F8@aeglos>
References: <1216910589.29392.18.camel@localhost>
	<20080725001242.GB25141@cloud.net.au>
	<80DE307AE1CF4656A7072295EA2408F8@aeglos>
Message-ID: <20080727013317.GA1706@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 26, 2008 at 08:53:43AM +0200, Ulf Samuelsson wrote:
> Subject: Re: [Buildroot] Makefile.autotools.in does not work wellwith  
> projects
>
>
>> On Thu, Jul 24, 2008 at 04:43:09PM +0200, Hans-Christian Egtvedt wrote:
>>> The Makefile.autotools.in uses a rule which touches a
>>> stamp_target_installed file, this does not work well with projects.
>>>
>>> The Makefile should depend on a file on the target root file system,
>>> file not there => install to target again.
>>
>> Indeed - install stamps are pure evil. They don't work with multiple
>> projects and they mean you can't "rm -rf
>> project_build_$(ARCH)/$(PROJECT)/root".
>
> I do not think that you want to have install stamps in the root file system
> because they will end up in the target (unless they are ignored when
> the rootfs is created).

I don't think you should use stamps at all - test for a target file
instead.


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
