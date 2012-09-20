From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 21 Sep 2012 00:29:18 +0200
Subject: [Buildroot] [PATCH 10/11] toolchain/common: introduce blind
 options BR2_NEEDS_GETTEXT{, _IF_LOCALE}
In-Reply-To: <201209182328.38581.yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
 <1347836276-24262-11-git-send-email-yann.morin.1998@free.fr>
 <20120918195518.163c409d@skate> <201209182328.38581.yann.morin.1998@free.fr>
Message-ID: <505B98BE.4030601@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/18/12 23:28, Yann E. MORIN wrote:
> I know that semantically, this would not change much, but what if we were
> to rename those variables, so they are more in-line with the Config.in ones
> such as:
>    $(needs-gettext)
>    $(needs-gettext-if-locale)
>    $(needs-gettext_LDFLAGS)
>    $(needs-gettext-if-locale_LDFLAGS)
>
> ( Yes, I'm pushing for this change as much as I can!;-)   )

  For what it's worth, I too am in favour of the $(needs-gettext*) constructs.  As
mentioned in my previous mail, $(needs-gettext) itself should be left out.  But
I would name them:
$(gettext-deps-if-locale)
$(gettext-libs-if-locale)
Although the naming will never be fully self-explanatory.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
