From: Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 5 Nov 2018 09:35:56 +0100
Subject: [Buildroot] [PATCH] merge_config.sh: Fix merging buildroot
 config files
In-Reply-To: <547a4ff728664a39a4e0870731c5446f@SOC-EX01V.e01.socionext.com>
References: <20181101062448.GC8261@x230>
 <20181101105513.GB4937@smart-ThinkPad-T410>
 <7ba255c0-e72e-7e02-d972-f8f082ce5214@mind.be>
 <20181101161918.GA30470@x230>
 <20181102021259.GA8966@smart-ThinkPad-T410>
 <5b88530949cb4aaf93436bcbc36f9fbf@SOC-EX01V.e01.socionext.com>
 <4c5ee82c-00eb-33e6-6ec1-fc4f21eba039@mind.be>
 <20181102225056.GB11633@dell5510>
 <20181103213223.GA7084@smart-ThinkPad-T410>
 <547a4ff728664a39a4e0870731c5446f@SOC-EX01V.e01.socionext.com>
Message-ID: <20181105083554.GC4485@x230>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

> > > >  Perhaps it's better to make the entire pattern explicit, like:

> > > > SED_CONFIG_EXP="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*$\|^#
> > > > \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1\2/p"

> > > > (\1\2 works because only one of the two subexpressions matches, so either
> > \1 or
> > > > \2 must be empty).
> > > I'd prefer original Masahiro's version - it's easier to read and without
> > > duplicity.

> > I agree with you. +1 for not having duplicity.
> > This patch makes merge_config.sh to work well in many more tests. I'm waiting
> > for Masahiro's version to be applied to
> > the his kbuild tree and then re-prepare the patch here.


> OK, I think Arnout's one is unreadable, but
> we can make it readable by splitting the complex pattern into two.

> I posted this for comparison.
> https://patchwork.kernel.org/patch/10667571/

LGTM. It's quite verbose, but more precise regexp is better and readability is also
good.


Kind regards,
Petr
