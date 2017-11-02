From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 2 Nov 2017 09:01:28 +0100
Subject: [Buildroot] [PATCH 1/4] package/openobex: disable on Blackfin
In-Reply-To: <20171101232343.764c231a@windsurf>
References: <20171101201137.29939-1-s.martin49@gmail.com>
 <20171101232343.764c231a@windsurf>
Message-ID: <CAHXCMMK+CvjV8fYCE=gVg1iMeoZYppJiy0HfK8QJ8pck+U_oxA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi all,

On Wed, Nov 1, 2017 at 11:23 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Wed,  1 Nov 2017 21:11:34 +0100, Samuel Martin wrote:
>> Openobex uses accept4 syscall, which is not available on Blackfin flavored uclibc.
>> So, diasble openobex on blackfin (do not add extra checks on the c-library since
>> uclibc is the only choice for Blackfin).
>>
>> Fixed:
>>   http://autobuild.buildroot.net/results/78e033fe9f43845581a5d87b21a8451f67520e44
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> ---
>>  package/openobex/Config.in | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/package/openobex/Config.in b/package/openobex/Config.in
>> index e611b8d803..4a4dc214ef 100644
>> --- a/package/openobex/Config.in
>> +++ b/package/openobex/Config.in
>> @@ -1,5 +1,6 @@
>>  config BR2_PACKAGE_OPENOBEX
>>       bool "openobex"
>> +     depends on !BR2_bfin
>>       help
>>         Free open source implementation of the Object Exchange (OBEX)
>>         protocol.
>
> What about the Config.in comment, and the reverse dependencies of
> BR2_PACKAGE_OPENOBEX ?

Well, I was not really sure about what to mention... and also wanted
to heard Waldemar opinion.
FYI, this commit 53996bee433f09a91b12aa53b2be0f7d22c0acbe seems to fix
a similar issue.

>
> Also, I'd like to hear from Waldemar about accept4 availability on
> Blackfin/uClibc-ng.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com


Regards,

-- 
Samuel
