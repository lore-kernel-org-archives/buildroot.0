From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Fri, 15 Sep 2017 12:17:11 +0000
Subject: [Buildroot] [PATCH] python-numpy: Bump to the most recent
	release 1.13.1
In-Reply-To: <7a15e121-6f8e-9614-15cb-e02b6835154b@mind.be>
References: <20170915104606.25218-1-abrodkin@synopsys.com>
 <7a15e121-6f8e-9614-15cb-e02b6835154b@mind.be>
Message-ID: <1505477830.7059.6.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Fri, 2017-09-15 at 14:03 +0200, Arnout Vandecappelle wrote:
> 
> On 15-09-17 12:46, Alexey Brodkin wrote:
> > 
> > Note previously used location for releases on SourceForge is no longer
> > supported (latest tarball v1.11.2 available there is dated 2016-10-04)
> > so as other distros
> > (see, Fedora https://urldefense.proofpoint.com/v2/url?u=http-3A__pkgs.fedoraproject.org_cgit_rpms_numpy.git_tree_numpy.spec-3Fid-3D7013948f8ba073c
> > 69a91a545f0a0898cb62652fa-
> > 23n22&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=5agzHjEUI_DiafwDPRl75hnHUqo6NOJNFQ0H45brjh8&s=f4SWAhOq4UUR
> > J1E3lO0BHkEIYXVne9hbwe4qN7zO3G0&e= )
> > we get release tarball directly from GitHub.
> > 
> > Also note 0001-no-fenv-on-uclibc.patch was rebased on v1.13.1 and
> > 0002-Don-t-blindly-enable-frexpl-and-ldexpl-for-uClibc.patch was
> > removed completely as corresponding code got nuked with
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_numpy_numpy_pull_4852&d=DwICaQ&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO
> > 7breS55ytWkhpk5R81I&m=5agzHjEUI_DiafwDPRl75hnHUqo6NOJNFQ0H45brjh8&s=sTHA0phn8s5wX_g3lQFidSkNN_7W9BuK6gmDncE0_y0&e= . I'm not really sure
> > if something similar to Arnout's patch is still required so it would be good
> > if somebody more knowledgeable checks that.
> 
> ?It indeed looks like that pull request now always does the right thing for
> frexpl and ldexpl.
> 
> ?Have you tested a build with uClibc on ARM and/or MIPS? According to my commit
> message, it would fail there if the problem still exists.

Indeed I build-tested it with uclibc toolchain for ARM!
So then we should be OK.

-Alexey
