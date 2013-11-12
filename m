From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 12 Nov 2013 14:46:21 +0100
Subject: [Buildroot] [PATCH 2 of 2] infra: remove usage of pkgparentdir
 in favor of pkgdir
In-Reply-To: <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
References: <patchbomb.1384170790@argentina>
 <8953db252a5816d2e988.1384170792@argentina> <52816529.9010704@mind.be>
 <CAAXf6LVMJ-EQemvYkvujm+zypQO_cufQq5=z7zz_tto2hug=Aw@mail.gmail.com>
Message-ID: <5282312D.9090409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 12/11/13 09:56, Thomas De Schampheleire wrote:
> On Tue, Nov 12, 2013 at 12:15 AM, Arnout Vandecappelle<arnout@mind.be>  wrote:
>> >On 11/11/13 12:53, Thomas De Schampheleire wrote:
>>> >>
>>> >>As Arnout suggested, pkgparentdir is no longer really needed. Its usage
>>> >>can
>>> >>be replaced with pkgdir. This patch makes that change, and removes the
>>> >>definition of pkgparentdir.
>>> >>
>>> >>Signed-off-by: Thomas De Schampheleire<thomas.de.schampheleire@gmail.com>
>>> >>
>>> >>---
>>> >>Note: as a consequence of this change, the definition of FOO_DIR_PREFIX
>>> >>slightly changed. I could have renamed the variable, but FOO_DIR was
>>> >>already
>>> >>taken, and it's still more or less a prefix.
>> >
>> >
>> >  I think it's a better idea to choose a new name - if only to help people
>> >who are using this variable in custom packages. Or better yet, remove it
>> >completely - it's anyway not used anymore.
> The only remaining place is in the foo-patch block, to get the
> location of patches for that package.
> That is outside the inner-generic-package, so we cannot use $(4)
> anymore. How do you propose to solve that?

  Oops, I forgot about that.

  It would be possible to move the definition of PATCH_BASE_DIRS to 
inner-generic-package (i.e. call it $(2)_PATCH_BASE_DIRS and expand 
$($(PKG)_PATCH_BASE_DIRS) in the pattern rule). However, it's a lot 
clearer to define something like $(2)_BRDIR in inner-generic-package.

  Regards,
  Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
