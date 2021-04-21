From: Stephane Viau (OSS) <stephane.viau@oss.nxp.com>
Date: Wed, 21 Apr 2021 07:41:05 +0000
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu: fix
 {EULA, COPYING} file hashes
In-Reply-To: <20210420202840.GF298901@scaer>
References: <20210420082953.12107-1-sebastien.szymanski@armadeus.com>,
 <20210420202840.GF298901@scaer>
Message-ID: <AM7PR04MB694978D2E0E1E5FC478DCADAA7479@AM7PR04MB6949.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann, S?bastien, all, 

>
>S?bastien, All,
>
>+Stephane, who provided tha last bump
>
>On 2021-04-20 10:29 +0200, S?bastien Szymanski spake thusly:
>> make legal-info fails on imx-vpu package:
>>
>> >>> imx-vpu 5.4.39.3 Collecting legal info
>> ERROR: EULA has wrong sha256 hash:
>> ERROR: expected: a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc
>> ERROR: got     : 7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0
>> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>>
>> ERROR: COPYING has wrong sha256 hash:
>> ERROR: expected: 69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2
>> ERROR: got     : 2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d
>> ERROR: Incomplete download, or man-in-the-middle (MITM) attack
>
>This is weird, beause the hashes were indeed updated by Stephane when he
>send the last bump:
>
>    commit a646cd27b112500ef74764979190972aaa73811c
>    Author: Stephane Viau <stephane.viau@oss.nxp.com>
>    Date:   Thu Dec 24 07:59:44 2020 +0100
>
>        package/freescale-imx/imx-vpu: bump version to 5.4.39.3
>
>        This version is aligned with 5.4.47_2.2.0 NXP Linux BSP.
>
>        Signed-off-by: Stephane Viau <stephane.viau@oss.nxp.com>
>        Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
>
>     package/freescale-imx/imx-vpu/imx-vpu.hash | 6 +++---
>     package/freescale-imx/imx-vpu/imx-vpu.mk   | 2 +-
>     2 files changed, 4 insertions(+), 4 deletions(-)
>
>So why have the hashes changed since? Stephane, any idea?

I honestly don't remember why I had to update these hash values:
- either, I had a similar failure at the time ; and I'm guessing this component is somehow
  linked to the latest EULA.txt provided by NXP (v.19 today).
- or I changed them without checking 'make legal-info' at the time (why would I do this?)

I'll try to dig into this if no one has a clear response...
  
BR,
Stephane.
  
>
>This is doubly weird, because now the EULA and COPYING are almost
>identical, except for a trailing empty line.
>
>So two questions:
>
> 1. is that the case for all other imx-related packages, that EULA and
>    COPYING are the same but for an empty trailing line?
>
> 2. if so, can we just drop the EULA now?
>
>Any feedback, anyone?
>
>Regards,
>Yann E. MORIN.
>
>> Fix the hashes of these two files.
>>
>> Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
>> ---
>>  package/freescale-imx/imx-vpu/imx-vpu.hash | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu/imx-vpu.hash
>> index 6ab67510b0..e3a53e3fb6 100644
>> --- a/package/freescale-imx/imx-vpu/imx-vpu.hash
>> +++ b/package/freescale-imx/imx-vpu/imx-vpu.hash
>> @@ -1,4 +1,4 @@
>>  # Locally computed
>>  sha256  87cb799a57df654db29403cb74a75ca5185a1517022d3a4a16b8d69056c36127  imx-vpu-5.4.39.3.bin
>> -sha256  69cbb76b3f10ac5a8c36f34df7bbdf50825815560c00a946fff2922365ef01a2  COPYING
>> -sha256  a39da2e94bd8b99eaac4325633854620ea3a55145259c3a7748c610a80714cfc  EULA
>> +sha256  2ceab29de5ea533b86f570bcc4e9ddbfb5fe85a1da4978a8613ff3fd9bed781d  COPYING
>> +sha256  7ffad92e72e5f6b23027e7cf93a770a4acef00a92dcf79f22701ed401c5478c0  EULA
>> --
>> 2.26.3
>>
>> _______________________________________________
>> buildroot mailing list
>> buildroot at busybox.net
>> http://lists.busybox.net/mailman/listinfo/buildroot
>
>--
>.-----------------.--------------------.------------------.--------------------.
>|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
>| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
>| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
>| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
>'------------------------------^-------^------------------^--------------------'
>
