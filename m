From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 10 Mar 2020 22:31:19 +0100
Subject: [Buildroot] [git commit branch/2019.02.x] package/ncurses: add
 upstream (security) patches up to 20200118
Message-ID: <20200310211926.738129085D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4b21273d71d094008330f56f936c762f6c3e7bd6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2019.02.x

Fixes the following security issues:

- CVE-2018-10754: In ncurses before 6.1.20180414, there is a NULL Pointer
  Dereference in the _nc_parse_entry function of tinfo/parse_entry.c.  It
  could lead to a remote denial of service if the terminfo library code is
  used to process untrusted terminfo data in which a use-name is invalid
  syntax (REJECTED).

- CVE-2018-19211: In ncurses 6.1, there is a NULL pointer dereference at
  function _nc_parse_entry in parse_entry.c that will lead to a denial of
  service attack.  The product proceeds to the dereference code path even
  after a "dubious character `*' in name or alias field" detection.

- CVE-2018-19217: In ncurses, possibly a 6.x version, there is a NULL
  pointer dereference at the function _nc_name_match that will lead to a
  denial of service attack.  NOTE: the original report stated version 6.1,
  but the issue did not reproduce for that version according to the
  maintainer or a reliable third-party.

- CVE-2019-17594: There is a heap-based buffer over-read in the
  _nc_find_entry function in tinfo/comp_hash.c in the terminfo library in
  ncurses before 6.1-20191012.

- CVE-2019-17595: There is a heap-based buffer over-read in the fmt_entry
  function in tinfo/comp_hash.c in the terminfo library in ncurses before
  6.1-20191012.

Ncurses upstream uses a fairly special way of releasing (security) bugfixes.
Approximately once a week an incremental .patch.gz is released, and once in
a while these incremental patches are bundled up to a bigger patch relative
to the current release in .patch.sh.bz2 format (a bzip2 compressed patch
with a small shell script prepended, luckily apply-patches can handle that),
and the relative patch files deleted.

For details of this process, see the upstream FAQ:
https://invisible-island.net/ncurses/ncurses.faq.html#applying_patches

Apply the latest .patch.sh.bz2 and incremental patches up to 20200118 to fix
a number of (security) issues.  Notice that these patch files are NOT
available on the GNU mirrors.

The license file COPYING is updated with the new Copyright year (2019 ->
2020), so update the hash accordingly.

While we are at it, adjust the white space in the .hash file to match
sha256sum output for consistency.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
[fix whitespace inconsistency after 'sha256' keyword]
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
[yann.morin.1998 at free.fr: fix license hash for (C) year]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 10fae9624b3c58e00e5406e8b489c4674d680380)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ncurses/ncurses.hash | 39 +++++++++++++++++++++++++++++++++++++--
 package/ncurses/ncurses.mk   | 38 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 75 insertions(+), 2 deletions(-)

diff --git a/package/ncurses/ncurses.hash b/package/ncurses/ncurses.hash
index 123256bf94..69115f5caf 100644
--- a/package/ncurses/ncurses.hash
+++ b/package/ncurses/ncurses.hash
@@ -1,4 +1,39 @@
 # Locally calculated after checking pgp signature
