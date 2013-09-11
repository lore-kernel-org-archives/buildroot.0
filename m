From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 11 Sep 2013 21:52:34 +0200
Subject: [Buildroot] [PATCH 1/1] aiccu: new package
In-Reply-To: <AF069D6A-BBA5-4CE4-B424-22362C2C6128@layer-7.net>
References: <1378677483-2424-1-git-send-email-rommel@layer-7.net>
 <AF069D6A-BBA5-4CE4-B424-22362C2C6128@layer-7.net>
Message-ID: <CAAXf6LUnjt+uNh8J+4+U-ZR2HWct9SgK2YBKRSXZPSQjVYzrRQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Michael,

Op 11-sep.-2013 20:35 schreef "Michael Rommel" <rommel@layer-7.net> het
volgende:
>
> Dear Thomas,
>
> On Sep 11, 2013, at 8:07 , Arnout Vandecappelle <arnout@mind.be> wrote:
>
> > On 08/09/13 13:39, Thomas De Schampheleire wrote:
> >> I tried compiling on a powerpc target, but this unfortunately failed:
> >>
> >> strip aiccu
> >> strip: Unable to recognise the format of the input file `aiccu'
> >> make[2]: *** [aiccu] Error 1
> >> make[2]: Leaving directory
> >>
`/home/tdescham/repo/contrib/buildroot-review/output/build/aiccu-20070115/unix-console'
> >>
> >>
> >> The aiccu/unix-console/Makefile hardcodes the 'strip' command, but
> >> this should be the cross-strip, provided by buildroot through
> >> TARGET_STRIP. I think that aiccu should be patched to use STRIP, which
> >> defaults to 'strip', and aiccu.mk in buildroot should then pass the
> >> right STRIP command.
> >> This patch could then also be upstreamed...
> >
> > Actually, it is better to remove the strip completely. We strip the
target directory in a final step, so that you still have unstripped
binaries in the build and staging directories. Most packages leave it up to
the distro to strip the binaries - which makes it possible to build foo-dbg
packages that have the debug symbols.
> >
> > Regards,
> > Arnout
>
>
> Since the mailinglist was down, Arnouts comment came in after I submitted
the
> latest version of the patch (I will add numbering in the future).
>
> He proposes to make the patch leave off the strip command completely.
> Since I think no upstream patches will be made, it is a matter of your
> guidance.
>
> @Thomas: If you too think it shall be left off, I'll send a new version.
> I can follow the argument of having a debug version around in the build
> tree.
>
> Let me know and you'll get a new version (which will be v5, if I counted
correctly).
>

Yes, I think Arnout has a good point so I would follow his advice.

Best regards,
Thomas
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130911/51c35343/attachment-0001.html>
