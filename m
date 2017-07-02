From: Andrey Yurovsky <yurovsky@gmail.com>
Date: Sun, 2 Jul 2017 12:57:14 -0700
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
	2017-07-01
In-Reply-To: <20170702063107.D1E2621E01@mail.free-electrons.com>
References: <20170702063107.D1E2621E01@mail.free-electrons.com>
Message-ID: <CAAkeqgV9VY0CEZAxPuQJ_vSBFudcWWwRHzra62tn=98B8HhMhA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, Jul 1, 2017 at 11:31 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> This is the list of Buildroot build failures that occured on
> 2017-07-01, and for which you are a registered architecture developer
> or package developer. Please help us improving the quality of
> Buildroot by investigating those build failures and sending patches to
> fix them. Thanks!
>
> Build failures related to your packages:
>
>          sh4 |                host-rauc-0.1.1 | http://autobuild.buildroot.net/results/2695202ee3b0734430abc2db03828a45cd5e5ef5
>         m68k |                host-rauc-0.1.1 | http://autobuild.buildroot.net/results/77a5db1120bf90ccaac00cfc0a8db358cacd894c

These are failing because openssl and libglib2 aren't available (for
the host). I'm not sure why the others didn't fail, perhaps the
environment for them does provide these. We don't have host recipes
for either one so perhaps buildroot shouldn't provide host-rauc after
all? Or is there a way to indicate that these are external
dependencies for this host tool? Or otherwise should buildroot try to
provide host builds of openssl and glib2?
