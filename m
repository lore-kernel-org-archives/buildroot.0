From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 04 Sep 2013 18:49:18 +0200
Subject: [Buildroot] [pull request] webkit: Version bump to 1.11.5
In-Reply-To: <CAG2jQ8gLL4NdmHcFA=ELMbFfHY1oGPGaXkvSaPk66sesh-0+6w@mail.gmail.com>
References: <CAG2jQ8gLL4NdmHcFA=ELMbFfHY1oGPGaXkvSaPk66sesh-0+6w@mail.gmail.com>
Message-ID: <5227648E.7030304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/03/13 15:59, Markos Chandras wrote:
> Hi,
>
> The following pull request bumps webkit to 1.11.5. A few upstream
> patches are necessary to
> make it work properly. It also restores the build on MIPS which is
> currently (1.9.6 and 1.11.5)
> broken due to missing assembly functions. The following patches have been
> applied:
>
> - upstream fix for 32-bit autotools
> - upstream fix for conditional gstreamer build of gtklauncher
> - upstream fix for detecting the latest harfbuzz
> - Update existing patch for disabling docs
> - Update existing patch for execinfo_h
> - upstream patch for the MIPS DFG support. This fixes
> compilation problems on MIPS.
>
> The patch was tested with MIPS32r2, x86_64 and ARM cortex-a9 configurations.
>
> The following changes since commit b7c0041c31754a5679eb0a3e4bcf41f80d473ae2:
>
>    kmod: does not support static builds (2013-09-02 23:22:14 +0200)
>
> are available in the git repository at:
>
>    https://github.com/hwoarang/buildroot.git webkit
>
> for you to fetch changes up to 26a8323eeed2a3cea5b53917565d4a23d7aa0889:
>
>    webkit: Version bump to 1.11.5 (2013-09-03 13:19:32 +0100)
>
> ----------------------------------------------------------------
> Markos Chandras (1):
>        webkit: Version bump to 1.11.5
>
>   package/webkit/Config.in                                   |   13 +-
>   package/webkit/webkit-build-fix-for-32-bit-autotools.patch |   34 +++
>   package/webkit/webkit-build-fix-for-gtklauncher.patch      |   51 ++++
>   package/webkit/webkit-detect-harfbuzz-icu.patch            |   28 +++
>   package/webkit/webkit-disable-docrebase.patch              |   13 +-
>   package/webkit/webkit-execinfo_h.patch                     |   20 +-
>   package/webkit/webkit-mips-dfg.patch                       | 1490
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
>   package/webkit/webkit.mk                                   |   18 +-

  Hi Markos,

  Any chance to manually remove the huge patch so that you can post this 
on the list? Otherwise, there's not much chance for a review...

  Is there a reason why you cannot download the upstream patches with 
WEBKIT_PATCH ?

  Regards,
  Arnout

>   8 files changed, 1637 insertions(+), 30 deletions(-)
>   create mode 100644 package/webkit/webkit-build-fix-for-32-bit-autotools.patch
>   create mode 100644 package/webkit/webkit-build-fix-for-gtklauncher.patch
>   create mode 100644 package/webkit/webkit-detect-harfbuzz-icu.patch
>   create mode 100644 package/webkit/webkit-mips-dfg.patch
>
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
