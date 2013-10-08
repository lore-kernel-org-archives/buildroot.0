From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 08 Oct 2013 18:47:37 +0200
Subject: [Buildroot] [PATCH] pkg-infra: log current message
In-Reply-To: <20131007191905.7715dd69@skate>
References: <1381058388-24055-1-git-send-email-yann.morin.1998@free.fr>
 <30033387.d25L1SpIx8@sagittae> <20131007140733.173904b6@skate>
 <20131007164829.GB9561@free.fr> <20131007165956.GE9561@free.fr>
 <20131007191905.7715dd69@skate>
Message-ID: <52543729.2010809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/07/13 19:19, Thomas Petazzoni wrote:
> Dear Yann E. MORIN,
>
> On Mon, 7 Oct 2013 18:59:56 +0200, Yann E. MORIN wrote:
>
>>> It would then be the responsibility of the user to provide such a
>>> script. We could provide a simple script that just do this logging as an
>>> example.
>>
>> I have another interesting idea about such a script: detect whether a
>> package overwrites or otherwise modifies a file already existing in
>> staging/ and/or target/ to assess for the sanity of the packaging.
>
> I believe there are cases where we are doing this today, and where it
> is valid. Think for example the full-blown versions of some commands
> that overwrite the symbolic link installed by Busybox.
>
>> We could also add another sanity-check to look at build issues (eg.
>> build-path in RPATH, build-path in scripts...).
>
> Right! However, I don't see why those checks should be in some external
> scripts that the user should install. I believe those checks should be
> part of the Buildroot core, possibly with a Config.in option to decide
> whether a check failure should result to a global build failure or just
> a warning (default value would be a warning, a global build failure
> could be used in the autobuilders, for example).

  I agree with that. Any check or whatever that makes life easier for a 
contributor should be part of the mainline.

  That said, it still makes sense to give the possibility to add custom 
pre/post hooks. And autobuilder-specific things that are _not_ relevant 
to the generic contributor would fit there.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
