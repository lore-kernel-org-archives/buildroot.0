From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue, 24 Feb 2015 15:11:29 +0100
Subject: [Buildroot] [PATCH v2] automake: use whenever possible the
	ACLOCAL_HOST_DIR variable
In-Reply-To: <CAHkwnC9Za1MtJGv7iqZop=a3Gw+GaHvod1hrY_RJPmB+SaJpvA@mail.gmail.com>
References: <1423392056-30339-1-git-send-email-fabio.porcedda@gmail.com>
 <CAHkwnC9Za1MtJGv7iqZop=a3Gw+GaHvod1hrY_RJPmB+SaJpvA@mail.gmail.com>
Message-ID: <CAAXf6LXR8G9UnwLoTbcUHDLypi7J-2-78EeZ8WQ3Wzk3jAsw2g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Feb 24, 2015 at 11:59 AM, Fabio Porcedda
<fabio.porcedda@gmail.com> wrote:
> On Sun, Feb 8, 2015 at 11:40 AM, Fabio Porcedda
> <fabio.porcedda@gmail.com> wrote:
>> Use the ACLOCAL_HOST_DIR in the GTK_DOC_M4_INSTALL hook.
>>
>> Move the ACLOCAL_HOST_DIR definition at the beginning so the definition
>> is ahead the utilization.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>> Cc: Romain Naour <romain.naour@openwide.fr>
>> ---
>>  package/automake/automake.mk | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/package/automake/automake.mk b/package/automake/automake.mk
>> index a3fd18c..84f05dc 100644
>> --- a/package/automake/automake.mk
>> +++ b/package/automake/automake.mk
>> @@ -12,8 +12,11 @@ AUTOMAKE_LICENSE_FILES = COPYING
>>
>>  HOST_AUTOMAKE_DEPENDENCIES = host-autoconf
>>
>> +ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
>> +
>>  define GTK_DOC_M4_INSTALL
>> -       $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 $(HOST_DIR)/usr/share/aclocal/gtk-doc.m4
>> +       $(INSTALL) -D -m 0644 package/automake/gtk-doc.m4 \
>> +               $(ACLOCAL_HOST_DIR)/gtk-doc.m4
>>  endef
>>
>>  # ensure staging aclocal dir exists
>> @@ -29,5 +32,4 @@ $(eval $(host-autotools-package))
>>  # variables used by other packages
>>  AUTOMAKE = $(HOST_DIR)/usr/bin/automake
>>  ACLOCAL_DIR = $(STAGING_DIR)/usr/share/aclocal
>> -ACLOCAL_HOST_DIR = $(HOST_DIR)/usr/share/aclocal
>>  ACLOCAL = $(HOST_DIR)/usr/bin/aclocal -I $(ACLOCAL_DIR)
>> --

Can you clarify why this is necessary?
Do you have a specific case where this is wrong?
