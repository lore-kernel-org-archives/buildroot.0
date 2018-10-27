From: Nasser Afshin <afshin.nasser@gmail.com>
Date: Sat, 27 Oct 2018 14:18:06 +0330
Subject: [Buildroot] Antwort: Re: Antwort: Re: [PATCH v3]
 merge_config.sh: merge also buildroot config files
In-Reply-To: <20181027044635.GA26719@x230>
References: <20181025011343.29512-1-afshin.nasser@gmail.com>
 <20181025022031.14043-1-afshin.nasser@gmail.com>
 <20181025074309.GB18528@dell5510>
 <OF54A89E59.8DBA5497-ONC1258331.0034C458-C1258331.00357034@local-dmz.de>
 <20181025214311.GB31691@dell5510>
 <OF26A838D6.35610758-ONC1258332.00211513-C1258332.0021531B@local-dmz.de>
 <20181026230546.GA18350@smart-ThinkPad-T410>
 <20181027044635.GA26719@x230>
Message-ID: <20181027104806.GA11024@smart-All-Series>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Petr, Marcel,
On Sat, Oct 27, 2018 at 06:46:36AM +0200, Petr Vorel wrote:
> Hi Marcel, Nasser,
> 
> > > I would suggest to just remove the prefix restrictions in buildroot's
> > > merge_config.sh unless someone can tell why they are important to be
> > > there.
> > The problem is that some of our defconfig files include comment lines
> > (e.g raspberrypi_defconfig, cubieboard2_defconfig,
> > qemu_arm_versatile_defconfig, ...). If we completely omit the
> > ${CONFIG_PREFIX} we will add first word of comments to $CFG_LIST and
> > therefor will produce some false warning reports for comment lines (if
> > the fist word is just repeated anywhere throughout the fragments which
> > is none sense)
> 
> > If we consider the controversial part of the script which is either:
> > sed -n 's/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p' \
> > defconfig_file_name
> 
> > for kernel style config files or
> 
> > sed -n 's/^\(# \)\{0,1\}\(BR2_[a-zA-Z0-9_]*\)[= ].*/\2/p' \
> > defconfig_file_name
> 
> > for buildroot style config files or
> 
> > sed -n 's/^\(# \)\{0,1\}\([a-zA-Z0-9_]*\)[= ].*/\2/p' \
> > defconfig_file_name
> 
> > as a general command then for different buildroot/kernel defconfig
> > files, the last one will extract comments as well which IMHO is not what we
> > want.
> 
> Agree. Maybe we could try to add "any prefix" pattern: '[A-Z0-9_]\+'
> 
> sed -n 's/^\(# \)\{0,1\}\([A-Z0-9_]\+_[a-zA-Z0-9_]*\)[= ].*/\2/p' \
> defconfig_file_name
I agree. It seems to be a better solution.
> 
> 
> Kind regards,
> Petr
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot

Kind regards,
Nasser
