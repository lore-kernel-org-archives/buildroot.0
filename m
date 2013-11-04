From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 04 Nov 2013 22:40:10 +0100
Subject: [Buildroot] Patchwork oldest patches cleanup #2 (deadline
	November 17)
In-Reply-To: <CAAXf6LXQ_1pYTCyr2nLwDa1J7kJUsSZCcbs03gr3OFaDPmX6gw@mail.gmail.com>
References: <CAAXf6LV_kM18mt8h5yQScnhOPfJZ2PMNg3tvF=mBLCi8bFem2A@mail.gmail.com>
 <527746D2.5000802@mind.be>
 <CAAXf6LXQ_1pYTCyr2nLwDa1J7kJUsSZCcbs03gr3OFaDPmX6gw@mail.gmail.com>
Message-ID: <5278143A.5070505@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/11/13 12:17, Thomas De Schampheleire wrote:
> Hi Arnout,
>
> On Mon, Nov 4, 2013 at 8:03 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>> On 01/11/13 16:09, Thomas De Schampheleire wrote:
>> [snip]
>>
>>> linux: add default defconfig
>>> Arnout Vandecappelle <arnout@mind.be>
>>> http://patchwork.ozlabs.org/patch/181185
>>
>>
>>   This one didn't receive positive feedback, so I guess it's rejected. Short
>> recap: it allows you to build the kernel with the architecture's default
>> defconfig, which is typically a bloaty configuration that supports many
>> boards (if an appropriate device tree is present). IIRC the feedback was
>> that this wasn't usually appropriate for buildroot use cases.
>
> One annoyance I have is that if you want to quickly test something
> (for example when reviewing patches) and you enable a Linux kernel,
> you also have to specify a defconfig. Your patch would fix that use
> case. In such a test case, I typically don't care what is included in
> the kernel, because I would only compile-test.

  I completely agree, that was the reason that I created the patch in the 
first place.

  Unfortunately, the x86_defconfig is _huge_. And as mentioned by 
ThomasP, the other architecture's defconfigs aren't worth much. So I 
don't think this patch is really valuable after all.

  Regards,
  Arnout

> But I can also follow ThomasP's comments on that patch.
> There was a suggestion in case of x86 though, which in many cases
> would be ok for me in the above scenario. I wouldn't be against having
> just that...
>
> Best regards,
> Thomas
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
