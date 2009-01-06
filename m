From: Thomas Lundquist <lists@zelow.no>
Date: Tue, 6 Jan 2009 15:01:41 +0100
Subject: [Buildroot] Buildroot maintainer and stable releases
In-Reply-To: <87prj1v4dy.fsf@macbook.be.48ers.dk>
References: <87prj1v4dy.fsf@macbook.be.48ers.dk>
Message-ID: <20090106140140.GA22854@zelow.no>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Jan 05, 2009 at 10:18:01PM +0100, Peter Korsgaard wrote:
> 
> I offer to do something about both: Take over maintainership and get
> atual stable releases out the door (if Erik and the other developers
> agree).

The first question then is what kind of maintainer you mean. 

The One that makes releases or The One that maintains coherency and 
vetoes big changes?

> What is the plan? Getting the first release out is always the hardest,
> so I would on purpose aim low for the first release and get it out
> soon (February).

That *is* quick.

> The target is to get all architectures to build (and
> run where hw is available for test) using the default toolchain config
> and busybox, anything else is just a bonus.

Should we have some arch_testconfig as we have defconfigs? First start
with a simple config then add more.

> I will put out the first
> release candidate early next week, so from then on please don't add
> anything else than bugfixes until the release it out. I believe in
> time based releases, so any architectures that we cannot fix in time
> will simply be disabled in kconfig (E.G. depend on BROKEN).

BROKEN or ROTTEN or something that will alert future maintainer-wannabees.

> The big issue with buildroot quality control is the mindblowing number
> of configuration combinations and specialized hardware needed to
> test. 

This has to be handles by a defined set of test cases based on more 
or less generic HW, like evaluation kits. 

And also devices actively maintained by someone wanting it to be a 
part of the test collection.

The odd cases have to be taken care of by ordinary bug tickets.

(BTW; WCHAR and LOCALE OFF is NOT a special case, it should be default.
 In my view, also LARGEFILE.)

> I am therefore convinced we need to leverage qemu and
> agressively deprecate legacy versions / packages + actively work with
> upstream to keep the number of patches low. 

I am afraid we need more than one version of the kernel (Ulf wants is also) 
and I guess also of most of the toolchain but the packages/ is another story.

If we do releases we should be able to cut down on the amount of versions in
the toolchain aswell, since comppanies should freeze on a version if they plan
to use it for years as Ulf mentioned.

> I think our users would
> also be happier with a less ambitious project that wouldn't break left
> and right, instead of the current situation.

Agreed.

First thing I guess is to agree that we want this and 
then to make test criterias.

After that, lay down which big changes we want and distribute 
maintainer responsibilities.



Thomas.
