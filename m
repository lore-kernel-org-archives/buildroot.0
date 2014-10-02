From: Nathaniel Roach <nroach44@gmail.com>
Date: Thu, 02 Oct 2014 15:56:08 +0800
Subject: [Buildroot] [PATCH] bandwidthd: fix static build
In-Reply-To: <20141002075203.GG3006@sapphire.tkos.co.il>
References: <7d38491011008b60f8ad91ec0261af046d453685.1412232567.git.baruch@tkos.co.il>
 <542CFECE.9020103@gmail.com> <20141002075203.GG3006@sapphire.tkos.co.il>
Message-ID: <542D0518.3050704@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/10/14 15:52, Baruch Siach wrote:
> Hi Nathaniel,
> 
> On Thu, Oct 02, 2014 at 03:29:18PM +0800, Nathaniel Roach wrote:
>> On 02/10/14 14:49, Baruch Siach wrote:
>>> Build against libpng requires -lz when built statically. Patch configure.ac to
>>> get the needed information from pkg-config.
>>>
>>> This patch can not be directly upstreamed as it conflicts with upstream
>>> changes, but a proper fix would be based on the same idea.
>>>
>>> Fixes:
>>> http://autobuild.buildroot.net/results/e49/e496cc4315c06de61379222d3e842d4cd05b2f71/
>>>
>>> Cc: Nathaniel Roach <nroach44@gmail.com>
>>> Signed-off-by: Baruch Siach <baruch@tkos.co.il>
>>> ---
>> Hi Baruch, I've already put a patch through [1] that bumps the version
>> in BR, which AFAIK fixes the issues that we've had on the autobuilders.
> 
> Well, I should have been aware to this patch since it seems I also commented 
> on it, but I forgot. I still think this is the right solution, since it would 
> also work if libpng changes its dependencies. Assuming, of course, that 
> bandwidthd doesn't use libz directly.
> 
> Note that I also tried to upgrade to -r10, but build fails with this specific 
> non-thread defconfig because bandwidthd now requires a toolchain supporting 
> -lpthread. So technically this specific configuration is still broken after 
> applying http://patchwork.ozlabs.org/patch/381899/.
> 
> baruch
> 
>> I'm not sure what to do in this situation but I thought I'd just note
>> this here in case my patch had been forgotten.
>>
>> [1] http://patchwork.ozlabs.org/patch/381899/
> 

I do vaguely remember some issue with -lpthread, could you send me the
config?

(It was a while ago, but I'm sure I tested the patch with a basic ARM
config, and IIRC I had the -lpthread issue once or twice but was never
able to reproduce it after my patch)

Thanks, Nathaniel.
