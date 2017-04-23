From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 23 Apr 2017 17:26:43 +0200
Subject: [Buildroot] [PATCH v5 08/34] package/kodi: bump to version
	17.1-Krypton
References: <20170417195433.26672-1-bernd.kuhls@t-online.de>
 <20170417195433.26672-9-bernd.kuhls@t-online.de>
 <20170422202457.GJ15086@scaer>
Message-ID: <jmtusdx7vl.ln2@ID-313208.user.individual.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am Sat, 22 Apr 2017 22:24:57 +0200 schrieb Yann E. MORIN:

>> Bumped BR2_TOOLCHAIN_GCC_AT_LEAST to 4.8 to fix compile error with
>> http://autobuild.buildroot.net/toolchains/configs/sourcery-x86.config
> 
> So is it a bug in this toolchain, or does Kodi really need gcc-4.8 now?

Hi Yann,

Kodi requires gcc-4.8, otherwise these build errors occur:

output/build/kodi-17.1-Krypton/xbmc/pvr/timers/PVRTimers.h:49:13: error: looser throw specifier for 'virtual PVR::CPVRTimers::~CPVRTimers()'

output/build/kodi-17.1-Krypton/xbmc/input/joysticks/DefaultJoystick.h:52:13: error: looser throw specifier for 'virtual JOYSTICK::CDefaultJoystick::~CDefaultJoystick()'

output/build/kodi-17.1-Krypton/xbmc/pvr/windows/GUIWindowPVRBase.h:68:13: error: looser throw specifier for 'virtual PVR::CGUIWindowPVRBase::~CGUIWindowPVRBase()'

output/build/kodi-17.1-Krypton/xbmc/pvr/timers/PVRTimers.h:49:13: error: looser throw specifier for 'virtual PVR::CPVRTimers::~CPVRTimers()'

output/build/kodi-17.1-Krypton/xbmc/pvr/PVRGUIInfo.h:49:13: error: looser throw specifier for 'virtual PVR::CPVRGUIInfo::~CPVRGUIInfo()'

output/build/kodi-17.1-Krypton/xbmc/epg/EpgContainer.h:62:13: error: looser throw specifier for 'virtual EPG::CEpgContainer::~CEpgContainer()'

output/build/kodi-17.1-Krypton/xbmc/windowing/WinEvents.h:34:19: error: looser throw specifier for 'virtual IWinEvents::~IWinEvents()'

output/build/kodi-17.1-Krypton/xbmc/peripherals/addons/AddonButtonMapping.h:44:13: error: looser throw specifier for 'virtual PERIPHERALS::CAddonButtonMapping::~CAddonButtonMapping()'

output/build/kodi-17.1-Krypton/xbmc/input/keyboard/KeymapActionMap.h:31:13: error: looser throw specifier for 'virtual KEYBOARD::CKeymapActionMap::~CKeymapActionMap()'

output/build/kodi-17.1-Krypton/xbmc/input/joysticks/generic/ButtonMapping.h:216:13: error: looser throw specifier for 'virtual JOYSTICK::CButtonMapping::~CButtonMapping()'

output/build/kodi-17.1-Krypton/xbmc/games/controllers/windows/GUIConfigurationWizard.h:52:13: error: looser throw specifier for 'virtual GAME::CGUIConfigurationWizard::~CGUIConfigurationWizard()'

output/build/kodi-17.1-Krypton/xbmc/games/controllers/dialogs/GUIDialogButtonCapture.h:32:9: error: looser throw specifier for 'virtual GAME::CGUIDialogButtonCapture::~CGUIDialogButtonCapture()'

According to https://forums.gentoo.org/viewtopic-p-7892382.html#7892382 gcc-4.7 can not compile the source code while gcc >= 4.8 can.

According to http://stackoverflow.com/questions/6539009/gcc-exception-specification-of-default-destructor it might be possible to patch Kodi to make it compile with gcc-4.7 but neither do I have the knowledge nor the interest to do that so I restricted the Kodi package to gcc >= 4.8, this meets the build depends of the official Ubuntu package which also requires gcc-4.8: https://launchpad.net/~team-xbmc/+archive/ubuntu/xbmc-ppa-build-depends

Regards, Bernd
