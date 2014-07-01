From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 1 Jul 2014 22:13:26 +0200
Subject: [Buildroot] [PATCH 00/10] Proposals of deprecation/removal,
 mainly affecting toolchain
In-Reply-To: <53B3073B.8090005@zacarias.com.ar>
References: <1404237789-15563-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <53B3073B.8090005@zacarias.com.ar>
Message-ID: <20140701221326.3ca5279f@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Gustavo Zacarias,

On Tue, 01 Jul 2014 16:08:43 -0300, Gustavo Zacarias wrote:

> >  - Deprecation of the AVR32 architecture.
> 
> +1 from me, it's a dead-end and i've been (not secretly) hoping for this.

Right, me too :)

> >  - Removal of old binutils versions
> >  - Removal of uClibc 0.9.32.1
> >  - Removal of gcc 4.3.x and 4.6.x
> >  - Removal of gdb 7.4 and 7.5
> >  - Removal of busybox version selection
> 
> All of these should follow the deprecation guidelines i think?

Does it really needs to follow a deprecation process, when those
versions are no longer the default versions for any architecture since
a long time, and there are alternatives offered by simply switching to
a newer version. In my opinion, a deprecation process is needed when we
intend to really remove a feature (such as AVR32 support, or a complete
package), but not necessarily when removing really old versions of
toolchain components, not used as the default version since a long time.

But I'm open to others opinions on the matter, and will re-adjust the
patch series accordingly.

> Busybox in particular should keep at least a previous version around,
> because there have been cases of .0 releases being quite broken.
> Maybe patches show up soon but they don't follow a release schedule like
> we do and there could be problems with that.

We don't keep two versions of any other package, why would we do it for
Busybox that is widely tested, and therefore most likely issues are
going to be found before we do a Buildroot release?

If people insist, I'm OK with keeping a version selection, but I find
it pretty useless to have it specifically for Busybox and not for all
the other packages that we have. For example, when bumping Qt from
5.3.1 to 5.4.0, should we keep 5.3.1 around because 5.4.0 is not
guaranteed to be as stable?

> Also punching a hole in gcc version continuity even though logical
> sounds dirty (and really they aren't stopping any features other than
> missing atomics in old versions).

Yes, I know the hole is a bit weird, but 4.3.x and 4.6.x are the only
versions that can be easily removed: 4.4.x is still needed for SPARC
Leon (hence the mail I've sent to Konrad) and 4.5.x is still the
default version for Blackfin (would we be able to bump this? I
remember you did the internal toolchain support for Blackfin).
Basically, I'd like to get rid of 4.2.x (by removing AVR32), 4.3.x (can
be done now), 4.4.x (by updating the Leon support), 4.5.x (by updating
the Blackfin support) and 4.6.x (can be done now), and therefore keep
only 4.7.x, 4.8.x and 4.9.x.

Thanks for your feedback!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
