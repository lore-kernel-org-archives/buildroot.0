From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 01:30:01 +0100
Subject: [Buildroot] [PATCH 1/3] vala: add vala/valac wrapper
In-Reply-To: <56CBA767.80008@zacarias.com.ar>
References: <1454428908-7183-1-git-send-email-gustavo@zacarias.com.ar>
 <56CB9E4B.20004@mind.be> <56CBA767.80008@zacarias.com.ar>
Message-ID: <56CBA809.1080409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 02/23/16 01:27, Gustavo Zacarias wrote:
> On 22/02/16 20:48, Arnout Vandecappelle wrote:
>
> >> +#!/bin/sh
> >> +$0- at VALA_VERSION@ --vapidir=@STAGING_DIR@/usr/share/vala/vapi
> >> --girdir=@STAGING_DIR@/usr/share/gir-1.0 $@
> >
> >   This makes it non-relocatable. Instead, just use the ${STAGING_DIR} that is
> > passed in the environment. That means you can't use vala/c outside of buildroot,
> > but I don't think that's an issue, right?
>
> Hi.
> Not more so than the pkg-config wrapper or the toolchain wrapper, which i can
> bet is more used/important than this one.

 Both of which should be fixed as well. But let's try to avoid adding more
non-relocatable stuff, when possible and easy.

 Regards,
 Arnout

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
