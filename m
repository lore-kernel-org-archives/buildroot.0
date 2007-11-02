From: Ulf Samuelsson <ulf@atmel.com>
Date: Fri, 2 Nov 2007 07:23:03 +0100
Subject: [Buildroot] per-project uclibc configuration does notreally w
	ork
References: <C0lYQrgSKC8w.XPtGTLcB@mailout.dof.se>
	<20071102001137.GB18120@cloud.net.au>
Message-ID: <004101c81d19$0de49050$01c4af0a@Glamdring>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> On Thu, Nov 01, 2007 at 06:16:00PM +0100, Ulf Samuelsson wrote:
>> buildroot's project support (eg saveconfig target) appears to offer
>> per-project uClibc .config support and per-project uClibc version 
>> selection.
>>
>> => Once you have built
>>   the toolchain for one
>>   project the rest of
>>   the projects should
>>   use that as an external
>>   toolchain and none of the
>>   gcc,binutils,uClibc
>>   configuration items in
>>   Toolchain should be
>>   changed.
>
> OK. So if I have 2+ projects I wish to build using a common toolchain,
> would you suggest making an additional project just to build the
> toolchain (no packages, no target filesystems) then setting the other
> projects to all use an external toolchain?
>

It is a matter of taste. You can do it either way.
I ususally just build to toolchain with one project
and set the toolchain parameters to the same for the other projects.

It is probably better to have one project to build the toolchain.

>> Is there much benefit in trying to share package builds between
>> projects, as buildroot does right now?
>>
>> => Yes, if you build several
>>    boards with a common
>>    toolchain you reduce
>>    the build time for each
>>    package to a fraction
>>    of a second.
>
> Once the toolchain is common, you could achieve most of the same
> speedup using ccache, but guarantee the correct results. The current
> scheme can't guarantee that; you don't know what autoconf might pick up
> which is target specific (other installed packages etc).
>

I dont see how ccache can help you to speed up building one source
tree just because you have built another source tree containing the
iden tical code and a different ccache directory.


> Admittedly if you build a toolchain for each project then you can't
> effectively use ccache (the compiler will appear to be different, even
> if it is actually the same).
>
>
> Hamish
> -- 
> Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
>


Best Regards
Ulf Samuelsson 
