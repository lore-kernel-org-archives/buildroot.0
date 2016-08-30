From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 30 Aug 2016 21:44:33 +0200
Subject: [Buildroot] Question regarding support/kconfig
In-Reply-To: <20160830103607.0607237b@jenova>
References: <20160830101545.19fee5f8@jenova> <20160830103607.0607237b@jenova>
Message-ID: <b465012f-37af-5003-3632-439f997b744a@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On 30-08-16 10:36, Manuel Gro? wrote:
> Sorry for the noise, I should have waited a little longer before asking
> this question.
>
> On Tue, 30 Aug 2016 10:15:45 +0200
> Manuel Gro? <mgr@nordkrater.de> wrote:
>
> > I want to use the support/kconfig/merge_config.sh script outside
> > buildroot to merge buildroot config fragments. To do so, I need the
> > script to recognise options beginning with 'BR2_' instead of
> > 'CONFIG_'. 

 You can simply change

SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(\(CONFIG\|BR2\)_[a-zA-Z0-9_]*\)[= ].*/\2/p"

so the script works both for buildroot and for traditional Kconfig.

 I think it's worth to upstream this change to buildroot. Which means adding a
patch to the patches directory to make that change.

 Regards,
 Arnout


> I noticed a patch for the script lying around
> > (patches/01-kconfig-kernel-to-buildroot.patch), which contains exactly
> > those modifications.
>
> I got confused about those patches, sorry. There is no patch for the
> merge_config.sh whatsoever.
>  
> > Now to my question(s):
> > Am I supposed to apply these patches outside buildroot, or is there
> > another, proper way to patch the script?
>
> Since there is no patch for the merge-script, and the other ones are
> already applied, this question solves itself.
>
> > Am I breaking anything by patching the script?
>
> I obviously would break the 'pkg-kconfig' package, which uses this
> script for other packages. I also imagine kernel builds using fragments
> would suffer from this.
>
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

-- 
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
