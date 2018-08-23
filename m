From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 23 Aug 2018 23:59:13 +0200
Subject: [Buildroot] [git commit] package: propagate pulseaudio
 dependencies correctly
In-Reply-To: <20180731210652.491FF8B353@busybox.osuosl.org> (Thomas
 Petazzoni's message of "Tue, 31 Jul 2018 23:12:14 +0200")
References: <20180731210652.491FF8B353@busybox.osuosl.org>
Message-ID: <87zhxcpwwe.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=68161802eb53f0af58a274904aebfa115988a468
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > The BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC dependency of
 > BR2_PACKAGE_PULSEAUDIO was not properly propagated to reverse
 > dependencies, causing the following kconfig warning:

 > warning: (BR2_PACKAGE_ESPEAK_AUDIO_BACKEND_PULSEAUDIO && BR2_PACKAGE_GST_PLUGINS_GOOD_PLUGIN_PULSE && BR2_PACKAGE_GST1_PLUGINS_GOOD_PLUGIN_PULSE && BR2_PACKAGE_KODI_PULSEAUDIO && BR2_PACKAGE_MPD_PULSEAUDIO && BR2_PACKAGE_EFL_PULSEAUDIO) selects BR2_PACKAGE_PULSEAUDIO which has unmet direct dependencies (BR2_PACKAGE_PULSEAUDIO_HAS_ATOMIC && BR2_USE_WCHAR && BR2_TOOLCHAIN_HAS_THREADS && !BR2_STATIC_LIBS && BR2_USE_MMU)

 > This commit fixes that by propagating the dependency as it should have
 > been done.

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Committed to 2018.02.x and 2018.05.x, thanks.

-- 
Bye, Peter Korsgaard
