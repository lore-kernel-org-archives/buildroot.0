From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 13 Nov 2012 09:54:04 +0100
Subject: [Buildroot] [PATCH v2 5/6] cpanminus: requires host-qemu
In-Reply-To: <20121113095008.68bb25a7@skate>
References: <1352794248-15617-1-git-send-email-arnout@mind.be>
 <1352794248-15617-5-git-send-email-arnout@mind.be>
 <20121113095008.68bb25a7@skate>
Message-ID: <50A20AAC.1070709@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/11/12 09:50, Thomas Petazzoni wrote:
> Arnout,
>
> On Tue, 13 Nov 2012 09:10:47 +0100, Arnout Vandecappelle
> (Essensium/Mind) wrote:
>> From: "Arnout Vandecappelle (Essensium/Mind)"<arnout@mind.be>
>>
>> Must also disable all non-supported architectures, including x86
>> (which doesn't have a working fork()).
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind)<arnout@mind.be>
>> ---
>> It still only works half the time.  For instance, in one arm configuration
>> I have qemu sitting there consuming 100% CPU without any output, system
>> calls, or nothing...
>
>  From my point of view, cpanminus should be marked as broken, or even
> removed unless another solution that qemu is found. The usage of
> host-qemu simply doesn't work: if the kernel headers used for the
> toolchain built by Buildroot are newer than the kernel version on the
> build machine, it will break... so it really isn't a viable solution.

  Although I agree, I leave it to Peter to make the call - a removal patch is
rather trivial.  Until then, the patches are there in case he decides to keep
cpanminus.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
