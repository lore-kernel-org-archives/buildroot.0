From: Ryan Barnett <ryanbarnett3@gmail.com>
Date: Fri, 3 Apr 2015 07:39:18 -0500
Subject: [Buildroot] [PATCH 1/1] miraclecast: new package
In-Reply-To: <20150403050043.GM17056@tarshish>
References: <1428030634-23928-1-git-send-email-ryanbarnett3@gmail.com>
 <20150403050043.GM17056@tarshish>
Message-ID: <CALq67GAquEBk9P9svuM0WvO+bqRgeSPfCuAjtsbEGZZhN8WPwA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Fri, Apr 3, 2015 at 12:00 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Ryan,
>
> On Thu, Apr 02, 2015 at 10:10:34PM -0500, Ryan Barnett wrote:
>> diff --git a/package/systemd/systemd.mk b/package/systemd/systemd.mk
>> index 98bda02..a94ce04 100644
>> --- a/package/systemd/systemd.mk
>> +++ b/package/systemd/systemd.mk
>> @@ -77,6 +77,11 @@ else
>>  SYSTEMD_CONF_OPTS += --disable-seccomp
>>  endif
>>
>> +ifeq ($(BR2_PACKAGE_MIRACLECAST),y)
>> +# Must enable kdbus in order to get sd-events.h in staging
>> +SYSTEMD_CONF_OPTS += --enable-kdbus
>> +endif
>
> This looks somewhat unusual. And besides, kdbus should be a useful feature on
> its own right. So why not add a BR2_PACKAGE_SYSTEMD_KDBUS option, and have
> BR2_PACKAGE_MIRACLECAST select that? Setting the right kernel dependency for
> BR2_PACKAGE_SYSTEMD_KDBUS would be an interesting question, though.

I had this same idea an hour or so after submitting this patch. I
wasn't really happy with what I sent but I blanking at the time. The
miraclecast package is interesting because if I just pass the
--enable-kdbus when I build systemd, it doesn't install that
sd-events.h file. Here is what they say in miraclecast's
documentation:

systemd: A system management daemon. It is used for device-management
(udev), dbus management (sd-bus) and service management. Systemd must
be compiled with --enable-kdbus, even though kdbus isn't used, but
only the independent, experimental sd-libraries. required:
>=systemd-213

I will work on a v2 of this tonight but thanks for the feedback and
the suggestion.

Thanks,
-Ryan
