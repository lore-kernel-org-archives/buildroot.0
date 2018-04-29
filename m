From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 29 Apr 2018 11:27:18 +0200
Subject: [Buildroot] [PATCH 1/1] libcrossguid: bump to version 0.2.2
References: <20180428200043.2509-1-fontaine.fabrice@gmail.com>
Message-ID: <mofgrexjul.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 28 Apr 2018 22:00:43 +0200 schrieb Fabrice Fontaine:

> -LIBCROSSGUID_VERSION = 8f399e8bd4252be9952f3dfa8199924cc8487ca4
> +LIBCROSSGUID_VERSION = v0.2.2

Hi,

building the only package depending on libcrossguid, Kodi, breaks due to 
this bump:

/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
StringUtils.cpp: In static member function ?static std::__cxx11::string 
StringUtils::CreateUUID()?:
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
StringUtils.cpp:1194:10: error: ?GuidGenerator? does not name a type
   static GuidGenerator guidGenerator;
          ^~~~~~~~~~~~~
/home/buildroot/br4/output/build/kodi-17.6-Krypton/xbmc/utils/
StringUtils.cpp:1195:15: error: ?guidGenerator? was not declared in this 
scope
   auto guid = guidGenerator.newGuid();
               ^~~~~~~~~~~~~

This happens due to changes in libcrossguid:
https://github.com/graeme-hill/crossguid/blob/master/README.md

"This is version 0.2 of CrossGuid. If you all already using CrossGuid and 
your code uses GuidGenerator then you are using version 0.1."

Even Kodi master branch has no support for libcrossguid-0.2.x yet so I 
vote for reverting this bump.

Regards, bernd
