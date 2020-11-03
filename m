From: Romain Naour <romain.naour@gmail.com>
Date: Tue, 3 Nov 2020 21:37:06 +0100
Subject: [Buildroot] [PATCH 1/1] package/gcc: Enable gcc-8.x support for
 BR2_powerpc_spe
In-Reply-To: <20201031234922.3653a68a@windsurf>
References: <9aeb0cb1-00e7-702a-0d41-f6471e6f0302@ArcturusNetworks.com>
 <8a492cbe-907c-1699-8f6f-eb9c40d8785c@ArcturusNetworks.com>
 <20201031234922.3653a68a@windsurf>
Message-ID: <5fd0508f-8598-4cea-6451-34cbdd382fae@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

Le 31/10/2020 ? 23:49, Thomas Petazzoni a ?crit?:
> On Mon, 26 Oct 2020 15:17:35 -0400
> Michael Durrant <mdurrant@ArcturusNetworks.com> wrote:
> 
>> The GCC-7.x compiler series was the last to support BR2_powerpc_SPE CPUs
>> within GCC.? After GCC-7.x support was removed as a default in buildroot,
>> some boards, including the arcturus_ucp1020_defconfig and
>> freescale_p1025twr_defconfig will fail to compile.
>>
>> The GCC-8.x compiler series continues to support powerpc_spe CPU
>> cores, but only as an --enable-obsoleted instruction set.
>> This patch enables the use of GCC-8.x and asserts the required
>> option to enable the powerpc_spe instruction set.

This is sad to see a CPU that is still used removed from upstream GCC.
But what's the plan for next year ? GCC 8 is currently at 8.4.0 and the last
release will be available in few month.
As soon as GCC 11.1 is added to Buildroot, GCC 8 will likely be removed to keep
only 3 GCC version.
I don't see a future proof solution... maybe using a prebuilt toolchain for this
defconfig?

Best regards,
Romain

>>
>> This Patch passes compilation and run tests with the
>> arcturus/ppc-ucp1020? board.
>>
>> Tested-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
>>
>> This patch should address a noted job failure on GitLab CI
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732
>>
>> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732
>> Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
>> Signed-off-by: Michael Durrant <mdurrant@ArcturusNetworks.com>
>> ---
>> ?package/gcc/Config.in.host | 2 +-
>> ?package/gcc/gcc.mk???????? | 1 +
>> ?2 files changed, 2 insertions(+), 1 deletion(-)
> 
> Applied to master, thanks.
> 
> Thomas
> 
