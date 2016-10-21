From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 21 Oct 2016 19:18:46 +0000
Subject: [Buildroot] [PATCH][autobuild] autobuild-run: introduce
 "--tc-cfg-uri" option for toolchain configs URI
In-Reply-To: <1efebf79-366d-f274-fd4c-d41264cfcd77@mind.be>
References: <1477045454-8660-1-git-send-email-vzakhar@synopsys.com>
 <20161021133452.0508e5c5@free-electrons.com>
 <1efebf79-366d-f274-fd4c-d41264cfcd77@mind.be>
Message-ID: <4881796E12491D4BB15146FE0209CE6467849988@DE02WEMBXB.internal.synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

> -----Original Message-----
> From: Arnout Vandecappelle [mailto:arnout at mind.be]
> Sent: 21 ??????? 2016 ?. 21:14
> To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>; Vlad Zakharov <Vladislav.Zakharov@synopsys.com>
> Cc: buildroot at busybox.net; Alexey Brodkin <Alexey.Brodkin@synopsys.com>; Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>
> Subject: Re: [Buildroot] [PATCH][autobuild] autobuild-run: introduce "--tc-cfg-uri" option for toolchain configs URI

[snip]

> >
> > I am not sure I like this approach very much. It means people can start
> > using a non-default set of toolchains, and then submit results to
> > autobuild.buildroot.org. Such results would possibly not be
> > reproducible by others because we may not have access to those
> > toolchains.
> 
>  Maybe just make this option mutually exclusive --upload? I.e., automatically
> disable upload if this option is set. I guess that's OK for the ARC use case?

Well we may indeed implement something like this.

But frankly the idea was to give more testing to "non-standard" configurations
especially with Buildroot-built toolchain (on every build so no prebuilt tools at all).
I.e. to get better coverage when BR's toolchain is configured with different set of features.

-Alexey
