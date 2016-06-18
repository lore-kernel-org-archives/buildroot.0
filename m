From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 18 Jun 2016 15:05:04 +0200
Subject: [Buildroot] [PATCH 1/3] elfutils: bump version to 0.166
In-Reply-To: <1466174911-13566-1-git-send-email-Vincent.Riera@imgtec.com>
References: <1466174911-13566-1-git-send-email-Vincent.Riera@imgtec.com>
Message-ID: <20160618150504.55d48396@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Fri, 17 Jun 2016 15:48:29 +0100, Vicente Olivert Riera wrote:
> - Remove 0001-argp-support.patch since it's already included upstream:
>   https://git.fedorahosted.org/cgit/elfutils.git/commit/?id=1ab3c2befeedf5bd891cfbe17cfef79c06e5079a
> 
> - Tweak patches for this new version:
>   - 0002-disable-progs.patch
>   - 0003-fts.patch
>   - 0004-disable-po.patch
>   - 0005-really-make-werror-conditional-to-build-werror.patch
> 
> - Remove 0007-Allow-disabling-symbol-versioning-at-configure-t since
>   it's already included upstream:
>   https://git.fedorahosted.org/cgit/elfutils.git/commit/?id=bafacacaf7659a4933604662daba26a480b29a8d
> 
> - Remove portability patch since it's no longer needed. I have asked
>   Mark Wielaard regarding this topic given the portability patch looks
>   been discontinued since 0.163 and he replied the following:
>   - "I believe it is no longer needed. At least not on any platform I
>      am actively maintaining. See also this discussion from last year:
>      https://lists.fedorahosted.org/pipermail/elfutils-devel/2015-May/004825.html"
> 
> - Add zlib dependency since it's now mandatory:
>   configure: error: zlib not found but is required
> 
> Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
> ---
>  package/elfutils/0001-argp-support.patch           |  93 --------------
>  package/elfutils/0002-disable-progs.patch          |  22 ++--
>  package/elfutils/0003-fts.patch                    |  26 ++--
>  ...y-make-werror-conditional-to-build-werror.patch |  18 +--
>  ...bling-symbol-versioning-at-configure-time.patch | 139 ---------------------
>  package/elfutils/Config.in                         |   1 +
>  package/elfutils/elfutils.hash                     |   3 +-
>  package/elfutils/elfutils.mk                       |  11 +-
>  8 files changed, 40 insertions(+), 273 deletions(-)
>  delete mode 100644 package/elfutils/0001-argp-support.patch
>  delete mode 100644 package/elfutils/0007-Allow-disabling-symbol-versioning-at-configure-time.patch

All three patches applied, thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
