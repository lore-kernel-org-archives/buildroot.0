From: Markus Mayer <code@mmayer.net>
Date: Tue, 26 Sep 2017 10:24:26 -0700
Subject: [Buildroot] [PATCH] package/linux-tools: add host dependency
	for pkg-config
In-Reply-To: <b12d7ff7-36fa-4711-19e3-1500e21411d5@mind.be>
References: <20170922194144.52761-1-mmayer@broadcom.com>
 <0f81dbb9-ed0a-73b8-ff01-1490f12e2c0d@mind.be>
 <CANEuBv77Z5p5FJ=wczzy-R4kXz-FORGxJ-+uye1kHqZ_Vq6ctQ@mail.gmail.com>
 <b12d7ff7-36fa-4711-19e3-1500e21411d5@mind.be>
Message-ID: <CANEuBv54bzopyes=utNedMXLM36C5=_fNzGx4HFQj32evPMhNQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26 September 2017 at 02:42, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 26-09-17 00:00, Markus Mayer wrote:
>> So, after some hacking, I am now proposing to fix the issue thus:
>>
>> TARGET_CONFIGURE_OPTS += PKG_CONFIG="$(HOST_DIR)/bin/pkg-config
>  TARGET_CONFIGURE_OPTS already contains exactly that (cfr. package/Makefile.in,
> line 295):
> TARGET_CONFIGURE_OPTS = \
> ...
>         PKG_CONFIG="$(PKG_CONFIG_HOST_BINARY)" \
>
>> And replace TARGET_MAKE_ENV with TARGET_CONFIGURE_OPTS in the build rules.
>
>  So that's the only thing you need to do.
>
>  This could actually be useful for Buildroot in general I think.

Okay. If you like the patch, I shall send it out for inclusion. :-)

>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
