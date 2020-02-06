From: Norbert Lange <nolange79@gmail.com>
Date: Thu,  6 Feb 2020 10:36:23 +0100
Subject: [Buildroot] [PATCH 00/10] Improvements to systemd
Message-ID: <20200206093633.251413-1-nolange79@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

this contains several cleanups ond improvements on systemd,
it replaces old patches [1] and [2], including the
requested changes.

1.   allow the hook to operate on files added from an overlay
2.   hooks libnss-systemd into the rootfs (so that DynamicUser
     option works correctly)
3.   and following: update and improve user accounts
     (depends on 2.)
7.   and following: support systemd catalog files
9.   run systemd-tmpfiles in fakeroot step


[1] - https://patchwork.ozlabs.org/patch/1222103/
[2] - https://patchwork.ozlabs.org/patch/1222179/


Norbert Lange (10):
  package/systemd: move preset-all HOOK to fakeroot stage
  package/systemd: add libnss-systemd to name resolution
  package/systemd: remove unused user accounts
  package/systemd: create "remote" user if the feature is enabled
  package/systemd: cosmetic rearrange list of users
  package/systemd: sync user comments to upstream
  Makefile: Handle systemd catalogs in PURGE_LOCALES
  package/systemd: add hook to update journalctl catalogs
  package/systemd: option to delete all catalog files
  package/systemd: invoke systemd-tmpfilesd on final image

 Makefile                   |  8 ++++++
 package/systemd/Config.in  | 12 ++++++++
 package/systemd/systemd.mk | 56 ++++++++++++++++++++++++++++++--------
 3 files changed, 65 insertions(+), 11 deletions(-)

--
2.24.1
