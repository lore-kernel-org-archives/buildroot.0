From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 1 Aug 2013 07:50:49 +0200
Subject: [Buildroot] List of pending patches: what to do?
In-Reply-To: <51F94EBD.7060309@zacarias.com.ar>
References: <20130731191415.545f7dff@skate> <51F94EBD.7060309@zacarias.com.ar>
Message-ID: <20130801075049.37b13ddd@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Wed, 31 Jul 2013 14:51:57 -0300, Gustavo Zacarias wrote:
> On 07/31/2013 02:14 PM, Thomas Petazzoni wrote:
> 
> > http://patchwork.ozlabs.org/patch/155498 New: add lava-test package
> 
> I managed to get this working with modifications and the python fixes
> (which are already in the tree).
> However from what i've seen it doesn't seem useful for anything by
> itself, it's a testing framework with the builtins being pretty
> ubuntu-specific (and requiring a ton of other deps).
> Not sure what to do about it, it's not an out-of-the-box experience, it
> requires extensive tweaking to do anything useful.

So I'm proposing to drop this patch. There isn't much interest from the
current Buildroot contributors, and the original submitter hasn't
pushed the patch forward that much.

> > http://patchwork.ozlabs.org/patch/165542 [V2] p910nd: Add p910nd lightweight printserver
> 
> I'll rebase and give this one a try.

Good, patch delegated to you.

> > http://patchwork.ozlabs.org/patch/172171 avahi: only install default.script/S05avahi-setup.sh if not present in fs skeleton
> 
> I'm generally against initscript conditionals - after all who says it'll
> have the same sequence number or name in the skeleton?
> Post-build script IMHO.
> Otherwise a global option "don't install initscripts" might fit, however
> i've been using the script just fine for ages now.

In fact, I realize the patch here is not a patch against Buildroot,
it's just a diff I had done between two udhcpc scripts (the one
installed by Avahi and the one installed by Busybox), and recently,
through commit 0c229f70ea270069e981bfb59e3aea80b21bbcfb, Peter merged
the two. So I'll mark this patch as rejected.

> > http://patchwork.ozlabs.org/patch/178526 syslinux: fix host build with newer Linux headers
> 
> Version bump might be fitting, it's up to 6.01 now.

Indeed. So let's keep this patch around as a reminder to do something
about syslinux bump.

> > http://patchwork.ozlabs.org/patch/185522 eaccelerator
> > http://patchwork.ozlabs.org/patch/186837 Add config for PHP eaccelerator package. Signed-off-by: Dallas Clement <dallas.a.clement@gmail.com>
> 
> Not really an embedded-y package, eaccelerator and similar packages like
> xcache are basically intermediate opcode caches for the php
> interpreter/files.
> Basically you set aside an X amount of RAM (in the 2-digit MiB range
> usually) for that and successive hits get a good speed boost because
> they don't need to be re-interpreted again and again.
> This is a feature included in the PHP 5.5.x release, however i doubt
> we'll be bumping soon to it, 5.4.x is a better fit for now since 5.3.x
> is getting unsupported status soon.
> Widely used for big PHP deployments with many page hits - so i'm hmm
> about it and eventually it'll go away with PHP 5.5
> And it's tied up to PHP 5.3.x so it will block a 5.4.x or 5.5.x update
> unless we use the main git branch (no release yet, upstream is somewhat
> dead).

I marked the first as Superseded. For the second one, I replied to the
patch submitter to see if he's still interested.

> > http://patchwork.ozlabs.org/patch/196141 uClibc: install libc.so even if BR2_PREFER_STATIC_LIB is enabled
> 
> We should really "mv BR2_PREFER_STATIC_LIB BR2_STATIC_BUILD" or so as
> you've mentioned before - you either want or don't (want) a static build.

Agreed. Keeping this around for now until the static lib mess gets
fixed. I might be tackling this for 2013.11.

> > http://patchwork.ozlabs.org/patch/198127 automake version update 1.12.4
> 
> for-2013.12 i'll revisit bumping automake, at the moment i'd say no, and
> since there are newer versions "deferred" or "superseeded" would be
> appropiate.

Shouldn't we keep it around as a reminder to do something about
automake?

> > http://patchwork.ozlabs.org/patch/243442 [1/6] package infra: remove CPPFLAGS from CFLAGS
> > http://patchwork.ozlabs.org/patch/243445 [4/6] libcurl: bump to version 7.30.0
> 
> These depend on the generic package cleanups and some autotools package
> audits (maybe fixes). I've deferred them already, they're on my TODO
> list and i'll send new appropiate patches when it's done, for-2013.12.
> libcurl security patches are already in the tree so there's no rush.

Ok, thanks!

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
