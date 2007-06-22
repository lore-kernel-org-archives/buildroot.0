From: A M <madwifi@vermark.com>
Date: Fri, 22 Jun 2007 15:15:47 -0400
Subject: [Buildroot] Help Building Buildroot
In-Reply-To: <20070622190236.GA3480@aon.at>
References: <20070622084710.5B20648010@busybox.net>
	<f0528b5b0706220940l5543936cw53cee028dfdc9012@mail.gmail.com>
	<1182533072.3733.7.camel@max.vermark.net>
	<20070622182054.GC2799@aon.at> <20070622190236.GA3480@aon.at>
Message-ID: <1182539747.3733.9.camel@max.vermark.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thanks will give it a try now. Will let you know the outcome.

A M

On Fri, 2007-06-22 at 21:02 +0200, Bernhard Fischer wrote:
> On Fri, Jun 22, 2007 at 08:20:54PM +0200, Bernhard Fischer wrote:
> >On Fri, Jun 22, 2007 at 01:24:32PM -0400, A M wrote:
> >>Hi Guys,
> >>
> >>I can not seem to run make sucessfully using the daily snapshot of
> >>buildroot. It seems to always break just after downloading ccache.  Here
> >>is the out put of what I have. I have tried this over and over again.
> >>
> >>I have also attached my .config file.  Maybe there is something am
> >>missing.
> >>
> >>My target board is the WRAP 2E-E PC Engines
> >
> >>(cd /home/amark/development/buildroot/build_i586/staging_dir/bin-ccache;
> >>\
> >>                ln -fs i586-linux-uclibc-gcc i586-linux-gcc; \
> >>                ln -fs i586-linux-uclibc-gcc i586-linux-cc; \
> >>                ln -fs i586-linux-uclibc-gcc i586-linux-uclibc-cc);
> >>[ -f /home/amark/development/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc ] && \
> >>
> >>mv /home/amark/development/buildroot/build_i586/staging_dir/bin/i586-linux-uclibc-gcc /home/amark/development/buildroot/build_i586/staging_dir/bin-ccache/
> >>make: ***
> >>[/home/amark/development/buildroot/build_i586/staging_dir/usr/bin/ccache] Error 1
> >
> >The toolchain now resides in staging_dir/usr/bin (formerly it was in
> >staging_dir/bin), so this needs to be adjusted.
> >I will fix that up ASAP, disable ccache for now until this is fixed.
> 
> Should be fixed as of r18897, please let me know if this works for you
> again.
> 
> _______________________________________________
> buildroot mailing list
> buildroot at uclibc.org
> http://busybox.net/mailman/listinfo/buildroot
