From: Stanislav Vlasic <svlasic@gmail.com>
Date: Fri, 24 Jul 2015 12:45:40 +0200
Subject: [Buildroot] [PATCH 00/47] package/kodi: bump version to 15.0
	Isengard
In-Reply-To: <mot153$97l$1@ger.gmane.org>
References: <1437597069-6448-1-git-send-email-bernd.kuhls@t-online.de>
 <mot153$97l$1@ger.gmane.org>
Message-ID: <mot50l$7aa$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sorry,

forgot to mention. All this is cross compiled with internal gcc 4.8, armhf.

On 07/24/2015 11:39 AM, Stanislav Vlasic wrote:
> Hi Bernd,
>
> On 07/22/2015 10:30 PM, Bernd Kuhls wrote:
>> Hi,
>>
>> Kodi 15.0 Isengard was released yesterday:
>> http://kodi.tv/kodi-15-0-isengard-one-release-to-rule-them-all/
>>
>> This patch series introduces two new dependencies, libsquish and
>> libplatform, also the way the host binary of TexturePacker has to be
>> built was updated. The pvr-addons were split into separate repositories,
>> the current package kodi-pvr-addons is removed. Also audio codecs, which
>> are not part of ffmpeg, were removed from Kodi and are now provided as
>> seperate addons.
>>
>> Please commit this patch series as a whole because libcec-3 is
>> incompatible with Kodi 14.2, also all the addons packages depend on
>> Kodi 15.0.
>>
>> I regard this patch series as v1, here is the changelog after v3 of the
>> previous RFC patch series:
>>
>> v1:
>> - bump to Kodi 15.0 release version
>> - added Config.in.legacy handling for PVR addons
>> - added some SoB lines to Kodi patches
>>
>> This is the changelog from the previous RFC patch series:
>>
>> v3:
>> - bump to rc2, but a later commit fixing problems with disabled
>>    BR2_PACKAGE_KODI_LIBMICROHTTPD
>> - Kodi depends on eventfd_read/write support which is missing in
>>    uclibc 0.9.33.2, I sent this patch upstream:
>>    package/kodi/0003-ALSA-make-device-change-event-support-optional.patch
>>    which is currently under discussion:
>>    https://github.com/xbmc/xbmc/pull/7551
>>    Depending on the outcome of the discussion I may block Kodi for uclibc
>>    in the final patch series
>> - libsquish is now at 1.13, upstream changed to sourceforge and
>>    the Kodi-specific stuff is now a smaller patch (Thomas)
>> - various version bumps compared to v2 (libcec, libplatform, ffmpeg)
>> - Goom and rsxs are now binary addons
>> To-Do
>> - Config.in.legacy handling
>>
>> v2:
>> - bump to beta2
>> - libsquish: use upstream source tarball and add kodi-specific patch
>>    from OpenElec (Yann)
>> - added libplatform
>> - bumped libcec (depends on Kodi 15.0, please do not commit on its own)
>> - added some screensaver and visualisation addons
>>
>> Regards, Bernd
>>
>> ....
>
> This bump does not work correctly.
>
> 1. libsquish 1.13 with kodi patch is basically crashing Kodi completley
> before it even starts creating userdata folders
> 2. There is python issue, from 2.7.8 - 2.7.10, none of addons work, thex
> crash Kodi
>
> All this is tested on Buildroot 2015.02 and 2015.05.
>
> Any thoughts on this?
>
> Regards,
> Stanislav Vlasic
