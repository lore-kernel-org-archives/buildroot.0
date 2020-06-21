From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 21 Jun 2020 16:48:30 +0200
Subject: [Buildroot] [PATCH 02/23] package/kodi-platform: add explicit
 dependency to tinyxml
References: <20200621103806.616133-1-bernd.kuhls@t-online.de>
 <20200621103806.616133-2-bernd.kuhls@t-online.de>
 <20200621123545.GF2351@scaer>
Message-ID: <ui84sgx21h.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

Am Sun, 21 Jun 2020 14:35:45 +0200 schrieb Yann E. MORIN:

> You need to propagate the dependencies of tinyxml too.
> 
> Yes, the only dependency is on C++, which is already a dependency of
> Kodi, and thus is de-facto a dependency of kodi-platform.

here I would like to point out that package/kodi-platform/Config.in is 
not sourced in package/Config.in but in package/kodi/Config.in, guarded 
by "if BR2_PACKAGE_KODI".

All kodi-related packages, besides kodi itself, can only be selected when 
Kodi was selected before and since Kodi is written in c++ this dependency 
is and will always be fulfilled. If kodi ever switches the language it is 
written in I will come back to this topic ;)

> Yes, this is additional burden on your side, but I think we should take
> this opportunity to fix the current mess of implicitly inherited
> dependencies.

Until now you were unable to convince me that adding "depends on 
BR2_INSTALL_LIBSTDCPP", plus comments that will never be visible in 
menuconfig, to all kodi-related packages is necessary due to the way the 
kodi packages are added to menuconfig, i.e. only selectable after kodi 
was selected.

Regards, Bernd
