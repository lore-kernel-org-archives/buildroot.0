From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 8 Sep 2015 15:57:14 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/at: updated version from
 3.1.13 to 3.1.16
In-Reply-To: <1473000.Q0pm3JyGrD@deathstar>
References: <11269096.cxoRZRC0e7@deathstar> <1473000.Q0pm3JyGrD@deathstar>
Message-ID: <55EEE93A.6000609@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 08-09-15 14:13, Francesco Nwokeka wrote:
> Version 3 of the patch to update the "at" package.

 This part should be in the patch changelog, not as part of the commit message
(cfr. below).

> 
> The following changes were made:
> 
> * removed old patches from v3.1.13

 This duplicates the "The following patches were removed" statement.

> * Merged previous Makefile.in patches into one.

 Ick, that's not what I intended! We want a separate patch file for each
separate change. The two patches that you squashed into one do two distinct changes:

 - change IROOT into DESTDIR
 - don't try to install as root

So it's good to keep them separate.

 My proposal was to drop the first patch and just use IROOT. In buildroot, we
can easily use IROOT instead of DESTDIR by setting

AT_INSTALL_TARGET_OPTS = IROOT=$(TARGET_DIR) install


> * Leave only necessary patches and remove those already applied upstream

 Again, this commit message is a duplicate of the ones below.


 So basically you should just mention here that patch 0005 is refreshed and
renumbered.

> 
> The following patches were removed because already applied upstream:
> 
> 0001-configure.ac-remove-manual-compiler-check-with-AC_TR.patch
> 0002-configure.ac-convert-AC_TRY_COMPILE-AC_COMPILE_IFELS.patch
> 0003-Makefile.in-add-LDFLAGS-to-linking-stage.patch
> 0008-remove-glibc-__isleap-assumption.patch
> 
> Whilst the following were kept (and numbered accordingly):
> 
> 0006-getloadavg.c-fix.patch
> 0007-parsetime.l-include-config-h.patch
> 
> 
> 

 Too many empty lines.

> Signed-off-by: Francesco Nwokeka <francesco.nwokeka@gmail.com>

 There should be a patch changelog here (after the Signed-off-by), like so:

---
v2 -> v3: squash patch 0004 and 0005 into a single patch
v1 -> v2: do everything in a single commit instead of 5 commits


 Regards,
 Arnout

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
