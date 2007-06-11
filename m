From: kevint <kevint@lanl.gov>
Date: Mon, 11 Jun 2007 09:28:56 -0700
Subject: [Buildroot] problems building x86_64 target
In-Reply-To: <20070611155624.GB28991@aon.at>
References: <3AF470EE-B97B-40FC-B806-12627EC946D0@lanl.gov>
	<20070606173826.GA4543@aon.at> <20070606184023.GA7593@aon.at>
	<FC6B700F-A073-4E83-A3AB-BFD8A9E5ED56@lanl.gov>
	<20070607101948.GH2853@aon.at> <20070611155624.GB28991@aon.at>
Message-ID: <BE02E238-29E8-49E4-9355-D95E821B1189@lanl.gov>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

I am comfortable using gcc-4.2.0 now, so that is my new target.  I  
will try out your patch today and let you know how it goes.

I am planning on adding a package for bproc, which includes a kernel  
patch, kernel module, and a few user space daemons and configs.  We  
currently have two supported kernels, 2.6.11 and 2.6.14.  I wrote a  
patch to the 2.6.11 source tree that adds the headers_install  
functionality and patched toolchain/kernel-headers/kernel-headers- 
new.makefile to include a 2.6.11 target, and it seems to work pretty  
well.  I will be doing the same for 2.6.14 later this week.  We are  
targeting 2.6.20 for our next bproc port, but that is a few months off.

Is this something you would be interested in including in the  
buildroot project?

Thanks,

Kevin

On Jun 11, 2007, at 8:56 AM, Bernhard Fischer wrote:

> On Thu, Jun 07, 2007 at 12:19:48PM +0200, Bernhard Fischer wrote:
>> On Wed, Jun 06, 2007 at 05:31:25PM -0700, kevint wrote:
>>> Hello,
>>>
>>> Thanks for your tips.  I set --disable-libmudflap in "Additional gcc
>>> options", and that got past the error I first came across, but I  
>>> also
>>> had to modify a couple things to get it to compile the rest of  
>>> the way:
>>
>> I tried this yesterday and yes, it's broken ATM.
>> The includes are pretty messed up, could be that the patch in the  
>> thread
>> with subject "sysroot support in toolchain, use correct pathes" in  
>> the
>> archives helps there. This needs proper fixing anyway and this patch
>> does make it better (didn't try x86_64, though) but since gcc-3.4
>> doesn't have sysroot support, it breaks in many funny ways, of  
>> course.
>> All vaguely recent gcc -- i.e. the 4.x series onward -- do have  
>> proper
>> sysroot support and work flawlessly.
>>
>> I'll have a look at it again.
>
> http://uclibc.org/~aldot/buildroot/buildroot.mine.cow. 
> 20070611-1730.diff.bz2
>
> This was tested with sysroot support enabled, gcc-4.2.0. I intend  
> to apply
> this once i get a chance to test if building gcc-3.4.6 without  
> sysroot works
> as expected.
>
> In the meantime you can use this patch to build a working x86_64  
> rootfs.
>
> HTH,
> Bernhard

********************************************
Kevin Tegtmeier
HPC-3 Scientific Computing Resources
Los Alamos National Laboratory
email:  kevint at lanl.gov
phone: 505.667.3488
********************************************



-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20070611/532a6208/attachment.htm 
