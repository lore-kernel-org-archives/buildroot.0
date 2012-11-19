From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 19 Nov 2012 08:52:42 +0100
Subject: [Buildroot] Override CFLAGS for autotools and cmake packages
In-Reply-To: <CAOaQp__3QO6bMcWQ6q+9NScKaA8qxKu408Ybhu2R6mT=4BOjyQ@mail.gmail.com>
References: <CAOaQp__3QO6bMcWQ6q+9NScKaA8qxKu408Ybhu2R6mT=4BOjyQ@mail.gmail.com>
Message-ID: <50A9E54A.3010702@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 16/11/12 14:47, FLX Solutions, LLC wrote:
> Hi All,
>
> What is the best way to override CFLAGS for a autotools and cmake packages?
> Is it possible to ad something like LIBFOO_CMAKE=-O2... ?

  You can add options to the call to configure or cmake by setting
LIBFOO_CONF_OPT.  I don't know how you set flags for cmake, but for configure
you'd do it with:
LIBFOO_CONF_OPT = CFLAGS="$(TARGET_CFLAGS) -O2"

  Note, however, that optimization flags like -O2 are typically set in the
"gcc optimization level" choice in the "Build options" menu.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
