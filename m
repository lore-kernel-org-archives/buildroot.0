From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 23 Feb 2014 22:48:34 +0100
Subject: [Buildroot] [git commit] binutils: install libiberty
In-Reply-To: <20140223104456.5b2585b6@skate>
References: <20140222230556.8248B8270D@busybox.osuosl.org>
 <20140223104456.5b2585b6@skate>
Message-ID: <530A6CB2.2080602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/14 10:44, Thomas Petazzoni wrote:
> Dear Peter Korsgaard,
> 
> On Sat, 22 Feb 2014 23:56:39 +0100, Peter Korsgaard wrote:
>> commit: http://git.buildroot.net/buildroot/commit/?id=70ee9fcdfcf6fc7cb214e454afe55cbffec84621
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> Some packages (actually, just oprofile) need to link against libiberty.
>> This option just installs libiberty.a so it has no effect on the target,
>> therefore it's not needed to add a config option for it.
>>
>> Before binutils-2.24, there was a bug in libiberty/Makefile.in that
>> caused libiberty to be installed regardless of the
>> --enable-install-libiberty option. This problem wasn't noticed before
>> because binutils-2.24 is not selected on any of the autobuilders: the
>> version can only be selected if an internal toolchain is used, and it
>> defaults to 2.21.
>>
>> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>  package/binutils/binutils.mk |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
> 
> Weird, seems like it didn't fix the dropwatch build problem on
> Microblaze:
> 
>   http://autobuild.buildroot.org/results/1ea/1ea98985ce06dc1b7569ef5abe2fc13090fb5f3a/build-end.log
> 
> (And yes, this build took place after this commit was merged)

 Okay, sorry, I've been careless...

 During my test I had switched to 2.22 at some point to find out what was
happening, and I stupidly forgot to remove libiberty.a again... so after
this patch the build succeeded, but only because libiberty.a is still there.

 Anyway, it is missing commit 369be6981b2 by Mike Frysinger. Patch follows.

 Regards,
 Arnout



-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
