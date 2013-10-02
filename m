From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 02 Oct 2013 18:43:19 +0200
Subject: [Buildroot] [PATCH] Fix compilation of systemd with uclibc
In-Reply-To: <20131001144009.4117ea4c@skate>
References: <1380627492-25380-1-git-send-email-jezz@sysmic.org>
 <20131001144009.4117ea4c@skate>
Message-ID: <524C4D27.9030601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/01/13 14:40, Thomas Petazzoni wrote:
> Dear J?r?me Pouiller,
>
> On Tue,  1 Oct 2013 13:38:12 +0200, J?r?me Pouiller wrote:
>> systemd-uclibc-fix.patch was applied to systemd to provide execvpe function
>> when compiled with uclibc. However, this function is now provided by
>> libc-add-non-standard-execvpe-function.patch in uclibc package.
>>
>> These two patchs are now in conflict. This commit remove
>> systemd/systemd-uclibc-fix.patch.
>
> The thing that worries me is that we start to rely on uClibc features
> that are provided by specific patches we have added to our uClibc
> package. This means that an user using an uClibc toolchain provided by
> Analog Devices for Blackfin, or built with Crosstool-NG will no longer
> work properly to build those packages.
>
> I'm not sure what to do about this, though. Mark those packages as
> available only with glibc or the internal uClibc toolchain? Stop
> backporting uClibc feature patches (like we do for other packages) and
> tell people to work with upstream uClibc to get things fixed and
> released?

  We could make kconfig options for them and verify them in 
$sysroot/include/bits/uClibc_config.h. Or, in the case of execvpe which 
doesn't have a kconfig option, verify in $sysroot/include/unistd.h. But 
it's adding a lot of complexity.


  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