-sha256	aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17	ncurses-6.1.tar.gz
+sha256  aa057eeeb4a14d470101eff4597d5833dcef5965331be3528c08d99cebaa0d17  ncurses-6.1.tar.gz
+sha256  cf9038be62c49a6b5fe93f33b32f983649b2f4c4c31cc99bd18e1e5871c31443  ncurses-6.1-20190609-patch.sh.bz2
+sha256  4b0a4c6abce4543ac4fd4c3389b14825e73b7cddcbb01a687c5dd837f21a3b04  ncurses-6.1-20190615.patch.gz
+sha256  b2302625ec2fa6dce79622670452e56ff6130dc02e655b52177264cfeff84c51  ncurses-6.1-20190623.patch.gz
+sha256  48b004a3e5409a02a5e751f996fe487f5ce45be1fff38572f7cc8167b22179bf  ncurses-6.1-20190630.patch.gz
+sha256  faf849eed92161ac09782badf84a19ad6beae472e87d460905865e08a6ed46e4  ncurses-6.1-20190706.patch.gz
+sha256  62d4954bf818659105aa1c21cc27cb2c133e02bdc7d3f6aa548caae2d1db7440  ncurses-6.1-20190713.patch.gz
+sha256  0c1a54bd5de9c890d1fabcfa92bf5bf46f7eccc54a48051367e82bdb29636450  ncurses-6.1-20190720.patch.gz
+sha256  0bbd08d3bd12686d4427c242d6a8fde2e299698039cd597303af713c5f538f17  ncurses-6.1-20190727.patch.gz
+sha256  40e5f350a921dbd03e3d9ff93bc477ec4f1f65878f307c534882fba3b0b40507  ncurses-6.1-20190728.patch.gz
+sha256  9648104311e209d17db9556d6efc898d5c80ed5fc80e8aa3cd08769544c839b8  ncurses-6.1-20190803.patch.gz
+sha256  fa1f583575717b2538d3a4ea59a67bc17dd07ed46cb99fe2beaf23d1b006e9df  ncurses-6.1-20190810.patch.gz
+sha256  5e9ae4f1b3e2e2d567a01a8fb2c9b7f3804cae97f28cd483d239afee781b8c2b  ncurses-6.1-20190817.patch.gz
+sha256  7592e5e610b3e9eeca78897da2330b7518f00e0a59d20df873c88a9b26bc4da9  ncurses-6.1-20190824.patch.gz
+sha256  1a9800a5ccc4f2cb572b63cdc8f1431642e014a58a30151af73977614d5c4aac  ncurses-6.1-20190831.patch.gz
+sha256  87685a6b90225efcd03375eb11b124fd9e95ee4b0f36bcbc82e56a70cd466b33  ncurses-6.1-20190907.patch.gz
+sha256  4ddebb6e0e5a67028eb3aca2352c9bd48cf122a512719f93e449e00a3c6634f8  ncurses-6.1-20190914.patch.gz
+sha256  4c725fa729d754f4e75af78fda4cf67d60e71c1625b5f4f49b7930c95bb8dd36  ncurses-6.1-20190921.patch.gz
+sha256  a830b879b57906b1e480e4785b32cec05081b7849c06c4b116459c4d343ba21b  ncurses-6.1-20190928.patch.gz
+sha256  d5eae35d920409613f565825e1e215fed89828040aab541328455da38e1a9b7c  ncurses-6.1-20191005.patch.gz
+sha256  136dbd07254810728c1fcb7614b566e7c3cb6af8c0783019bbb6b4b5e3c1e2c6  ncurses-6.1-20191012.patch.gz
+sha256  1d5125b20792e9f534432c3ef2aa68984c713416addeb2c4364c5ae897a3b8b7  ncurses-6.1-20191015.patch.gz
+sha256  a6475c05312ba0b12b72b83529c1d283a14c4470414c505fa45451e35f3ffcf5  ncurses-6.1-20191019.patch.gz
+sha256  f6c7469f33065faf1d04ac9e9bea1a88142b00b82e3db3674cca9ec24920b4af  ncurses-6.1-20191026.patch.gz
+sha256  0d0443937b9c04663de25b405bb95e658e7c87e1dd7a726b3813aa7f9b55f69a  ncurses-6.1-20191102.patch.gz
+sha256  f3b75787918d2f02a2005877e81fdc054c45b8249b43aabb531e3b817bcf7576  ncurses-6.1-20191109.patch.gz
+sha256  801d138b55986719aea7f42dc8c0cb618fa9a6edf92d1789a6ba5d61678f7761  ncurses-6.1-20191116.patch.gz
+sha256  45f447cf2c7a24295c7b9210473e943a238c57ca80581d121c9a1a3aa05332a6  ncurses-6.1-20191123.patch.gz
+sha256  ea758e3b0162348c4d5d6dac56f95809da3b7d0589205661a13430eb93f72f75  ncurses-6.1-20191130.patch.gz
+sha256  16b5a588c56a53c468d2359b21d5d8a007c4ef7696de12c964a1b661ed185f72  ncurses-6.1-20191207.patch.gz
+sha256  8725a2dc8f1cfdab41cb5fe56f930e070f8cdc81a77f303ef2658f65cd0b8edd  ncurses-6.1-20191214.patch.gz
+sha256  7e2a06fb0af6c84269d23ffe06c689bf1a8a57af39369690ee0698778d4b6cda  ncurses-6.1-20191221.patch.gz
+sha256  d052bcdb38f8b45a00c0a3190dec7ac1e72d5682f3a16d8accda239308aad62f  ncurses-6.1-20191228.patch.gz
+sha256  7b6253bae438154a88c7f3e301b872ed7ad71f943c873f4e6c82d8d36a5df72b  ncurses-6.1-20200104.patch.gz
+sha256  e438f28025c7d97c7f8fabf40eeab68bbf8ca871a0ba349e3fdec9165efe85cb  ncurses-6.1-20200111.patch.gz
+sha256  06d002c33f727c4a36a0b502c226ea3c3c5b80770703d2f783fffa6a0db04d92  ncurses-6.1-20200118.patch.gz
 # Locally computed
