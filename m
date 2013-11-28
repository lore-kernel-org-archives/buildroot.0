From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Thu, 28 Nov 2013 13:49:06 +0000
Subject: [Buildroot] [PATCH v2 1/2] qt: Disable QtScript on MIPS64
In-Reply-To: <20131128130741.085cb04e@skate>
References: <1385572207-44666-1-git-send-email-Vincent.Riera@imgtec.com>
 <20131128130741.085cb04e@skate>
Message-ID: <529749D2.7010404@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/28/2013 12:07 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Wed, 27 Nov 2013 17:10:06 +0000, Vicente Olivert Riera wrote:
>
>> diff --git a/package/qt/Config.in b/package/qt/Config.in
>> index 2651d55..dd2b6d9 100644
>> --- a/package/qt/Config.in
>> +++ b/package/qt/Config.in
>> @@ -385,6 +385,7 @@ config BR2_PACKAGE_QT_OPENSSL
>>
>>   config BR2_PACKAGE_QT_SCRIPT
>>   	bool "Script Module"
>> +	depends on BR2_PACKAGE_QT_ARCH_SUPPORTS_WEBKIT
>
> I'm wondering if we shouldn't rename this option to something more
> exact: ARCH_SUPPORTS_JAVASCRIPTCORE. But I don't know, and we don't
> have well established best practices for this kind of things.
>
> Thomas
>

Maybe we could keep it as is by now, apply the quick fix for the next 
release, and decide what to do in the future. What do you think?

-- 
Vincent
