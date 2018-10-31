From: Nasser <afshin.nasser@gmail.com>
Date: Thu, 1 Nov 2018 00:08:31 +0330
Subject: [Buildroot] [PATCH v3] merge_config.sh: merge also buildroot
 config files
In-Reply-To: <20181031193550.GC24966@x230>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
 <20181025074309.GB18528@dell5510>
 <OF54A89E59.8DBA5497-ONC1258331.0034C458-C1258331.00357034@local-dmz.de>
 <20181025214311.GB31691@dell5510>
 <OF26A838D6.35610758-ONC1258332.00211513-C1258332.0021531B@local-dmz.de>
 <20181026230546.GA18350@smart-ThinkPad-T410>
 <20181027044635.GA26719@x230>
 <20181027104806.GA11024@smart-All-Series>
 <20181031193550.GC24966@x230>
Message-ID: <20181031203831.GA4311@smart-ThinkPad-T410>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Oct 31, 2018 at 08:35:51PM +0100, Petr Vorel wrote:
> Hi Nasser,
> 
> > > > as a general command then for different buildroot/kernel defconfig
> > > > files, the last one will extract comments as well which IMHO is not what we
> > > > want.
> 
> > > Agree. Maybe we could try to add "any prefix" pattern: '[A-Z0-9_]\+'
> 
> > > sed -n 's/^\(# \)\{0,1\}\([A-Z0-9_]\+_[a-zA-Z0-9_]*\)[= ].*/\2/p' \
> > > defconfig_file_name
> > I agree. It seems to be a better solution.
> Upstream solution in kernel has been merged [1] and will be part of kernel 4.21
> (kbuild updates for 4.20 has been merged day before).
I see. Seems great.
> Would you like to backport it to buildroot + add necessary applications (setting
> the variable?) or shell I do it?
Sure, I'll do it.
> 
> I also have plans to upgrade our kconfig to 4.19 + review the patches (some of
> them might can be adjusted to be suitable for upstream, so we'd be able to get
> rid of them).
Yes, I would like to do it also.
I think I should begin with the first task and then upgrade our kconfig
to 4.19.
> 
> 
> > Kind regards,
> > Nasser
> 
> Kind regards,
> Petr
> 
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git/commit/?h=for-next&id=f6fe19e9d84400e1c9544c1909952c2c7c6a90a2
Kind regards,
Nasser
