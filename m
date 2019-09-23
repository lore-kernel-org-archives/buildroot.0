From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 23 Sep 2019 22:12:01 +0200
Subject: [Buildroot] [PATCH v6 10/25] package/kodi-audiodecoder-*: mass
 version bump
References: <20190921192826.10143-1-bernd.kuhls@t-online.de>
 <20190921192826.10143-11-bernd.kuhls@t-online.de>
 <c0607061-3873-27f3-e0aa-9831f4c7af69@mind.be>
Message-ID: <hhln5gxaef.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 21 Sep 2019 23:05:57 +0200 schrieb Arnout Vandecappelle:

> On 21/09/2019 21:28, Bernd Kuhls wrote:
> [snip]

>> -KODI_AUDIODECODER_MODPLUG_VERSION = 1.1.0
>> -KODI_AUDIODECODER_MODPLUG_SITE = $(call
>> github,notspiff,audiodecoder.modplug,v$
(KODI_AUDIODECODER_MODPLUG_VERSION))
>> +KODI_AUDIODECODER_MODPLUG_VERSION =
>> 2aee0cf2bd8fb6d82fb32dae71f9372e0345d695
> 
>  Same remark as in kodi proper: why not use a tag like was done before?

Hi Arnout,

not all package have a tag for HEAD of the respective branch, for example
https://github.com/kodi-pvr/pvr.hts/compare/4.4.18-Leia...Leia

Upstream builds its addons by using HEAD of the respective branch and 
does not care about git tags:
https://github.com/xbmc/repo-binary-addons/commit/
7d748237dd5c0d1fcac2e4ec24c3373070bea96e

My patches copy this behaviour, to update the addons I am using a script 
which fetches the hash of the HEAD commit, downloads the tarball, writes 
its hash to the .hash file and updates <package>_VERSION.

Therefore I would like to switch to hashes instead of tags for 
<package>_VERSION.

Regards, Bernd
