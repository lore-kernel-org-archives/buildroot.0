From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 2 Jul 2017 23:38:11 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-01
In-Reply-To: <CAAkeqgV9VY0CEZAxPuQJ_vSBFudcWWwRHzra62tn=98B8HhMhA@mail.gmail.com>
References: <20170702063107.D1E2621E01@mail.free-electrons.com>
 <CAAkeqgV9VY0CEZAxPuQJ_vSBFudcWWwRHzra62tn=98B8HhMhA@mail.gmail.com>
Message-ID: <20170702233811.226f8789@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Jul 2017 12:57:14 -0700, Andrey Yurovsky wrote:
> On Sat, Jul 1, 2017 at 11:31 PM, Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote:
> > Hello,
> >
> > This is the list of Buildroot build failures that occured on
> > 2017-07-01, and for which you are a registered architecture developer
> > or package developer. Please help us improving the quality of
> > Buildroot by investigating those build failures and sending patches to
> > fix them. Thanks!
> >
> > Build failures related to your packages:
> >
> >          sh4 |                host-rauc-0.1.1 | http://autobuild.buildroot.net/results/2695202ee3b0734430abc2db03828a45cd5e5ef5
> >         m68k |                host-rauc-0.1.1 | http://autobuild.buildroot.net/results/77a5db1120bf90ccaac00cfc0a8db358cacd894c  
> 
> These are failing because openssl and libglib2 aren't available (for
> the host). I'm not sure why the others didn't fail, perhaps the
> environment for them does provide these. We don't have host recipes
> for either one so perhaps buildroot shouldn't provide host-rauc after
> all? Or is there a way to indicate that these are external
> dependencies for this host tool? Or otherwise should buildroot try to
> provide host builds of openssl and glib2?

In such cases, we obviously add dependencies on host-openssl and
host-libglib2, both of which already exist. I've therefore pushed a
commit that fixes those build issues:

  https://github.com/buildroot/buildroot/commit/8c7966d22e53ac83f2d8fe41b1a04c3f598502f4
  (our gitweb is down, so pointing to our github.com repo)

Thanks for investigating this issue in the first place!

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
