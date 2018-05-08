From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 8 May 2018 15:39:52 +0200
Subject: [Buildroot] [PATCH 1/1] Revert "libcrossguid: bump to version
 0.2.2"
In-Reply-To: <20180501075211.29327-1-bernd.kuhls@t-online.de>
References: <20180501075211.29327-1-bernd.kuhls@t-online.de>
Message-ID: <20180508153952.7a69b1fb@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue,  1 May 2018 09:52:11 +0200, Bernd Kuhls wrote:
> This reverts commit dededf0ff2177e5aeb051db25e178bb951debce5.
> 
> Building the only package depending on libcrossguid, Kodi, breaks due to
> this bump:
> 
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
> StringUtils.cpp: In static member function ?static std::__cxx11::string
> StringUtils::CreateUUID()?:
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
> StringUtils.cpp:1194:10: error: ?GuidGenerator? does not name a type
>    static GuidGenerator guidGenerator;
>           ^~~~~~~~~~~~~
> /home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
> StringUtils.cpp:1195:15: error: ?guidGenerator? was not declared in this
> scope
>    auto guid = guidGenerator.newGuid();
>                ^~~~~~~~~~~~~
> 
> This happens due to changes in libcrossguid:
> https://github.com/graeme-hill/crossguid/blob/master/README.md
> 
> "This is version 0.2 of CrossGuid. If you all already using CrossGuid and
> your code uses GuidGenerator then you are using version 0.1."
> 
> Even Kodi master branch has no support for libcrossguid-0.2.x yet so we
> revert the bump.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  package/libcrossguid/libcrossguid.hash | 3 +--
>  package/libcrossguid/libcrossguid.mk   | 6 +++---
>  2 files changed, 4 insertions(+), 5 deletions(-)

I've applied, but obviously this needs to be fixed in Kodi, as
reverting to an older version of libcrossguid is not a long term viable
option.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
