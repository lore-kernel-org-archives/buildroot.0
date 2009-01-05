From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 05 Jan 2009 22:18:01 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
Message-ID: <87prj1v4dy.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi, and happy new year everyone,

The end of the year is a moment to take a step back and take a bigger
look at the situation. I have done that for buildroot, and as I see it
the two biggest problems we have are:

 - Lack of an active maintainer. No hard feelings, but lets face it -
   Erik hasn't really been active in buildroot development for quite
   some time. This isn't a big deal for day to day development, but it
   means that there's no one doing stuff like keeping the website
   up to date, a central contact point for infrastruture issues (like
   the recent break in), make decissions when there is disagreements
   among developers (we already lost Bernhard because of that), and:
 - Lack of releases. It has often been discussed, but nothing has come
   of it.

I offer to do something about both: Take over maintainership and get
atual stable releases out the door (if Erik and the other developers
agree).

What is the plan? Getting the first release out is always the hardest,
so I would on purpose aim low for the first release and get it out
soon (February). The target is to get all architectures to build (and
run where hw is available for test) using the default toolchain config
and busybox, anything else is just a bonus. I will put out the first
release candidate early next week, so from then on please don't add
anything else than bugfixes until the release it out. I believe in
time based releases, so any architectures that we cannot fix in time
will simply be disabled in kconfig (E.G. depend on BROKEN).

After that I would like us to move to a regular release schedule every
3 months with 2 months of development and 1 month of stabilization.

The big issue with buildroot quality control is the mindblowing number
of configuration combinations and specialized hardware needed to
test. I am therefore convinced we need to leverage qemu and
agressively deprecate legacy versions / packages + actively work with
upstream to keep the number of patches low. I think our users would
also be happier with a less ambitious project that wouldn't break left
and right, instead of the current situation.

Let me know what you think.

-- 
Bye, Peter Korsgaard
