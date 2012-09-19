From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 20 Sep 2012 00:53:12 +0200
Subject: [Buildroot] [PATCH 0/11 v3] Rework the gettext handling
In-Reply-To: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
References: <1347836276-24262-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <505A4CD8.80900@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/17/12 00:57, Yann E. MORIN wrote:
>    - fix conversion to autotools to always build libintl, even if locales are
>      disabled, to fix packages that always require NLS
>    - thus removed Arnout's Tested-by on patch 5/11, as it has changed

  Goes to show how valuable my testing was :-(

  How about finding and fixing the packages that require NLS?

  But then, Samuel's remark becomes valid: if ENABLE_LOCALE is not true,
then libintl won't be built, so the -lintl becomes invalid.  In fact,
I would think that packages that select BR2_NEEDS_EXTERNAL_GETTEXT should
actually depend on ENABLE_LOCALE... Or usually they should be
..._IF_LOCALE instead.  For instance, I tried util-linux and it builds
perfectly without locale and gettext.

  Any chance of testing if the cases that have gettext without -if-locale
can be replaced with gettext-if-locale?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
