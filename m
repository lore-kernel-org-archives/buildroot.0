From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 9 Nov 2017 20:58:06 +0000
Subject: [Buildroot] Analysis of build results for 2017-10-30
In-Reply-To: <ba942bc0-1444-1f44-875e-94dd973d6e09@mind.be>
References: <20171031070013.AD75D207B2@mail.free-electrons.com>
 <20171031230519.3feb2619@windsurf> <20171102232155.11995715@windsurf>
 <ba942bc0-1444-1f44-875e-94dd973d6e09@mind.be>
Message-ID: <1510261085.6333.37.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, all,

On Sat, 2017-11-04 at 23:18 +0100, Arnout Vandecappelle wrote:
> 
> On 02-11-17 23:21, Thomas Petazzoni wrote:
> > 
> > > 
> > > > 
> > > > ??????xtensa |??????????????gstreamer-0.10.36 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_bb0a
> > > > 52f08ce07b3aa7301e69e9be12f3e45f45b2&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=bxm7ZLS5r81sWj9rWEsiJn_
> > > > rSsv1Mfe5T84KNX1CRG0&s=wgLWUJPnpM3-vhJwsAf9C1kw-28fPmiLgwernFG53Os&e= | ORPH
> > > > ?????????arm |??????????????gstreamer-0.10.36 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_0b6f
> > > > eb96ba877cb4f3b8c6a05c977a1c12805fac&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=bxm7ZLS5r81sWj9rWEsiJn_
> > > > rSsv1Mfe5T84KNX1CRG0&s=HLGKmbzIk0bAWu_92_b8Rzw06K63PBIq9aCMXbh_F4A&e= | ORPH
> > > > ?????????arm |??????????????gstreamer-0.10.36 | NOK | https://urldefense.proofpoint.com/v2/url?u=http-3A__autobuild.buildroot.net_results_daa9
> > > > 3d58840c77c980d040e2b740555dc3b36951&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=bxm7ZLS5r81sWj9rWEsiJn_
> > > > rSsv1Mfe5T84KNX1CRG0&s=Lo_r127mCwwF8YBowPsNYpatJV0gawzbjO5Og7OWBds&e= | ORPH??
> > > 
> > > /home/buildroot/autobuild/run/instance-3/output/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libgobject-2.0.a(libgobject_2_0_la-
> > > gmarshal.o): In function `g_cclosure_marshal_VOID__VOID':
> > > gmarshal.c:(.text+0x0): multiple definition of `g_cclosure_marshal_VOID__VOID'
> > > ../gst/.libs/libgstreamer-0.10.a(libgstreamer_0.10_la-gstmarshal.o):/home/buildroot/autobuild/run/instance-3/output/build/gstreamer-
> > > 0.10.36/gst/gstmarshal.c:60: first defined here
> > > 
> > > Static linking issue. Who volunteers to have a look? We don't even have
> > > a person listed in the DEVELOPERS file for gstreamer.
> > Still unfixed. Anyone?
> 
> ?I don't think anybody is motivated to maintain the now severely deprecated
> gstreamer0.10. maybe it's time to remove it? Or at
> least, we could remove it from static.

I remember gstreamer-0.10 was used in some of our internal projects so
I'd prefer to keep it in Buildroot, though I don't care about static builds
so OK with removal of it from static builds.

-Alexey
