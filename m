From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 21 Oct 2016 19:44:49 +0000
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--tc-cfg-uri" option for toolchain configs URI
In-Reply-To: <7d0f4c5e-7ce9-01d2-c2ae-66c32962b421@mind.be>
References: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
 <20161021133452.0508e5c5@free-electrons.com>
 <1efebf79-366d-f274-fd4c-d41264cfcd77@mind.be>
 <4881796E12491D4BB15146FE0209CE6467849988@DE02WEMBXB.internal.synopsys.com>
 <7d0f4c5e-7ce9-01d2-c2ae-66c32962b421@mind.be>
Message-ID: <4881796E12491D4BB15146FE0209CE6467849E13@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: 21 ??????? 2016 ?. 22:29
> To: Alexey Brodkin <Alexey.Brodkin@synopsys.com>; Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
> Cc: buildroot at busybox.net; Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> Subject: Re: [Buildroot] [PATCH][autobuild] autobuild-run: introduce "--tc-cfg-uri" option for toolchain configs URI

[snip]

> >>
> >>  Maybe just make this option mutually exclusive --upload? I.e., automatically
> >> disable upload if this option is set. I guess that's OK for the ARC use case?
> >
> > Well we may indeed implement something like this.
> >
> > But frankly the idea was to give more testing to "non-standard" configurations
> > especially with Buildroot-built toolchain (on every build so no prebuilt tools at all).
> > I.e. to get better coverage when BR's toolchain is configured with different set of features.
> 
>  If the intention is that they are registered in a.b.o, why not just add the
> configurations to the official list?

Well we may do it.
But as I understood autobuilder script randomly selects config from this list
http://autobuild.buildroot.org/toolchains/configs/toolchain-configs.csv

Which means if we add more entries for ARC we'll have ARC build happening more often
But I'd like to keep balance as it is because obviously all targets should get equal testing.

-Alexey
