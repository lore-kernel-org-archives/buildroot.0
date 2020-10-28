From: Oleksandr G Zhadan <oleks@arcturusnetworks.com>
Date: Wed, 28 Oct 2020 10:56:13 -0400
Subject: [Buildroot] [PATCH 1/1] package/gcc: Enable gcc-8.x support for
 BR2_powerpc_spe
In-Reply-To: <CANQCQpajZfJ5XgvBy7kY5S00VO+0_1Yw2Pn-9d+YLAwqciG09g@mail.gmail.com>
References: <9aeb0cb1-00e7-702a-0d41-f6471e6f0302@ArcturusNetworks.com>
 <8a492cbe-907c-1699-8f6f-eb9c40d8785c@ArcturusNetworks.com>
 <CANQCQpajZfJ5XgvBy7kY5S00VO+0_1Yw2Pn-9d+YLAwqciG09g@mail.gmail.com>
Message-ID: <593646c7-e272-db84-102d-dfe853dbffac@arcturusnetworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Matthew,

Unfortunately, in the latest release of GCC 8.4 [2020-03-04], 
powerpc_spe could only be built with the --enable-obsolete option, and 
support for powerpc_spe has been removed from GCC 9.

Oleks

On 10/27/20 11:03 AM, Matthew Weber wrote:
> MIchael,
>
>
> On Mon, Oct 26, 2020 at 2:20 PM Michael Durrant
> <mdurrant@arcturusnetworks.com> wrote:
>> The GCC-7.x compiler series was the last to support BR2_powerpc_SPE CPUs
>> within GCC.  After GCC-7.x support was removed as a default in buildroot,
>> some boards, including the arcturus_ucp1020_defconfig and
>> freescale_p1025twr_defconfig will fail to compile.
>>
>> The GCC-8.x compiler series continues to support powerpc_spe CPU
>> cores, but only as an --enable-obsoleted instruction set.
>> This patch enables the use of GCC-8.x and asserts the required
>> option to enable the powerpc_spe instruction set.
>>
> Hopefully things get revived and support moves back out of obsoleted....
>
> https://lists.freebsd.org/pipermail/freebsd-ppc/2018-May/009465.html
>
>> This Patch passes compilation and run tests with the
>> arcturus/ppc-ucp1020  board.
>>
>> Tested-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
>>
>> This patch should address a noted job failure on GitLab CI
>> https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732
>>
>> Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/805461732
>> Signed-off-by: Oleksandr G Zhadan <Oleks@ArcturusNetworks.com>
>> Signed-off-by: Michael Durrant <mdurrant@ArcturusNetworks.com>
>
> Review-by: Matt Weber <matthew.weber@rockwellcollins.com>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>
>
