From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Mon, 20 Apr 2015 15:27:45 +0000
Subject: [Buildroot] [PATCH] uclibc: run snapshot and ng configs through
 "savedefconfig"
In-Reply-To: <20150420152520.GR27057@waldemar-brodkorb.de>
References: <1429527676-32277-1-git-send-email-abrodkin@synopsys.com>
 <20150420152520.GR27057@waldemar-brodkorb.de>
Message-ID: <1429543665.2756.26.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Waldemar,

On Mon, 2015-04-20 at 17:25 +0200, Waldemar Brodkorb wrote:
> Hi Alexey,
> Alexey Brodkin wrote,
> 
> > Recently uClibc got support of "savedefconfig" target that allows
> > generation of compact configuration description which only lists
> > differences from default options.
> > 
> > That's uClibc commit -
> > http://git.uclibc.org/uClibc/commit/?id=e286a674419d31cb0757dd2f8307d8b4756cf1f9
> > 
> > This change represents post-processing of "uClibc-snapshot.defconfig"
> > and "uClibc-ng.config" with "make savedefconfig" made on current
> > uClibc/uClibc-ng master branches.
> > 
> > Unfortunately the most recent stable uClibc version 0.9.33.2 doesn't
> > have "savedefconfig" target so I'm leaving uClibc-0.9.33.config as it
> > is.
> 
> Please do not use master branch of uClibc-ng, as the config is no
> longer compatible to uClibc. Use uClibc-ng 1.0 branch for this.
> 1.0 will be compatible to existing uClibc config.
> Master has some symbols renamed and removed already.
> 
> Only 1.0.x support is included in buildroot.

Indeed I noticed some symbols were missing.
But I was under impression that 1.x are made from master so used master
as a base.

I'll send a re-spin with defconfig for uClibc-ng based on 1.0 branch.

Thanks a lot for prompt reply.
Alexey
