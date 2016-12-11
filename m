From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 11 Dec 2016 11:03:52 +0100
Subject: [Buildroot] [PATCH] mimic: new package
In-Reply-To: <87shpusrzw.fsf@dell.be.48ers.dk> (Peter Korsgaard's message of
 "Sun, 11 Dec 2016 11:02:43 +0100")
References: <20161210122154.7172-1-ezequiel@vanguardiasur.com.ar>
 <87shpusrzw.fsf@dell.be.48ers.dk>
Message-ID: <87oa0isrxz.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:

Hi,

 >> +MIMIC_DEPENDENCIES = host-pkgconf
 >> +
 >> +ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_ALSA),y)
 >> +MIMIC_AUDIO_BACKEND = alsa
 >> +MIMIC_DEPENDENCIES = alsa-lib
 >> +else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PORTAUDIO),y)
 >> +MIMIC_AUDIO_BACKEND = portaudio
 >> +MIMIC_DEPENDENCIES = portaudio
 >> +else ifeq ($(BR2_PACKAGE_MIMIC_AUDIO_BACKEND_PULSEAUDIO),y)
 >> +MIMIC_AUDIO_BACKEND = pulseaudio
 >> +MIMIC_DEPENDENCIES = pulseaudio

 > configure.ac uses PKG_CHECK_MODULES to detect these, so we should depend
 > on host-pkgconf - I've fixed that in git.

Ehh, must have been -ENOCOFFEE. You indeed already have host-pkgconf,
please ignore.

-- 
Bye, Peter Korsgaard
