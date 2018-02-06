From: Samuel Martin <s.martin49@gmail.com>
Date: Tue, 6 Feb 2018 15:52:01 +0100
Subject: [Buildroot] [PATCH] package/avahi: Set the path to D-Bus
 system.d directory
In-Reply-To: <48448259-8bac-7a19-5008-01829608bc01@licor.com>
References: <20180123231723.5923-1-chris.lesiak@licor.com>
 <87r2q9adwa.fsf@dell.be.48ers.dk>
 <48448259-8bac-7a19-5008-01829608bc01@licor.com>
Message-ID: <CAHXCMMKQ7v4_cHNB=8T4HRqMCYi-9jYum9Xku_DP9obnZF22+A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Chris, all,

On Mon, Jan 29, 2018 at 3:19 PM, Chris Lesiak <chris.lesiak@licor.com> wrote:
> On 01/28/2018 03:09 PM, Peter Korsgaard wrote:
>
>>>>>>> "Chris" == Chris Lesiak <chris.lesiak@licor.com> writes:
>>
>>   > Add --with-dbus-sys=/usr/share/dbus-1/system.d to configure
>>   > the path to D-Bus system.d directory.  Without this option,
>>   > distribution provided configuration files were unnecessarily
>>   > stored in /etc.
>>
>> Hmm, if we want this to happen then several other packages also look
>> like they need to be fixed:
>>
>> git grep '/system\.d'
>> package/dnsmasq/dnsmasq.mk:
>> $(TARGET_DIR)/etc/dbus-1/system.d/dnsmasq.conf
>> package/miraclecast/miraclecast.mk:
>> $(TARGET_DIR)/etc/dbus-1/system.d/org.freedesktop.miracle.conf
>> package/wpa_supplicant/wpa_supplicant.mk:
>> $(TARGET_DIR)/etc/dbus-1/system.d/wpa_supplicant.conf
>>
>> When did these files move from /etc/ to /usr/share? In D-Bus 1.8.x?
>>
>
> From the D-Bus NEWS file:
>
> D-Bus 1.9.18 (2015-07-21)
> ==
>
> The ?Pirate Elite? release.
>
> Configuration changes:
>
> ? The basic setup for the well-known system and session buses is now done
>   in read-only files in ${datadir}, moving a step closer to systems
>   that can operate with an empty /etc directory. In increasing order
>   of precedence:
>
>   ? ${datadir}/dbus-1/s*.conf now perform the basic setup such as setting
>     the default message policies.
>   ? ${sysconfdir}/dbus-1/s*.conf are now optional. By default
>     dbus still installs a trivial version of each, for documentation
>     purposes; putting configuration directives in these files is deprecated.
>   ? ${datadir}/dbus-1/s*.d/ are now available for third-party software
>     to install "drop-in" configuration snippets (any packages
>     using those directories should explicitly depend on at least this
>     version of dbus).
>   ? ${sysconfdir}/dbus-1/s*.d/ are also still available for sysadmins
>     or third-party software to install "drop-in" configuration snippets
>   ? ${sysconfdir}/dbus-1/s*-local.conf are still available for sysadmins'
>     overrides
>
>   ${datadir} is normally /usr/share, ${sysconfdir} is normally /etc,
>   and "s*" refers to either system or session as appropriate.
>

A quick sum-up could have been added to the commit log...
Anyway:

Reviewed-by: Samuel Martin <s.martin49@gmail.com>

Regards,


-- 
Samuel
