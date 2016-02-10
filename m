From: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
Date: Wed, 10 Feb 2016 08:58:11 -0300
Subject: [Buildroot] [PATCH v2] package: aespipe: add host variant
In-Reply-To: <20160206212831.48600f93@free-electrons.com>
References: <1454634772-19009-1-git-send-email-ariel@vanguardiasur.com.ar>
 <20160206212831.48600f93@free-electrons.com>
Message-ID: <56BB25D3.3040205@vanguardiasur.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

El 06/02/16 a las 17:28, Thomas Petazzoni escribi?:
> Dear Ariel D'Alessandro,
> 
> On Thu,  4 Feb 2016 22:12:52 -0300, Ariel D'Alessandro wrote:
>> Having the host version may allow post-image scripts to encrypt the
>> resulting image with aespipe (and decrypt it in the update tool on the
>> target).
>>
>> Signed-off-by: Ariel D'Alessandro <ariel@vanguardiasur.com.ar>
> 
> We generally don't use "package: <package>:" as a commit title prefix.
> We either use just "<package>: " or "package/<package>: ". I've
> adjusted the commit title accordingly.
> 
>> diff --git a/package/aespipe/Config.in.host b/package/aespipe/Config.in.host
>> new file mode 100644
>> index 0000000..43b5bcf
>> --- /dev/null
>> +++ b/package/aespipe/Config.in.host
>> @@ -0,0 +1,9 @@
>> +config BR2_PACKAGE_HOST_AESPIPE
>> +	bool "host aespipe"
>> +	help
>> +	  aespipe program is AES encrypting or decrypting pipe. It reads from
>> +	  standard input and writes to standard output. It can be used to
>> +	  create and restore encrypted tar or cpio archives. It can be used to
>> +	  encrypt and decrypt loop-AES compatible encrypted disk images.
> 
> The lines were slightly too long here, so I rewrapped this paragraph.
> 
> And then I applied your patch. Thanks a lot!

Great :) Thank you very much!

Regards,

-- 
Ariel D'Alessandro, VanguardiaSur
www.vanguardiasur.com.ar
