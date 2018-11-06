From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 6 Nov 2018 06:27:15 -0600
Subject: [Buildroot] [PATCH] Config.in: security hardening: disable
 FORTIFY_SOURCE for gcc < 6
In-Reply-To: <CANQCQpZJphzALGYtMA-45_3ppea0yLhj0VrECKX8wS_BT891jg@mail.gmail.com>
References: <20181105200750.6039-1-romain.naour@gmail.com>
 <CANQCQpYGPBpEivKh893TPeoqoOtS+FxGmNjYvmgwGWoArOyu=A@mail.gmail.com>
 <87bm73cgol.fsf@dell.be.48ers.dk>
 <CANQCQpZJphzALGYtMA-45_3ppea0yLhj0VrECKX8wS_BT891jg@mail.gmail.com>
Message-ID: <CANQCQpa7zCrhy-j4MZDVK5A+yAeDSX5MLwXCYEP=6HL4zVNP8Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Mon, Nov 5, 2018 at 4:21 PM Matthew Weber
<matthew.weber@rockwellcollins.com> wrote:
>
> Peter/Romain,
>
>
> On Mon, Nov 5, 2018 at 4:17 PM Peter Korsgaard <peter@korsgaard.com> wrote:
> >
> > >>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:
> >
> >  > Romain ,
> >  > On Mon, Nov 5, 2018, 14:07 Romain Naour <romain.naour@gmail.com wrote:
> >
> >  >> As reported in the bug report [1], gcc < 6 doesn't build when
> >  >> FORTIFY_SOURCE is set to 1 or 2. The issue is related to the
> >  >> upstream bug report [2] but the patch fixing the issue for gcc 6
> >  >> has not been backported to earlier gcc versions.
> >  >>
> >  >> Add a dependency on gcc at least version 6 to BR2_FORTIFY_SOURCE_1
> >  >> and BR2_FORTIFY_SOURCE_2.
> >  >>
> >
> >  > Sorry about the HTML email.
> >
> >  > Could this dependency be conditional on if a internal toolchain is used?
> >
> > Ahh yes, if this is really about *building* gcc, then it should be
> >
> > depends on !BR2_TOOLCHAIN_BUILDROOT || BR2_TOOLCHAIN_GCC_AT_LEAST_6
> >
>
> Correct.  I'll have to dig a bit and see what the minimum supported
> external toolchain version is.  I believe 5.4.x

Found an old post....  https://access.redhat.com/blogs/766093/posts/1976213
Looks like the FORTIFY options should work from GCC 4.0+ and is more
dependent on GLIBC being new enough (which we won't run into).
Macros are supported since GLIBC2.3.4 -
http://man7.org/linux/man-pages/man7/feature_test_macros.7.html

Matt
