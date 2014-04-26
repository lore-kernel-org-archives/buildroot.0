From: Bernd Kuhls <berndkuhls@hotmail.com>
Date: Sat, 26 Apr 2014 23:26:06 +0200
Subject: [Buildroot] [PATCH v5 2/8] mesa3d: Explain dependency for i965
	DRI driver on xorg in Kconfig
References: <1396588694-6377-1-git-send-email-bernd.kuhls@t-online.de>
 <1396588694-6377-3-git-send-email-bernd.kuhls@t-online.de>
 <20140417213757.GB3270@free.fr>
Message-ID: <eskt2bxp5s.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"Yann E. MORIN" <yann.morin.1998@free.fr> wrote in
news:20140417213757.GB3270 at free.fr: 

> Bernd, All,
> 
> On 2014-04-04 07:18 +0200, Bernd Kuhls spake thusly:
>> 
>> --- a/package/mesa3d/Config.in
>> +++ b/package/mesa3d/Config.in
>> @@ -77,6 +77,9 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
>>       help
>>         Supports all Intel GPUs.  This version is most supported by
>>         Intel. 
>>  
>> +comment "DRI i965 driver depends on X.org"
>> +     depends on !BR2_PACKAGE_XORG7
> 
> This is oncorrect: the i965 driver does not have a "depends on XORG7",
> so the comment is wrong.
> 
> Either the driver is missing such a "depends on XORG7", or we should not
> add this comment.

Hi,

your patch 
http://git.buildroot.net/buildroot/commit/package/mesa3d/Config.in?
id=c65d7e55a6a9a02f39976fb06e400eb3aefde160
superseeds my patch, closed in patchworks, thanks!

Regards, Bernd