-sha256	86106f0da1cf5ccfa0f0651665dd1b4515e8edad1c7972780155770548b317d9	COPYING
+sha256  4d1fde61868c73776a539366dccf5d5a4857e7fd7299efb1f02e07c2afe9ea87  COPYING
diff --git a/package/ncurses/ncurses.mk b/package/ncurses/ncurses.mk
index 12fb9812e7..c11650c766 100644
--- a/package/ncurses/ncurses.mk
+++ b/package/ncurses/ncurses.mk
@@ -11,6 +11,44 @@ NCURSES_DEPENDENCIES = host-ncurses
 NCURSES_LICENSE = MIT with advertising clause
 NCURSES_LICENSE_FILES = COPYING
 NCURSES_CONFIG_SCRIPTS = ncurses$(NCURSES_LIB_SUFFIX)6-config
+NCURSES_PATCH = \
+	$(addprefix https://invisible-mirror.net/archives/ncurses/$(NCURSES_VERSION)/, \
+		ncurses-6.1-20190609-patch.sh.bz2 \
+		ncurses-6.1-20190615.patch.gz \
+		ncurses-6.1-20190623.patch.gz \
+		ncurses-6.1-20190630.patch.gz \
+		ncurses-6.1-20190706.patch.gz \
+		ncurses-6.1-20190713.patch.gz \
+		ncurses-6.1-20190720.patch.gz \
+		ncurses-6.1-20190727.patch.gz \
+		ncurses-6.1-20190728.patch.gz \
+		ncurses-6.1-20190803.patch.gz \
+		ncurses-6.1-20190810.patch.gz \
+		ncurses-6.1-20190817.patch.gz \
+		ncurses-6.1-20190824.patch.gz \
+		ncurses-6.1-20190831.patch.gz \
+		ncurses-6.1-20190907.patch.gz \
+		ncurses-6.1-20190914.patch.gz \
+		ncurses-6.1-20190921.patch.gz \
+		ncurses-6.1-20190928.patch.gz \
+		ncurses-6.1-20191005.patch.gz \
+		ncurses-6.1-20191012.patch.gz \
+		ncurses-6.1-20191015.patch.gz \
+		ncurses-6.1-20191019.patch.gz \
+		ncurses-6.1-20191026.patch.gz \
+		ncurses-6.1-20191102.patch.gz \
+		ncurses-6.1-20191109.patch.gz \
+		ncurses-6.1-20191116.patch.gz \
+		ncurses-6.1-20191123.patch.gz \
+		ncurses-6.1-20191130.patch.gz \
+		ncurses-6.1-20191207.patch.gz \
+		ncurses-6.1-20191214.patch.gz \
+		ncurses-6.1-20191221.patch.gz \
+		ncurses-6.1-20191228.patch.gz \
+		ncurses-6.1-20200104.patch.gz \
+		ncurses-6.1-20200111.patch.gz \
+		ncurses-6.1-20200118.patch.gz \
+	)
 
 NCURSES_CONF_OPTS = \
 	--without-cxx \
