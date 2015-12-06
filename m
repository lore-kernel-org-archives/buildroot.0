From: Romain Naour <romain.naour@openwide.fr>
Date: Sun, 6 Dec 2015 21:07:11 +0100
Subject: [Buildroot] [PATCH 4/7] toolchain-external: bump CodeSourcery
 NIOSII to 2015.11
In-Reply-To: <565480C5.2030107@imgtec.com>
References: <1448123780-30067-1-git-send-email-romain.naour@openwide.fr>
 <1448123780-30067-4-git-send-email-romain.naour@openwide.fr>
 <565480C5.2030107@imgtec.com>
Message-ID: <5664956F.8040908@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, All,

Le 24/11/2015 16:22, Vicente Olivert Riera a ?crit :
> Dear Romain Naour,
> 
> On 21/11/15 16:36, Romain Naour wrote:
>> Some package black list CS NIOSII toolchains, mainly due to _gp link
>> issue. A follow up patch can remove the restriction case by case.
>>

While testing this toolchain, I built libcap-ng package successfully but it
still failed with buildroot internal toolchain with gcc 5.2.

I tried today with gcc 5.3 [1] which contain this patch [2].

So, libcap-ng should depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 for niosII target.
By doing this all niosII/libcap-ng issues are avoided [3] :)

[1] http://patchwork.ozlabs.org/patch/553175/

[2]
https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=3e326557585ffde323867375539f04643fcad29a

[3]
http://autobuild.buildroot.net/results/901/90186d1fe134b804c0101554296b1235dc0ccbb0/build-end.log

>> Signed-off-by: Romain Naour <romain.naour@openwide.fr>
> Reviewed-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> Tested-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>

Thanks Vicente for the review and testing for this series :)

Best regards,
Romain

> 
> Build a minimal rootfs using that toolchain after applying this patch.
> 
> Regards,
> 
> Vincent.
> 
