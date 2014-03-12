From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Wed, 12 Mar 2014 21:24:17 +0100
Subject: [Buildroot] Switching from uClibc to glibc as the default in
 Buildroot?
In-Reply-To: <CAAXf6LXoZ_dQNoy=z7u4ww-j2Eppe3mMiYn+6t=_x3odwBwGWA@mail.gmail.com>
References: <20140218231447.524a1a20@skate>
 <CAMKF1soCcLba_EacJLe7f9fM9=gFsTJYj0kaz6YzoXzEY1rx2A@mail.gmail.com>
 <fd7802bd-3f37-4d70-ad22-2e46fc452b4b@email.android.com>
 <66DCE5C2-E7A6-4634-8C79-441DA9FC46FB@gmail.com>
 <20140219092112.6f359a55@skate> <87y5171p19.fsf@dell.be.48ers.dk>
 <CAAXf6LXoZ_dQNoy=z7u4ww-j2Eppe3mMiYn+6t=_x3odwBwGWA@mail.gmail.com>
Message-ID: <20140312202417.GC6240@nbbrfq.cc.univie.ac.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Mar 07, 2014 at 09:07:27AM +0100, Thomas De Schampheleire wrote:
> Hi all,
> 
> On Wed, Feb 19, 2014 at 9:32 AM, Peter Korsgaard <jacmet@uclibc.org> wrote:
> >>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> >
> >  > Dear Khem Raj,
> >  > On Tue, 18 Feb 2014 18:43:41 -0800, Khem Raj wrote:
> >
> >  >> > There are a great number of fixes since the last numbered release and I for one would greatly appreciate having at least a "testing" release with a bumped version number to use. Other than the ldso stat call problem I reported a couple of weeks ago, uClibc trunk has been working fairly well, and most bugs I run into are the typical growing pains of toolchain building from scratch rather than uClibc problems.
> >  >>
> >  >> so get going start testing git/master and report issues or successes you have.
> >  >> help in testing it out, run uclibc test suites or any others you have setups for
> >
> >  > Please break the chicken-and-egg problem, and release 2014.02-rc1 right
> >  > now, spit out a call for testing, and release 2014.02 at the end of the
> >  > month. (Or pick any other date you want, those are just suggestions).
> >
> > Inded. When Bernard suggested the same last year I did test and reported
> > issues, but never got any reply:
> >
> > http://lists.uclibc.org/pipermail/uclibc/2013-November/048093.html
> >
> 
> Any further evolution in this matter?
> 
> Until now, this mail thread did not seem to have triggered any real
> activity from the uClibc community.
> 
> Khem Raj: what is the plan forward? You have requested patches to be
> sent, and testing to be performed, and the Buildroot community has
> responded by telling that we only have patches that are already in the
> uClibc tree (unreleased) and we have been testing this for a long
> while already, without problems.
> 
> Maybe you feel this is not enough, in which case kindly provide more
> details about what you consider blocking points to make a release, or
> even a release candidate.

Well, see ML archives with a mail from Peter who tested a somewhat
recent master and found ARM !LFS to be broken (i still consider !LFS to
be an important thing to support, despite the maintenance burden).
[the exact november mail above, btw]
We have touched this on master as
00571b43df2e0554d1b0716681832ba9975177c5 so this in fact did trigger a
reaction from "the uClibc community". No reaction from the buildroot
folks that current master resolved this !LFS ARM failure. Zilch.
See?
Where is your waterfall buildbot page that shows current uClibc-master
state, again?


If buildroot would rebase their patches against current 0.9.33 branch
then i would happily merge the backports that you cherry-picked and call
it 0.9.33.++x but current master is just not in a condition that i feel
comfortable to call 0.9.34. It works for big systems but as you can see
with the ARM !LFS case has some severe regressions and i don't currently
have time to tackle them all by myself.

So what you can do is, either test and fix (!) master for non-fat target
images at least, or help with re-baseing the buildroot, openwrt, freetz,
you-name-it patches to the 0.9.33 branch for us to merge.

thanks and cheers,
