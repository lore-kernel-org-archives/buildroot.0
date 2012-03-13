From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 14 Mar 2012 00:36:05 +0100
Subject: [Buildroot] [PATCH 19/20] alsa-lib: bump to version 1.0.25
In-Reply-To: <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
References: <1331502489-5036-1-git-send-email-gustavo@zacarias.com.ar>
 <1331502489-5036-19-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <201203140036.06296.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 11 March 2012 22:48:08 Gustavo Zacarias wrote:
> +# Can't build with static & shared at the same time (1.0.25+)
> +ifneq ($(BR2_PREFER_STATIC),y)
> +ALSA_LIB_CONF_OPT += --enable-static=no
> +else
> +ALSA_LIB_CONF_OPT += --enable-shared=no
> +endif

 Shouldn't we put this in AUTOTARGETS?  Or at least the
--enable-shared=no if BR2_PREFER_STATIC?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
