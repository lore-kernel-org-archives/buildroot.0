From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 29 Jan 2009 15:57:15 +0100
Subject: [Buildroot] target/device/Atmel kernel patches
In-Reply-To: <FE6DCE243B7A4724B6B33E85771AD61F@aeglos> (Ulf Samuelsson's
	message of "Thu\, 29 Jan 2009 15\:33\:21 +0100")
References: <87ab9d4w6j.fsf@macbook.be.48ers.dk>
	<1233005366.2298.118.camel@elrond.atmel.com>
	<871vup4ul9.fsf@macbook.be.48ers.dk>
	<1233008389.2298.129.camel@elrond.atmel.com>
	<87vds114op.fsf@macbook.be.48ers.dk>
	<FE6DCE243B7A4724B6B33E85771AD61F@aeglos>
Message-ID: <871vumtb1w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ulf" == Ulf Samuelsson <ulf.samuelsson@atmel.com> writes:

Hi,

 Ulf> The first release of the product does not mean it enters
 Ulf> mainteance mode.  There is further active developement after the
 Ulf> first release to add feature.

To their custom applications I take, rather than the cots rootfs
components of buildroot?

 Ulf> At one point in development, there is a decision to freeze
 Ulf> kernel version and any errors found will be handled by patching
 Ulf> that kernel version, sometimes backpatching from newer kernels.

 Ulf> Once that point is reached, then it becomes a very serious decision
 Ulf> to move to a new kernel.

The same probably goes for buildroot?

 Ulf> One of our key customer is working on a major release
 Ulf> using the 2.4.x kernel version they selected in 2004.

Giggle, as long as I don't have to do it ;)

 Ulf> Your approach, will automatically disqualify the use of Buildroot
 Ulf> for any customers following normal behaviour.

Why? It obviously didn't disqualify the kernel.

 Ulf> I have met two customers using buildroot this week, and they
 Ulf> point out that the only use they find for buildroot is as a way
 Ulf> to get the latest patches/build recipes, and they cannot do
 Ulf> anything useful with buildroot itself due to its higly volatile
 Ulf> nature.  They need stability, and they do not want to make their
 Ulf> own decisions.

That's why I'm doing releases.

 >> For starting a new project, selecting anything else than the 2.6.28
 >> (or even better, the latest 2.6.29-rcX) seems pretty silly to me, but
 >> I'm even stretching it to include 2.6.27 just in case.

 Ulf> I was told some time ago, that the latest version of Xenomai for
 Ulf> ARM only runs on 2.6.26 kernels.  I do not know if this has
 Ulf> changed, but there are drawbacks on beeing too hasty.

Could be, have never used Xenomai - But that's the "joys" of using out
of tree stuff. It can handly be anyone elses fault than the Xenoami
people.

 Ulf> If you continue your thinking, then you will soon delete 2.6.27 and then
 Ulf> 2.6.28 etc.
 Ulf> making this something you can use for evalution but nothing more.

Again I don't see how this is. I have used buildroot for commercial
products for years, even without releases. It's just a question of
managing it, just like for the Linux kernel and U-Boot and all the
other components.

 Ulf> The user interface for building linux is clean and simple
 Ulf> and I think that people using old kernels, know how to come around
 Ulf> any difficulty they will stumble upon and can handle that with
 Ulf> custom patches, without the main buildroot team beeing involved.

Just like for Linux and all the other open source projects they are
using they have the choice between staying uptodate and get the newest
features/bugfixes or stick to an old version and backport what they
need.

I don't see how buildroot is any different here.

 >> So again, what kernel versions in arch-arm can we remove from svn?
 >> 

 Ulf> If we want to cover 95% of the cases, we need to keep kernel versions which
 Ulf> are minium 2 years or younger, but 3 years is desirable.

That's completely unrealistic with new major upstream releases every 3
months. I think we should rather aim for something like the last 2-3
versions.

 >> Of course there is, otherwise the number of configuration combinations
 >> to test would grow astronomically.
 >> 

 Ulf> No, because the kernel is orthogonal to the file system,
 Ulf> I see that we need to test kernels when they are are released
 Ulf> and then the kernels should be frozen.

Those old and obsolete patches don't belong in buildroot proper (in
fact I don't think we should have ANY feature patches, just bugfixes -
But that's another discussion).

We already have a situation where more than half the size of buildroot
is patches, continuing to grow this is not a workable situation.

If people want to use an old kernel they can maintain it outside of
buildroot or in their local buildroot tree.

I do agree we should make it easier to build u-boot / linux from a
non-mainline svn/git/whatever tree, that's something I will work on
after the release.

-- 
Bye, Peter Korsgaard
