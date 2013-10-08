From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 8 Oct 2013 20:09:55 +0200
Subject: [Buildroot] [PATCH] Allow PHP to compile ans link with
 berkeleydb 6
In-Reply-To: <52543DD9.3020909@mind.be>
References: <1381146130-8575-1-git-send-email-jezz@sysmic.org>
 <20131007135727.3cb4150d@skate> <5252A7DF.5020008@zacarias.com.ar>
 <20131007142614.45304395@skate> <5252A958.6010001@zacarias.com.ar>
 <20131007145734.781254cd@skate> <5253B234.60001@mind.be>
 <20131008100141.252ec3ae@skate> <52543DD9.3020909@mind.be>
Message-ID: <20131008200955.02fe19bc@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Arnout Vandecappelle,

On Tue, 08 Oct 2013 19:16:09 +0200, Arnout Vandecappelle wrote:

> > However, AGPLv3+ (the new license of berkeleydb) is a fairly strong
> > license, so I'm quite sure a number of embedded system markers would be
> > interested in having the ability to build Python, or Perl, against a
> > non-strongly-copyleft licensed version of berkeleydb.
> 
>   Indeed, I think it may be a good idea to offer the user the possibility 
> to use a non-copyleft version. But that's something completely different 
> than forcing the user to use an old version just because the current one 
> has strong copyleft...

True. But offering a choice between two versions is always complicated,
because we're not sure the new version will remain API compatible with
the old version.

And remember that randpackageconfig is not capable of randomizing
'choices' in Kconfig, so the autobuilders are only testing the default
value of all the choices we have in Buildroot.

>   BTW for the typical embedded use cases, AGPL is hardly stronger than 
> GPL. The "remote user" is typically the owner of the embedded device so 
> the rights granted under GPL already apply.

It's not really the A in front of GPL that causes the problem in AGPL,
but the v3 at the end of it. For consumer devices, the v3 requires that
the end user must be given the physical possibility of running a
modified version of the software under (A)GPLv3. I'm not saying it's
useless, on the contrary, but it's quite a significant change compared
to the requirement of GPLv2.

> >> netatalk: GPLv2+ -> compatible (note that _LICENSE is missing)
> >> perl: Aristic is not compatible, but GPLv1+ is (note that _LICENSE is
> >> wrong)
> >
> > But aren't all Perl modules licensed under the Artistic license? Not
> > sure if it can cause some problems with berkeleydb being AGPLv3+,
> > though.
> 
>   I haven't checked everything, but the ones I looked at either specify 
> "GPL or Artistic", or "under the same terms as Perl".

Ok.

> >> python: PSF license v2 is compatible
> >> ruby: Ruby license is probably incompatible, but BSD-2c is (note that
> >> _LICENSE is wrong). Unfortunately, there are also a few incompatible
> >> files in the ruby distribution.
> >>
> >>    Footnote: except for python, none of the licenses above are
> >> actually correctly defined in buildroot. This worries me...
> >
> > Well, licensing information is tricky to get right. I believe the kind
> > of review you made is typically what makes the licensing information
> > progressively better.
> 
>   You're saying I should produce patches, right? :-)

That's one way of reading what I said, which obviously, would be the
best thing. But if that doesn't happen, the simple fact that you
mentioned those licensing issues is likely to encourage someone to do
the corresponding patches.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
