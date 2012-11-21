From: Chris Zankel <chris@zankel.net>
Date: Wed, 21 Nov 2012 01:36:38 -0800
Subject: [Buildroot] [PATCH 3/3] xtensa: disable libffi for Xtensa
In-Reply-To: <20121121083521.GB28785@sapphire.tkos.co.il>
References: <50ac8f69.6548420a.6f5c.2a1b@mx.google.com>
 <20121121083521.GB28785@sapphire.tkos.co.il>
Message-ID: <50ACA0A6.9020507@zankel.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On 11/21/2012 12:35 AM, Baruch Siach wrote:
> Hi Chris,
>
> On Tue, Nov 20, 2012 at 11:01:49AM -0800, Chris Zankel wrote:
>> Xtensa currently doesn't support libffi.
>>
>> Signed-off-by: Chris Zankel <chris@zankel.net>
>> ---
>>  package/libffi/Config.in |    1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/libffi/Config.in b/package/libffi/Config.in
>> index 7211f8f..4afb669 100644
>> --- a/package/libffi/Config.in
>> +++ b/package/libffi/Config.in
>> @@ -1,5 +1,6 @@
>>  config BR2_PACKAGE_LIBFFI
>>  	bool "libffi"
>> +	depends on !BR2_xtensa
>>  	help
>>  	  The libffi library provides a portable, high level
>>  	  programming interface to various calling conventions. This
> You need to recursively propagate this 'depends' to all packages selecting 
> BR2_PACKAGE_LIBFFI. This is due to a limitation of kconfig that doesn't check 
> whether a package is actually selectable.

Ah, good to know. Thanks. Will create another patch.

Cheers!
-Chris
