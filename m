From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Apr 2012 16:55:06 +0200
Subject: [Buildroot] Globally disable PKG_CONFIG_PATH? [was: Re: Buildroot
 fails to build when selecting build packages]
In-Reply-To: <CAG6aBkVL0pXYVJNsk7D4OONWM6-B6Uj7aD364j8nW-mH_5ijJA@mail.gmail.com>
References: <CAG6aBkV4xjdsXcvq-AssYQ1nOw0XiBiEjTZvi2rowStdfSCJNg@mail.gmail.com>
 <201204291144.26712.arnout@mind.be>
 <CAG6aBkVmLoN-fHkGWUiOfjRM7k2swUvzNQ38p=schi+Y2Ug1hg@mail.gmail.com>
 <4F9D4BED.4050001@mind.be>
 <CAG6aBkVUgOkv5kvPZkY+YgysDQ274FdaW+0vtVU-Vk1rBudJZA@mail.gmail.com>
 <4F9D53B5.50705@mind.be>
 <CAG6aBkVL0pXYVJNsk7D4OONWM6-B6Uj7aD364j8nW-mH_5ijJA@mail.gmail.com>
Message-ID: <4F9D564A.8000602@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 04/29/12 16:47, Nigel Sollars wrote:
> Hello,
>
> Yes this one is set by the distro / profile.d scripts here is the
> OUTPUT,  the distro I am using is slackware 13.37
>
> PKG_CONFIG_PATH=/usr/local/lib/pkgconfig:/usr/lib/pkgconfig

  Right!

  Buildroot devels: should we globally unset PKG_CONFIG_PATH with an

PKG_CONFIG_PATH =
export PKG_CONFIG_PATH

in the top-level Makefile?

  Or should we add PKG_CONFIG_PATH="" to TARGET_CONFIGURE_OPTS?

  The former has the advantage that it also works for packages that 
don't use TARGET_CONFIGURE_OPTS.  But I'm not sure if maybe we _want_ 
host packages to use the system's PKG_CONFIG_PATH...


  Nigel, for now just unset PKG_CONFIG_PATH in your environment before 
calling make.  You don't have to rebuild from scratch, you can just run 
'PKG_CONFIG_PATH="" make libglib2-reconfigure'.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
