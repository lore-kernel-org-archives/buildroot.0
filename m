From: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Date: Thu, 25 May 2017 13:36:42 +0000
Subject: [Buildroot] [PATCH] toolchain: Bump ARC tools to arc-2017.03
 release
In-Reply-To: <20170525152739.364680be@free-electrons.com>
References: <20170523184137.48708-1-abrodkin@synopsys.com>
 <20170525152739.364680be@free-electrons.com>
Message-ID: <1495719401.3673.4.camel@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, 2017-05-25 at 15:27 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Tue, 23 May 2017 21:41:37 +0300, Alexey Brodkin wrote:
> > 
> > This commit finally bumps ARC toolchain to arc-2017.03 release.
> > More info on this release could be found here:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_toolchain_releases_tag_arc-2D2017.0
> > 3&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=NwE8728l_IQUKFg_WQ1Yxh-
> > LEQ9zHJLRTmkZwaKPAeY&s=MiPhqRzYXkEc1aRWYCVMFpNgmLxqjXg72Ctkq60H2cA&e=?
> > 
> > Note mentioned above web-page is not yet populated but should be very soon.
> > As a safe fall-back interested could refer to RC2 page here:
> > https://urldefense.proofpoint.com/v2/url?u=https-3A__github.com_foss-2Dfor-2Dsynopsys-2Ddwc-2Darc-2Dprocessors_toolchain_releases_tag_arc-2D2017.0
> > 3-2Drc2&d=DwICAg&c=DPL6_X_6JkXFx7AXWqB0tg&r=lqdeeSSEes0GFDDl656eViXO7breS55ytWkhpk5R81I&m=NwE8728l_IQUKFg_WQ1Yxh-
> > LEQ9zHJLRTmkZwaKPAeY&s=3N44QqVhn9-WVdCqm5Xrlr8VbHVWa5yZuwy7UJa5-0k&e=?
> > 
> > Signed-off-by: Alexey Brodkin <abrodkin@synopsys.com>
> > Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> > ?package/binutils/Config.in.host????????????????????|??2 +-
> > ?.../0300-PATCH-ld-makefile.patch???????????????????|??0
> > ?.../0301-PATCH-check-ldrunpath-length.patch????????|??0
> > ?.../0500-add-sysroot-fix-from-bug-3049.patch???????|??0
> > ?.../0600-poison-system-directories.patch???????????|??0
> > ?package/binutils/binutils.hash?????????????????????|??2 +-
> > ?package/binutils/binutils.mk???????????????????????|??2 +-
> > ?package/gcc/Config.in.host?????????????????????????|??2 +-
> > ?...-return-false-for-any-PIC-related-unspecs.patch | 58 ----------------------
> > ?.../301-missing-execinfo_h.patch???????????????????|??0
> > ?.../860-cilk-wchar.patch???????????????????????????|??0
> > ?.../940-uclinux-enable-threads.patch???????????????|??0
> > ?package/gcc/gcc.hash???????????????????????????????|??2 +-
> > ?package/gdb/Config.in.host?????????????????????????|??2 +-
> > ?package/gdb/gdb.hash???????????????????????????????|??2 +-
> > ?15 files changed, 7 insertions(+), 65 deletions(-)
> > ?rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0300-PATCH-ld-makefile.patch (100%)
> > ?rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0301-PATCH-check-ldrunpath-length.patch (100%)
> > ?rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0500-add-sysroot-fix-from-bug-3049.patch (100%)
> > ?rename package/binutils/{arc-2017.03-rc2 => arc-2017.03}/0600-poison-system-directories.patch (100%)
> > ?delete mode 100644 package/gcc/arc-2017.03-rc2/0001-FIX-PIC-return-false-for-any-PIC-related-unspecs.patch
> > ?rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/301-missing-execinfo_h.patch (100%)
> > ?rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/860-cilk-wchar.patch (100%)
> > ?rename package/gcc/{arc-2017.03-rc2 => arc-2017.03}/940-uclinux-enable-threads.patch (100%)
> 
> It's normally way too late for version bumps, but since this is a bump
> from a -rc2 version to the final version, and limited to ARC stuff,
> I've applied it to master. I really hope it won't cause new build
> failures!

That's well understood indeed.
But that was the whole point of keeping up with RCs of ARC tools in
Buildroot's RCs so we can finally bump to the release.

Just for the record below are changes in between rc2 and final release.

GCC:
e406b240f26e - [FIX] Typo (10 days ago) <claziss>
139fed9d29ab - [FIX] PIC: return false for any PIC related??unspecs (10 days ago) <Claudiu Zissulescu>
fd593a115f30 - Revert "Changed filename for the expected dynamic loader for glibc." (2 weeks ago) <Vineet Gupta>
566195a06808 - Small fix to unwinding in ARC700. (2 weeks ago) <Cupertino Miranda>
7d380d8350a6 - [ARC] Update sleep builtin. (2 weeks ago) <claziss>

Binutils:
bf4076d02bdd - [FIX] revert jli: don't check for argument alignment (7 days ago) <claziss>
7ed115c021fb - [ARC] Update MAX_INSN_FLGS. (7 days ago) <claziss>
ed389633c649 - [ARC] Reformat error messages. (7 days ago) <claziss>
f27d6d99f566 - [ARC] Add ldi_base and ei_base aux regs (13 days ago) <claziss>
e02bf1fe7f06 - [JLI][FIX] Add test ld/testsuite/ld-arc/jli-overflow. Correct jli reloc (13 days ago) <claziss>

Hopefully these fixes won't cause more pain :)

-Alexey
