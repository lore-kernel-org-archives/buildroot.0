From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 08 Feb 2020 20:12:48 +0100
Subject: [Buildroot] [PATCH] package/rng-tools: make jitterentropy
 conditional
In-Reply-To: <CANQCQpZ9Hs6DA6XJpBnMLxqnnJj8N3TYQLsDSp_YR3xqR8G-bQ@mail.gmail.com>
 (Matthew Weber's message of "Wed, 5 Feb 2020 19:12:22 -0600")
References: <20200205182608.22695-1-matthew.weber@rockwellcollins.com>
 <20200205203257.48877881@windsurf>
 <CANQCQparBzmSPD9epjQw8t6jyMejP0E1X0GjTUkXHpjXTi8Svg@mail.gmail.com>
 <CANQCQpZ9Hs6DA6XJpBnMLxqnnJj8N3TYQLsDSp_YR3xqR8G-bQ@mail.gmail.com>
Message-ID: <87wo8wuc3z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matthew" == Matthew Weber <matthew.weber@rockwellcollins.com> writes:

 > Thomas,
 > On Wed, Feb 5, 2020 at 2:46 PM Matthew Weber
 > <matthew.weber@rockwellcollins.com> wrote:
 >> 
 >> Thomas,
 >> 
 >> On Wed, Feb 5, 2020 at 1:33 PM Thomas Petazzoni
 >> <thomas.petazzoni@bootlin.com> wrote:
 >> >
 >> > On Wed,  5 Feb 2020 12:26:08 -0600
 >> > Matt Weber <matthew.weber@rockwellcollins.com> wrote:
 >> >
 >> > > The update of rng-tools from 5 to 6.7 introduced a change where
 >> > > the jitterentropy library was enabled by default instead of
 >> > > returning a special 66 return code to hangle the case of no
 >> > > hwrng. This patch reverts that change and allows a user to
 >> > > select when to enable the jitterentropy source. The bug
 >> > > documents an issue of when a hwrng is enabled with jitterentropy
 >> > > there is a longer boot time.
 >> >
 >> > I don't understand this story of the 66 return code. Could you explain
 >> > a bit more ?
 >> 
 >> In Buildroot commit 22cb51e1 the systemd support addition included the
 >> successcode change based on the Fedora bugfix for ignoring if no hwrng
 >> is present (https://bugzilla.redhat.com/show_bug.cgi?id=892178).

 > Ryan Barnett noticed that rng-tools dropped the special return code.
 > I guess we could just drop support for this special case as well....
 > https://github.com/nhorman/rng-tools/blob/v6.8/rngd.c#L805

Has that Fedora patch ever been included upstream? I don't seem to find
it in the history.

I btw see there is a 6.9 release with more bugfixes, care to send a
patch bumping the version?

-- 
Bye, Peter Korsgaard
