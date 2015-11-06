From: Doug Kehn <rdkehn@yahoo.com>
Date: Fri,  6 Nov 2015 09:19:45 -0600
Subject: [Buildroot] [PATCH v4 0/2] package/unscd: new package
Message-ID: <1446823187-7878-1-git-send-email-rdkehn@yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

$(APPLY_PATCHES) suggestion is not incorporated as the debian patches are
skipped due to 'Unsupported file type for ...' I'm not sure if updating
apply-patches.sh to handle patches with no extension is the right thing to do.
Patching the debain series and changing patch names to add .patch extension
seems like overkill when compared to just handling everything in the .mk.

systemd recipe/support is removed. systemd support is best left to someone
versed in systemd who desires to use unscd with systemd.

The BR2_GLIBC_NSCD suggestion is incorporated. However, I'm not sure what the
proper next steps are to properly install glibc nscd for both internal/external
toolchains. Is it sufficient, for now, to just define BR2_GLIBC_NSCD?

Doug Kehn (2):
  package/unscd: new package
  toolchain/toolchain-common.in: install nscd

 package/Config.in             |  1 +
 package/unscd/Config.in       | 11 ++++++++++
 package/unscd/S46unscd        | 24 +++++++++++++++++++++
 package/unscd/unscd.hash      |  4 ++++
 package/unscd/unscd.mk        | 49 +++++++++++++++++++++++++++++++++++++++++++
 toolchain/toolchain-common.in |  4 ++++
 6 files changed, 93 insertions(+)
 create mode 100644 package/unscd/Config.in
 create mode 100644 package/unscd/S46unscd
 create mode 100644 package/unscd/unscd.hash
 create mode 100644 package/unscd/unscd.mk

--
Changes v3 -> v4
  - Incorporate feedback/suggestions by Yann and Maxime.
Changes v2 -> v3
  - Remove trailing '/' from UNSCD_SITE.
  - Whitespace cleanup.
Changes v1 -> v2
  - Incorporate feedback/suggestions by Yann (from nss-pam-ldapd patch).

-- 
2.6.2
