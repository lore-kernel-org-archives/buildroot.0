From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Mon, 25 May 2020 16:17:19 +0000
Subject: [Buildroot] [PATCH v2 1/5] package/freescale-imx: Add option
 for DDR FW need
In-Reply-To: <20200520075806.GB1349614@p1g2>
References: <1588151545-9346-1-git-send-email-stephane.viau@oss.nxp.com>
 <1588151545-9346-2-git-send-email-stephane.viau@oss.nxp.com>,
 <20200520075806.GB1349614@p1g2>
Message-ID: <DB8PR04MB5755F76DB9F6F3D6D45C77FAA7B30@DB8PR04MB5755.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


>Hi Stephane,

Hi Gary, 

>> Only some i.MX8 need a DDR training firmware (8M, 8MM, 8MN). Some other
>> i.MX8 (QuadMax, QuadXPlus) rely on system controller for that task.
>> 
>> Suggested-by: Julien Olivain <julien.olivain@oss.nxp.com>
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> ---
>> v2:
>>   - introduce BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW to extend the DDR
>>     firmware selection to the whole i.MX 8M family (suggested by Gary)
>> 
>> Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>> ---
>>  package/freescale-imx/Config.in | 7 +++++++
>>  1 file changed, 7 insertions(+)
>> 
>> diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
>> index b0c7de8..6b10d2c 100644
>> --- a/package/freescale-imx/Config.in
>> +++ b/package/freescale-imx/Config.in
>> @@ -96,6 +96,13 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
>>                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN || \
>>                BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
>>  
>> +config BR2_PACKAGE_FREESCALE_IMX_NEED_DDR_FW
>> +     bool
>> +     default y if \
>> +             BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
>> +             BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM || \
>> +             BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MN
>
>I'm not against this approach but if I recall correctly Thomas is not a
>fan of those. Clearly it's useful and we'll soon add one more SoC to
>that macro (IMX8MP).
>
>As Yann mentioned on IRC:
>"Usually, when we introduce such option, it does not 'default y' based
>on some other options. Instead, the other options 'select' it."
>
>Let's try to use that approach this time, although I know the rest of
>the file is doing it wrong :-/ (my bad)
>

Makes sense, actually. I like this better too.

>But I'll answer to next patch as well, I don't think this is necessary
>to have that variable as it might be confusing for firmware-imx.

Please see my comment in the next patch.

BR, 
Stephane.

>
>Regards,
>Gary
