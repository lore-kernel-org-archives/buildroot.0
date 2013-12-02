From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Dec 2013 14:10:08 +0100
Subject: [Buildroot] Call for autobuild fixing for 2013.11
In-Reply-To: <CAAXf6LU0Tg+pcbRrXpz2ApxkTLpkPDL+wpscGRZf6Ty7Wpg4iA@mail.gmail.com>
References: <CAAXf6LXwy3HGGX1W9FCcdVCRJSHMT2B=w--xvcsBxqwUXxDjqg@mail.gmail.com>
 <CAAXf6LU1_ybwfA9DGfkq7fGJ17LU5k4cQb=G14rg6oSdNY=WAg@mail.gmail.com>
 <20131126142616.64719ad6@skate>
 <CAAXf6LViMHHbhYP2joLTDYg7=KDJ8jHyMYm81COZkNdhH8AG2Q@mail.gmail.com>
 <20131202133242.26ec8cbd@skate>
 <CAAXf6LU0Tg+pcbRrXpz2ApxkTLpkPDL+wpscGRZf6Ty7Wpg4iA@mail.gmail.com>
Message-ID: <20131202141008.758581a4@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas De Schampheleire,

On Mon, 2 Dec 2013 13:53:53 +0100, Thomas De Schampheleire wrote:

> > Yes, I must say I was impressed by how much we managed to reduce the
> > number of build failures.
> 
> A wild idea I have is to keep count of how many autobuild problems
> were fixed by each contributor, and add this ranking to the buildroot
> release e-mail, similar to how commits are counted. This would give
> some extra incentive to developers in fixing such problems.

In practice, there is usually one commit to fix each autobuilder issue,
so people already get credited by the number of commits.

However, if you want, we can run some statistics based on which commit
logs contained a reference to an autobuild URL, and extract these.
Should not be too complicated to achieve.

... a little bit of scripting later ...

for i in $(git log --format=%H 2013.08..2013.11); do git show --quiet $i | grep -q http://autobuild && git show --quiet --format="%an" $i ; done | sort | uniq -c | sort -rn -k1

gives the following scores for the last release:

     39 Gustavo Zacarias
     21 Peter Korsgaard
     17 Thomas Petazzoni
     14 Simon Dawson
      6 Thomas De Schampheleire
      6 Romain Naour
      5 Vicente Olivert Riera
      5 Samuel Martin
      4 Fatih A??c?
      4 Arnout Vandecappelle
      3 Ryan Barnett
      3 Axel Lin
      2 Phil Eichinger
      2 Matt Weber
      2 Chris Zankel
      1 Michael Rommel
      1 Luca Ceresoli
      1 Jerzy Grzegorek
      1 Clayton Shotwell
      1 Baruch Siach
      1 Alexander Lukichev

Of course, this assumes that any commit that contains a reference to a
http://autobuild<something> URL is fixing an autobuilder failure. Which
I guess is good enough indicator (even though possibly not perfect).

> > However, it's hard to be 100% sure a failure showing is a new failure,
> > even if we had several days in a row with 0 failures. The number of
> > possible combinations is so huge that I don't think it's possible to
> > test all of them within a reasonable amount of time. So a "new failure"
> > may just be something that did exist since quite some time was that we
> > couldn't trigger (like was indeed by another failure, for example).
> 
> True. But, imagine we had zero failures for a few days, and then there
> is a new failure. The logical thing to do is check which package
> fails, in which way, and have a look at the recent commits. In many
> cases, it would be obvious whether the new failure is or could be
> caused by such a recent commit, or if it is an 'old' issue that wasn't
> seen for a while.
> So, while we cannot automatically blame the last set of commits,
> having close-to-zero failures would certainly help a lot in the
> analysis.

True. But in practice, that's something we're already able to do. As I
follow autobuilder failures quite regularly, I'm quite easily able to
determine whether a build failure is something new that is possibly
related to a recent commit, or something that has been around for quite
some time.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
