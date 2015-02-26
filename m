From: Romain Naour <romain.naour@openwide.fr>
Date: Thu, 26 Feb 2015 22:34:04 +0100
Subject: [Buildroot] [PATCH] package/libsrtp: fix static build with
	openssl
In-Reply-To: <20150226211909.GM2402@tarshish>
References: <1424985067-6640-1-git-send-email-romain.naour@openwide.fr>
 <20150226211909.GM2402@tarshish>
Message-ID: <54EF914C.4070502@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

Le 26/02/2015 22:19, Baruch Siach a ?crit :
> Hi Romain,
> 
> On Thu, Feb 26, 2015 at 10:11:07PM +0100, Romain Naour wrote:
>> diff --git a/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
>> new file mode 100644
>> index 0000000..5075762
>> --- /dev/null
>> +++ b/package/libsrtp/0002-A-autoconf-checks-for-libz-and-libdl-when-OpenSSL-is.patch
>> @@ -0,0 +1,140 @@
>> +From cfbf3609d62201c6de9b1a075a2ce6f1edd580b6 Mon Sep 17 00:00:00 2001
>> +From: jfigus <foleyj@cisco.com>
>> +Date: Thu, 26 Feb 2015 12:25:08 -0500
>> +Subject: [PATCH] A autoconf checks for libz and libdl when OpenSSL is enabled
>> + to allow for static linking of OpenSSL (via CFLAGS=-static).
>> +
> 
> Please add your SoB here.

Ok

> 
>> +---
>> + configure    | 100 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
> 
> Since we do AUTORECONF for this package anyway, please drop the configure part
> from this patch, and keep only the configure.in patch.

I just cherry-picked and extracted the patch with git format-patch without
further modifications...

Thanks for the review.

Best regards,
Romain

> 
>> + configure.in |   4 +++
>> + 2 files changed, 104 insertions(+)
> 
> baruch
> 
