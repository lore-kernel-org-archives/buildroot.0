From: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
Date: Fri, 29 Aug 2014 16:44:55 +0100
Subject: [Buildroot] [PATCH] xscreensaver: link to gettext's libintl
 only when needed
In-Reply-To: <20140829174132.5e77dd3b@free-electrons.com>
References: <1409314139-25110-1-git-send-email-Vincent.Riera@imgtec.com>
 <20140829174132.5e77dd3b@free-electrons.com>
Message-ID: <54009FF7.9080507@imgtec.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08/29/2014 04:41 PM, Thomas Petazzoni wrote:
> Dear Vicente Olivert Riera,
>
> On Fri, 29 Aug 2014 13:08:59 +0100, Vicente Olivert Riera wrote:
>> Use the BR2_NEEDS_GETTEXT option to link to gettext's libintl only when
>> it's necessary.
>>
>> Fixes:
>>    http://autobuild.buildroot.net/results/ace/aceb83ff92957accab4e2f64e450b2d2837cb2ba/
>>
>> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>> ---
>>   package/xscreensaver/xscreensaver.mk |    2 +-
>>   1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/package/xscreensaver/xscreensaver.mk b/package/xscreensaver/xscreensaver.mk
>> index 0e84d27..1d88c03 100644
>> --- a/package/xscreensaver/xscreensaver.mk
>> +++ b/package/xscreensaver/xscreensaver.mk
>> @@ -14,7 +14,7 @@ XSCREENSAVER_LICENSE_FILES = hacks/screenhack.h hacks/glx/chessmodels.h
>>   XSCREENSAVER_DEPENDENCIES = jpeg libglade libgtk2 xlib_libX11 xlib_libXt \
>>   	$(if $(BR2_PACKAGE_GETTEXT),gettext)
>>
>> -XSCREENSAVER_CONF_ENV = $(if $(BR2_PACKAGE_GETTEXT),LIBS=-lintl)
>> +XSCREENSAVER_CONF_ENV = $(if $(BR2_NEED_GETTEXT_IF_LOCALE),LIBS=-lintl)
>>
>>   # otherwise we end up with host include/library dirs passed to the
>>   # compiler/linker
>
> There is already http://patchwork.ozlabs.org/patch/383576/, which seems
> more complete than your patch, no?
>
> Thomas
>

Oops, I missed it. Yes, that patch is more complete. Ignore mine.

-- 
Vincent
