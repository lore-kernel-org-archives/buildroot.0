From: Mirza Krak <mirza.krak@northern.tech>
Date: Wed, 15 Aug 2018 09:21:53 +0200
Subject: [Buildroot] [PATCH 3/8] package/mender: add dep on
 BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
In-Reply-To: <87wossnrnw.fsf@tkos.co.il>
References: <20180814231337.19114-1-mirza.krak@northern.tech>
 <20180814231337.19114-4-mirza.krak@northern.tech> <87wossnrnw.fsf@tkos.co.il>
Message-ID: <CADHdJwBgS17SekSG+Ex3CJ3FmGB34aDxryoG9-sQQR8jajSttg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Aug 15, 2018 at 7:08 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Mirza,

Hi Baruch,

>
> Mirza Krak writes:
>> The Mender client uses fw_printenv/fw_setenv to manipulate the U-boot
>> environment, e.g to change the boot candidate after a update has been
>> done.
>>
>> Signed-off-by: Mirza Krak <mirza.krak@northern.tech>
>> ---
>>  package/mender/Config.in | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/package/mender/Config.in b/package/mender/Config.in
>> index e461857486..8c2838c64a 100644
>> --- a/package/mender/Config.in
>> +++ b/package/mender/Config.in
>> @@ -3,6 +3,8 @@ config BR2_PACKAGE_MENDER
>>       depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
>>       depends on BR2_PACKAGE_HOST_GO_CGO_LINKING_SUPPORTS
>>       depends on BR2_TOOLCHAIN_HAS_THREADS
>> +     depends on BR2_PACKAGE_UBOOT_TOOLS
>> +     depends on BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV
>
> For non-obvious dependencies like these we prefer 'select'. Also, since
> this is a run-time only dependency, there should be a comment saying
> that. So:
>
>       select BR2_PACKAGE_UBOOT_TOOLS # runtime
>       select BR2_PACKAGE_UBOOT_TOOLS_FWPRINTENV # runtime

Acknowledged.

-- 
Mirza Krak | Embedded Solutions Architect | https://mender.io

 Northern.tech AS | @northerntechHQ
