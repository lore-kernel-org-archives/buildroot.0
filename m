From: Waldemar Brodkorb <wbx@openadk.org>
Date: Tue, 8 Aug 2017 18:39:07 +0200
Subject: [Buildroot] [PATCH v2] systemd: allow to build with uClibc
 toolchains
In-Reply-To: <20170802221544.031370ab@windsurf.home>
References: <20170625182533.GA24682@waldemar-brodkorb.de>
 <20170802221544.031370ab@windsurf.home>
Message-ID: <20170808163907.GB28021@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
Thomas Petazzoni wrote,

> Hello,
> 
> On Sun, 25 Jun 2017 20:25:33 +0200, Waldemar Brodkorb wrote:
> > Both patches where applied upstream.
> > We need to disable any systemd parts using either IDN or NSS.
> > IDN is only disabled in C library function call to getnaminfo(),
> > it does not effect libidn/libidn2 usage in systemd.
> > 
> > Tested in qemu-system-arm.
> > 
> > Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
> > ---
> > v1 -> v2:
> >   - added Upstream commit URL suggested by Thomas Petazzoni
> >   - rework enable/disable options suggested by Thomas Petazzoni
> >   - extend commit message a little bit
> > ---
> >  .../0004-Make-IDN-support-conditional.patch        | 74 ++++++++++++++++++++++
> >  ...0005-make-nss-systemd-support-conditional.patch | 62 ++++++++++++++++++
> >  package/systemd/Config.in                          |  2 +
> >  package/systemd/systemd.mk                         | 11 ++++
> >  system/Config.in                                   |  6 +-
> >  5 files changed, 152 insertions(+), 3 deletions(-)
> >  create mode 100644 package/systemd/0004-Make-IDN-support-conditional.patch
> >  create mode 100644 package/systemd/0005-make-nss-systemd-support-conditional.patch
> 
> I've applied this patch on top of systemd 234 (which is nice because
> the two patches you were adding can be dropped, as they are upstream).
> 
> Unfortunately, it fails to build:

I wasn't able to reproduce this issue with latest master.
Can you provide a defconfig using internal toolchain?

I updated the patch so that we are using the same patchset.
Maybe some issue resolved in the internal toolchain?

best regards
 Waldemar
