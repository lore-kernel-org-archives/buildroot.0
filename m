From: H Hartley Sweeten <hartleys@visionengravers.com>
Date: Tue, 4 Oct 2011 11:55:03 -0500
Subject: [Buildroot] [PATCH] Rename package/libsigc to package/libsigc2
In-Reply-To: <201110040814.04539.arnout@mind.be>
References: <ADE657CA350FB648AAC2C43247A983F001F39DC56AC8@AUSP01VMBX24.collaborationhost.net>
 <201110040814.04539.arnout@mind.be>
Message-ID: <ADE657CA350FB648AAC2C43247A983F001F39DC56DD3@AUSP01VMBX24.collaborationhost.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Monday, October 03, 2011 11:14 PM, Arnout Vandecappelle wrote:
> On Monday 03 October 2011 19:06:08, H Hartley Sweeten wrote:
>> Rename the libsigc package to libsigc2 so that the older 1.2 version
>> of libsigc++ can also be added to packages/.
>> 
>> Signed-off-by: H Hartley Sweeten <hsweeten@visionengravers.com>
>> 
>> ---

[...]

>> diff --git a/package/libsigc2/Config.in b/package/libsigc2/Config.in
>> new file mode 100644
>> index 0000000..cae8da1
>> --- /dev/null
>> +++ b/package/libsigc2/Config.in
>> @@ -0,0 +1,13 @@
>> +config BR2_PACKAGE_LIBSIGC
>
>  Shouldn't it be renamed BR2_PACKAGE_LIBSIGC2 then?

Yes, it should be... I missed that, sorry.  I just posted a new patch.

>  Perhaps adding a hidden BR2_PACKAGE_LIBSIGC for backwards compatibility, like 
> so (untested):
>
> bool BR2_PACKAGE_LIBSIGC
>    select BR2_PACKAGE_LIBSIGC2

No.  Nothing in Buildroot currently has this version of libsigc++ as a dependency
so there shouldn't be any backward compatibility issues.

Thanks,
Hartley
