From: Axel Lin <axel.lin@ingics.com>
Date: Thu, 10 Oct 2013 13:21:37 +0800
Subject: [Buildroot] [PATCH 2/2] spice: bump to version 0.12.4
In-Reply-To: <20131010034138.GT4875@tarshish>
References: <1381374101.6420.1.camel@phoenix> <1381374383.6420.4.camel@phoenix>
 <20131010034138.GT4875@tarshish>
Message-ID: <CAFRkauApCcqZ-91=u=ucpj3hW76XDkZzOn-xgxfEwPo4fFJjKA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/10/10 Baruch Siach <baruch@tkos.co.il>:
> Hi Axel,
>
> On Thu, Oct 10, 2013 at 11:06:23AM +0800, Axel Lin wrote:
>> According to the ChangeLog, spice needs glib2 since 0.12.2.
>> Thus add libglib2 dependency to fix build error if !BR2_PACKAGE_LIBGLIB2.
>>
>> Signed-off-by: Axel Lin <axel.lin@ingics.com>
>> ---
>>  package/spice/Config.in | 1 +
>>  package/spice/spice.mk  | 3 ++-
>>  2 files changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/package/spice/Config.in b/package/spice/Config.in
>> index cd91833..5b28e68 100644
>> --- a/package/spice/Config.in
>> +++ b/package/spice/Config.in
>> @@ -9,6 +9,7 @@ config BR2_PACKAGE_SPICE
>>       select BR2_PACKAGE_ALSA_LIB
>>       select BR2_PACKAGE_CELT051
>>       select BR2_PACKAGE_JPEG
>> +     select BR2_PACKAGE_LIBGLIB2
>>       select BR2_PACKAGE_OPENSSL
>>       select BR2_PACKAGE_PIXMAN
>>       select BR2_PACKAGE_PYTHON_PYPARSING
>
> You also need to copy libglib2 dependencies here, specifically, wchar and
> threads.

Hi Baruch,
Thanks for the review.
I also hit a build error when BR2_PACKAGE_SPICE_TUNNEL is enabled.
(I have sent the build fix upstream, I'm waiting for the response from
spice maintainer.)
I'll send a v2 latter.

Regards,
Axel
