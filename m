From: Mike Frysinger <vapier@gentoo.org>
Date: Tue, 15 Feb 2011 03:17:25 -0500
Subject: [Buildroot] [uclinux-dist-devel] [PATCH] buildroot:package:
	Remove configure target parameter in Makefile.autotools.in
In-Reply-To: <AANLkTikhipOfKy4H+RjEaeHJ0dEp1DJ1obUPRv7MB0kB@mail.gmail.com>
References: <1296532330-24961-1-git-send-email-sonic.adi@gmail.com>
	<AANLkTi=ZuWp-6kbBRt+8Yz7OwQz4ODGWeSk9kSjs=VbZ@mail.gmail.com>
	<AANLkTikhipOfKy4H+RjEaeHJ0dEp1DJ1obUPRv7MB0kB@mail.gmail.com>
Message-ID: <201102150317.26410.vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tuesday, February 08, 2011 22:01:52 Sonic Zhang wrote:
> On Wed, Feb 2, 2011 at 2:40 PM, Mike Frysinger <vapier.adi@gmail.com> wrote:
> > On Tue, Feb 1, 2011 at 23:49, Sonic Zhang wrote:
> >> On Tue, Feb 1, 2011 at 3:45 PM, Peter Korsgaard wrote:
> >>>>>>>> "Sonic" == Sonic Zhang writes:
> >>>  Sonic> Some autotools based software packages generate prefix name to
> >>> the Sonic> binary after running install if you set --target parameter.
> >>> 
> >>>  Sonic> For example:
> >>> 
> >>>  Sonic> --target=arm
> >>> 
> >>>  Sonic> rcp is rename to "linux-arm-rcp" after running install
> >>> 
> >>> These packages typically accept the configure options
> >>> --program-transform-name to make them not do that.
> >> 
> >> Yes, but for some packages, --host and --target are not the same as
> >> defined in buildroot.
> > 
> > yes they are
> > 
> >> For example, to build on x86, run on arm and generate binary for mips.
> > 
> > but that is what we're doing.  we build on x86, run on arm, and
> > generate for arm.
> 
> Are you sure buildroot should be limited to the same --host and --target
> only?

until buildroot grows support to let users specify a --target, it is already 
limited to that.

i already sent a patch to upstream inetutils to fix their autoconf and they 
accepted it.
-mike
-------------- next part --------------
A non-text attachment was scrubbed...
Name: signature.asc
Type: application/pgp-signature
Size: 836 bytes
Desc: This is a digitally signed message part.
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20110215/af62dc0c/attachment.asc>
