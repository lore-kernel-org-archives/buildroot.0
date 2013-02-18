From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 18 Feb 2013 17:23:28 +0100
Subject: [Buildroot] multchoice menu with kconfig
In-Reply-To: <512253C8.2050309@petroprogram.com>
References: <5122315C.3070806@petroprogram.com> <512249D5.5020107@mind.be>
 <51224C88.4020108@petroprogram.com> <51224F93.9060102@mind.be>
 <5122506E.8030008@petroprogram.com> <512251F3.7060101@mind.be>
 <512253C8.2050309@petroprogram.com>
Message-ID: <51225580.3060206@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 18/02/13 17:16, Stefan Fr?berg wrote:
> 18.2.2013 18:08, Arnout Vandecappelle kirjoitti:
>> >On 18/02/13 17:01, Stefan Fr?berg wrote:
>>> >>And because this iso-codes package does not seem to have nothing but
>>> >>punch .po files
>>> >>and not link against anything then changing that ISO_CODES_DEPENDENCIES
>>> >>to host-gettext should be good.
>> >
>> >  Err... But iso-codes doesn't need host-gettext, does it? It probably
>> >doesn't make much sense without locale support in the toolchain, but
>> >otherwise I see no dependencies except python (which is already a
>> >buildroot dependency).
>> >
> But don't you need at least host gettext stuff to process those .po files ?
>
> I should now tell at this point that besides giving  -lintl linker flags
> and giving --disable-nls to configure scripts
> I absolutely have no idea how gettext works. :D
>
> Im confused now.
> So no dependencies at all ????? Or gettext dependencies with locale
> checking ?????? (Like Thomas said in his post)

  Sorry, correction: it does need host-gettext, but the gettext package 
(or rather, msgfmt) is one of our global dependencies.

  host-gettext is only needed for the autoconf macros (because we don't 
use the system's autoconf, only our own version).

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
