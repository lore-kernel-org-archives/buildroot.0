From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 8 Mar 2015 18:03:09 +0100
Subject: [Buildroot] [PATCH v2 3/4] package/avrdude: depends on libftdi1
 instead of libftdi
In-Reply-To: <20150308114842.GB2518@tarshish>
References: <1425813964-5295-1-git-send-email-s.martin49@gmail.com>
 <1425813964-5295-4-git-send-email-s.martin49@gmail.com>
 <20150308114842.GB2518@tarshish>
Message-ID: <CAHXCMMJ30MEE33mytg4xy9pZePD0Z+ezH8pJE6wzhaqJWdkyGg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Sun, Mar 8, 2015 at 12:48 PM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Samuel,
>
> On Sun, Mar 08, 2015 at 12:26:03PM +0100, Samuel Martin wrote:
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>>
>> ---
>> changes v1->v2:
>> - rebase
>> ---
>>  package/avrdude/avrdude.mk | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/avrdude/avrdude.mk b/package/avrdude/avrdude.mk
>> index 03d6490..a4e0ebd 100644
>> --- a/package/avrdude/avrdude.mk
>> +++ b/package/avrdude/avrdude.mk
>> @@ -17,8 +17,8 @@ AVRDUDE_DEPENDENCIES = elfutils libusb libusb-compat ncurses \
>>  AVRDUDE_LICENSE = GPLv2+
>>  AVRDUDE_LICENSE_FILES = avrdude/COPYING
>>
>> -ifeq ($(BR2_PACKAGE_LIBFTDI),y)
>> -AVRDUDE_DEPENDENCIES += libftdi
>> +ifeq ($(BR2_PACKAGE_LIBFTDI1),y)
>> +AVRDUDE_DEPENDENCIES += libftdi1
>
> How do you tell avrdude to link with libftdi1 and not libftdi when both are
> built? The same question goes for openocd.

Both avrdude and openocd first check for libftdi1, and use it if any,
otherwise check for libftdi.
So, unless I'm missing something this is ok; but that's true I forgot
to mention this point in the commit log. :-/

Regards,

-- 
Samuel
