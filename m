From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 07 May 2014 19:05:03 +0200
Subject: [Buildroot] [PATCH] host-pkgconf: use --static option for
 static builds
In-Reply-To: <20140507164708.GI3861@tarshish>
References: <1394021977-60055-1-git-send-email-Vincent.Riera@imgtec.com>
 <536A46A2.2010502@mind.be> <20140507164708.GI3861@tarshish>
Message-ID: <536A67BF.80306@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/05/14 18:47, Baruch Siach wrote:
> Hi Arnout,
> 
> On Wed, May 07, 2014 at 04:43:46PM +0200, Arnout Vandecappelle wrote:
>> On 05/03/14 13:19, Vicente Olivert Riera wrote:
>>> Detect when BR2_PREFER_STATIC_LIBS is selected and modify the host
>>> pkg-config wrapper to append the --static option in that case.
>>>
>>> Fixes:
>>>    http://autobuild.buildroot.net/results/161/161446dde7e8e774773eb2b34fd555f5ac22dd02/
>>>
>>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>>
>> Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>>
>>  Tested with an allpackageyesconfig with 
>> http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-x86-64-core2-full.config
>> as the toolchain (and PREFER_STATIC added to the config, of course).
>>
>>  I ran this config with and without this patch applied, by running make -k
>> and then make -k again to collect the failures. 
>>
>>  The following packages are fixed by this patch:
>> at
>> gdk-pixbuf
>> xerces
>> xfsprogs
>>
>>  The following packages fail in both cases. I did a very basic
>> analysis for about half of them, but then I gave up :-)
> 
> Thanks for testing.
> 
> [...]
> 
>> dhcpdump (fails to link agains -lusb, dependency of pcap, which doesn't use 
>> pkg-config)
> 
> Fixed by http://patchwork.ozlabs.org/patch/341970/.
> 
> Haven't you encountered the flite failure 
> http://autobuild.buildroot.net/results/3ff/3ff2217a4fccbddbdb2bc8ade68c88fc52848d36/? 
> This one is fixed by http://patchwork.ozlabs.org/patch/344396/.

 Since python and alsa-lib are enabled, flite depends on python so it doesn't
get built. That's the problem with allpackageyes: one build failure can block a
lot of other packages.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
