From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 06 Jan 2009 16:08:15 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <20090106140140.GA22854@zelow.no> (Thomas Lundquist's message of
	"Tue\, 6 Jan 2009 15\:01\:41 +0100")
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
	<20090106140140.GA22854@zelow.no>
Message-ID: <87aba4pj4w.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Lundquist <lists@zelow.no> writes:

Hi,

 Thomas> On Mon, Jan 05, 2009 at 10:18:01PM +0100, Peter Korsgaard wrote:
 >> 
 >> I offer to do something about both: Take over maintainership and get
 >> atual stable releases out the door (if Erik and the other developers
 >> agree).

 Thomas> The first question then is what kind of maintainer you mean. 

 Thomas> The One that makes releases or The One that maintains
 Thomas> coherency and vetoes big changes?

Primarily the first, but also the 2nd where needed. I think we have
done relatively good so far without a maintainer, so I expect the 2nd
part to be fairly infrequent.

 >> What is the plan? Getting the first release out is always the
 >> hardest, so I would on purpose aim low for the first release and
 >> get it out soon (February).

 Thomas> That *is* quick.

It is, but why delay it any longer? People are using current svn
anyway, so we might as well make a release of it.

 >> The target is to get all architectures to build (and
 >> run where hw is available for test) using the default toolchain config
 >> and busybox, anything else is just a bonus.

 Thomas> Should we have some arch_testconfig as we have defconfigs?
 Thomas> First start with a simple config then add more.

Maybe. I would just start with the rm .config; make menuconf, select
arch, save; make

 >> I will put out the first
 >> release candidate early next week, so from then on please don't add
 >> anything else than bugfixes until the release it out. I believe in
 >> time based releases, so any architectures that we cannot fix in time
 >> will simply be disabled in kconfig (E.G. depend on BROKEN).

 Thomas> BROKEN or ROTTEN or something that will alert future
 Thomas> maintainer-wannabees.

Exactly.

 >> The big issue with buildroot quality control is the mindblowing
 >> number of configuration combinations and specialized hardware
 >> needed to test.

 Thomas> This has to be handles by a defined set of test cases based
 Thomas> on more or less generic HW, like evaluation kits.

Or qemu.

 Thomas> And also devices actively maintained by someone wanting it to
 Thomas> be a part of the test collection.

 Thomas> The odd cases have to be taken care of by ordinary bug tickets.

 Thomas> (BTW; WCHAR and LOCALE OFF is NOT a special case, it should
 Thomas> be default.  In my view, also LARGEFILE.)

You mean default on? They currently default to off, simply because of
their size impact.

 >> I am therefore convinced we need to leverage qemu and
 >> agressively deprecate legacy versions / packages + actively work with
 >> upstream to keep the number of patches low. 

 Thomas> I am afraid we need more than one version of the kernel (Ulf
 Thomas> wants is also) and I guess also of most of the toolchain but
 Thomas> the packages/ is another story.

Maybe, but we can surely do better than todays' forest.


 Thomas> If we do releases we should be able to cut down on the amount
 Thomas> of versions in the toolchain aswell, since comppanies should
 Thomas> freeze on a version if they plan to use it for years as Ulf
 Thomas> mentioned.

Exactly.

 >> I think our users would
 >> also be happier with a less ambitious project that wouldn't break left
 >> and right, instead of the current situation.

 Thomas> Agreed.

 Thomas> First thing I guess is to agree that we want this and 
 Thomas> then to make test criterias.

 Thomas> After that, lay down which big changes we want and distribute 
 Thomas> maintainer responsibilities.

-- 
Bye, Peter Korsgaard
