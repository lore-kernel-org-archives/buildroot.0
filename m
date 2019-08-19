From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Aug 2019 19:07:24 +0200
Subject: [Buildroot] [PATCH 1/1] package/giflib: security bump to
 version 5.2.1
In-Reply-To: <20190819154603.51a042a2@windsurf.home> (Thomas Petazzoni's
 message of "Mon, 19 Aug 2019 15:46:03 +0200")
References: <20190818120432.22829-1-fontaine.fabrice@gmail.com>
 <20190819154603.51a042a2@windsurf.home>
Message-ID: <87ftlxgk37.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@bootlin.com> writes:

 > On Sun, 18 Aug 2019 14:04:32 +0200
 > Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

 >> - Switch to generic-package (autotools has been dropped since version
 >> 5.1.5)
 >> - Remove hook and instead use dedicated makefile targets to build only
 >> shared or static library and not binaries or documentation (added by
 >> an upstreamble patch)
 >> - ac_cv_prog_have_xmlto=no can be removed as doc is not built anymore
 >> - Fix CVE-2018-11490: The DGifDecompressLine function in dgif_lib.c in
 >> GIFLIB (possibly version 3.0.x), as later shipped in cgif.c in sam2p
 >> 0.49.4, has a heap-based buffer overflow because a certain
 >> "Private->RunningCode - 2" array index is not checked. This will lead
 >> to a denial of service or possibly unspecified other impact.
 >> - Fix CVE-2019-15133: In GIFLIB before 2019-02-16, a malformed GIF file
 >> triggers a divide-by-zero exception in the decoder function DGifSlurp
 >> in dgif_lib.c if the height field of the ImageSize data structure is
 >> equal to zero.
 >> 
 >> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 >> ---
 >> ...dd-targets-to-manage-static-building.patch | 69 +++++++++++++++++++
 >> package/giflib/giflib.hash                    |  4 +-
 >> package/giflib/giflib.mk                      | 47 +++++++++----
 >> 3 files changed, 104 insertions(+), 16 deletions(-)
 >> create mode 100644 package/giflib/0001-Makefile-add-targets-to-manage-static-building.patch

 > I must say this is quite big of a change for master at this point, and
 > for a security bump in general. I'm not sure between applying this, or
 > just cherry-picking the two commits that fix the CVEs.

Yes, I believe that is also what we agreed when Bernd posted a similar
patch last month:

https://patchwork.ozlabs.org/patch/1124785/

-- 
Bye, Peter Korsgaard
