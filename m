Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CACAAC433EF
	for <buildroot@archiver.kernel.org>; Wed,  9 Feb 2022 16:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35EC140904;
	Wed,  9 Feb 2022 16:52:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OnTfzDKyh5in; Wed,  9 Feb 2022 16:52:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 880FC40902;
	Wed,  9 Feb 2022 16:52:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C25CD1BF47D
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AE13160B5C
 for <buildroot@lists.busybox.net>; Wed,  9 Feb 2022 16:52:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dtu4Mi04Ce6v for <buildroot@lists.busybox.net>;
 Wed,  9 Feb 2022 16:52:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A715960AEC
 for <buildroot@buildroot.org>; Wed,  9 Feb 2022 16:52:26 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id CC6BAC0002;
 Wed,  9 Feb 2022 16:52:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1nHqCb-0001D8-Mf; Wed, 09 Feb 2022 17:52:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  9 Feb 2022 17:50:26 +0100
Message-Id: <20220209165213.4498-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 000/107] Drop python 2.7
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Python 2.7 is EOL since April 2020 and almost all packages support
python 3, so drop it before the 2022.02 release.

It is a big series, but the changes are mainly mechanical in nature.

There is still some cleanup to do, E.G. the python2 support in
pkg-python and the host python-setuptools package - But this is IMHO
the minimum changes before -rc1.

Peter Korsgaard (107):
  support/testing: drop python2 tests
  package/python: drop target package
  package/alsa-lib: drop python2 support
  package/bmap-tools: drop python2 support
  package/boost: drop python2 support
  package/cifs-utils: drop python2 support
  package/cracklib: move python support to python3
  package/crudini: drop python2 support
  package/dbus-python: drop python2 support
  package/docker-compose: drop reference to BR2_PACKAGE_PYTHON
  package/dstat: drop python2 support
  package/evemu: drop python2 support
  package/fail2ban: drop python2 support
  package/glsandbox-player: drop reference to python2
  package/gpsd: drop python2 support
  package/gst1-devtools: drop python2 support
  package/i2c-tools: drop python2 support
  package/iotop: drop python2 support
  package/jack2: drop python2 support
  package/kmod: drop python2 support
  package/libcec: drop python2 support
  package/libevent: drop python2 support
  package/libftdi1: drop python2 support
  package/libiio: drop python2 support
  package/libpwquality: drop python2 support
  package/libsigrokdecode: drop reference to python2
  package/libsoc: drop python2 support
  package/lttng-libust: drop python2 support
  package/networkd-dispatcher: drop reference to python2
  package/nftables: drop python2 support
  package/ogre: drop python2 support
  package/opkg-utils: drop reference to python2
  package/owfs: drop python support
  package/python-aenum: drop python2 support
  package/python-argon2-cffi: drop python2 support
  package/python-bsdiff4: drop python2 support
  package/python-can: drop python2 support
  package/python-couchdb: drop python2 support
  package/python-dicttoxml: drop python2 support
  package/python-dpkt: drop python2 support
  package/python-esptool: drop python2 support
  package/python-fire: drop python2 support
  package/python-flask: drop python2 support
  package/python-jsonschema: drop python2 support
  package/python-libconfig: drop python2 support
  package/python-logbook: drop python2 support
  package/python-lxml: drop python2 support
  package/python-m2crypto: drop python2 support
  package/python-pexpect: drop python2 support
  package/python-pickleshare: drop python2 support
  package/python-pymodbus: drop python2 support
  package/python-pyqrcode: drop python2 support
  package/python-pyqt5: drop python2 support
  package/python-pyroute2: drop python2 support
  package/python-pyudev: drop python2 support
  package/python-raven: drop python2 support
  package/python-reentry: drop python2 support
  package/python-remi: drop python2 support
  package/python-scapy: drop python2 support
  package/python-sentry-sdk: drop python2 support
  package/python-setuptools: drop python2 support
  package/python-sip: drop python2 support
  package/python-txtorcon: drop python2 support
  package/python-typing-extensions: drop python2 support
  package/python-urllib3: drop python2 support
  package/python-web2py: drop python2 support
  package/python-webob: drop python2 support
  package/python-websocket-client: drop python2 support
  package/python-werkzeug: drop python2 support
  package/python-whoosh: drop python2 support
  package/python-xlrd: drop python2 support
  package/python-xmltodict: drop python2 support
  package/python3: drop references to python2
  package/ranger: drop python2 support
  package/selinux-python: drop reference to python2
  package/snmpclitools: drop python2 support
  package/supervisor: drop python2 support
  package/suricata: drop python2 support
  package/syslog-ng: drop python2 support
  package/tovid: drop python2 support
  package/trace-cmd: drop python2 support
  package/util-linux: drop python2 support
  package/zfs: drop python2 support
  package/python: drop host package
  package/python-backports-abc: drop python2 specific package
  package/python-backports-shutil-get-terminal-size: drop python2
    specific package
  package/python-backports-ssl-match-hostname: drop python2 specific
    package
  package/python-futures: drop python2 specific package
  package/python-id3: drop python2 specific package
  package/python-ipaddr: drop python2 specific package
  package/python-ipaddress: drop python2 specific package
  package/python-mad: drop python2 specific package
  package/python-nfc: drop python2 specific package
  package/python-pam: drop python2 specific package
  package/python-pathlib2: drop python2 specific package
  package/python-pypcap: drop python2 specific package
  package/python-pyro: drop python2 specific package
  package/python-singledispatch: drop python2 specific package
  package/python-subprocess32: drop python2 specific package
  package/python-typing: drop python2 specific package
  package/python-yieldfrom: drop python2 specific package
  package/python-configobj: drop python2 specific package
  package/python-dialog: drop python2 specific package
  package/python-enum: drop python2 specific package
  package/python-enum34: drop python2 specific package
  package/python-functools32: drop python2 specific package
  docs/manual: drop python2 references

 Config.in.legacy                              | 140 ++++++++
 DEVELOPERS                                    |  15 -
 docs/manual/adding-packages-python.txt        |   8 -
 docs/manual/writing-rules.txt                 |   8 +-
 package/Config.in                             |  25 +-
 package/Config.in.host                        |   1 -
 package/alsa-lib/Config.in                    |   2 +-
 package/alsa-lib/alsa-lib.mk                  |  11 +-
 package/bmap-tools/Config.in                  |   5 +-
 package/boost/Config.in                       |   2 +-
 package/boost/boost.mk                        |  11 +-
 package/cifs-utils/Config.in                  |   2 +-
 package/cracklib/cracklib.mk                  |   7 +-
 package/crudini/Config.in                     |   2 +-
 package/dbus-python/Config.in                 |   8 +-
 package/dbus-python/dbus-python.mk            |  28 +-
 package/docker-compose/Config.in              |   9 +-
 package/dstat/Config.in                       |  10 +-
 package/evemu/evemu.mk                        |   4 +-
 package/fail2ban/Config.in                    |   2 +-
 package/fail2ban/fail2ban.mk                  |   7 +-
 package/glslsandbox-player/Config.in          |   1 -
 package/gpsd/Config.in                        |   4 +-
 package/gpsd/gpsd.mk                          |   4 -
 package/gstreamer1/gst1-devtools/Config.in    |   6 +-
 package/i2c-tools/i2c-tools.mk                |   8 +-
 package/iotop/Config.in                       |   9 +-
 package/jack2/Config.in                       |   5 +-
 package/kmod/kmod.mk                          |   4 +-
 package/libcec/libcec.mk                      |   4 +-
 package/libevent/libevent.mk                  |   2 +-
 package/libftdi1/Config.in                    |   2 +-
 package/libftdi1/libftdi1.mk                  |   2 +-
 package/libiio/Config.in                      |   2 +-
 package/libiio/libiio.mk                      |  10 +-
 package/libpwquality/libpwquality.mk          |   4 +-
 package/libsigrokdecode/Config.in             |   6 -
 package/libsoc/libsoc.mk                      |   6 +-
 package/lttng-libust/lttng-libust.mk          |   5 +-
 package/networkd-dispatcher/Config.in         |   2 -
 package/nftables/nftables.mk                  |   4 +-
 package/ogre/ogre.mk                          |   5 +-
 package/opkg-utils/Config.in                  |   6 -
 package/owfs/owfs.mk                          |  24 +-
 package/python-aenum/python-aenum.mk          |   9 -
 package/python-argon2-cffi/Config.in          |   1 -
 package/python-backports-abc/Config.in        |   8 -
 .../python-backports-abc.hash                 |   5 -
 .../python-backports-abc.mk                   |  14 -
 .../Config.in                                 |   8 -
 ...on-backports-shutil-get-terminal-size.hash |   5 -
 ...thon-backports-shutil-get-terminal-size.mk |  14 -
 .../Config.in                                 |   7 -
 .../python-backports-ssl-match-hostname.hash  |   5 -
 .../python-backports-ssl-match-hostname.mk    |  14 -
 package/python-bsdiff4/Config.in              |   3 +-
 package/python-can/Config.in                  |   7 +-
 package/python-configobj/Config.in            |  10 -
 .../python-configobj/python-configobj.hash    |   3 -
 package/python-configobj/python-configobj.mk  |  14 -
 package/python-couchdb/Config.in              |   3 +-
 package/python-dialog/Config.in               |  10 -
 package/python-dialog/python-dialog.hash      |   5 -
 package/python-dialog/python-dialog.mk        |  15 -
 package/python-dicttoxml/Config.in            |   3 +-
 package/python-dpkt/Config.in                 |   3 +-
 package/python-enum/Config.in                 |  12 -
 package/python-enum/python-enum.hash          |   5 -
 package/python-enum/python-enum.mk            |  14 -
 package/python-enum34/Config.in               |  12 -
 package/python-enum34/python-enum34.hash      |   5 -
 package/python-enum34/python-enum34.mk        |  17 -
 package/python-esptool/Config.in              |   3 +-
 package/python-fire/Config.in                 |   1 -
 package/python-fire/python-fire.mk            |   9 -
 package/python-flask/Config.in                |   7 +-
 package/python-functools32/Config.in          |   8 -
 .../python-functools32.hash                   |   4 -
 .../python-functools32/python-functools32.mk  |  14 -
 package/python-futures/Config.in              |   7 -
 package/python-futures/python-futures.hash    |   5 -
 package/python-futures/python-futures.mk      |  14 -
 package/python-id3/Config.in                  |   9 -
 package/python-id3/python-id3.hash            |   3 -
 package/python-id3/python-id3.mk              |  14 -
 package/python-ipaddr/Config.in               |   9 -
 package/python-ipaddr/python-ipaddr.hash      |   5 -
 package/python-ipaddr/python-ipaddr.mk        |  14 -
 package/python-ipaddress/Config.in            |   7 -
 .../python-ipaddress/python-ipaddress.hash    |   5 -
 package/python-ipaddress/python-ipaddress.mk  |  14 -
 package/python-jsonschema/Config.in           |   1 -
 package/python-libconfig/python-libconfig.mk  |   8 +-
 package/python-logbook/Config.in              |   3 +-
 package/python-lxml/Config.in                 |   3 +-
 package/python-m2crypto/Config.in             |   7 +-
 package/python-mad/Config.in                  |   9 -
 package/python-mad/python-mad.hash            |   3 -
 package/python-mad/python-mad.mk              |  29 --
 package/python-nfc/Config.in                  |  16 -
 package/python-nfc/python-nfc.hash            |   3 -
 package/python-nfc/python-nfc.mk              |  14 -
 package/python-pam/0001-dealloc.patch         |  25 --
 package/python-pam/0002-nofree.patch          |  68 ----
 .../0003-memory-errors-CVE2012-1502.patch     | 136 --------
 package/python-pam/Config.in                  |  16 -
 package/python-pam/python-pam.hash            |   3 -
 package/python-pam/python-pam.mk              |  16 -
 package/python-pathlib2/Config.in             |  13 -
 package/python-pathlib2/python-pathlib2.hash  |   5 -
 package/python-pathlib2/python-pathlib2.mk    |  14 -
 package/python-pexpect/python-pexpect.mk      |  10 -
 package/python-pickleshare/Config.in          |   1 -
 package/python-pymodbus/python-pymodbus.mk    |   9 -
 package/python-pypcap/Config.in               |   9 -
 package/python-pypcap/python-pypcap.hash      |   3 -
 package/python-pypcap/python-pypcap.mk        |  21 --
 package/python-pyqrcode/Config.in             |   6 +-
 package/python-pyqt5/python-pyqt5.mk          |  14 +-
 package/python-pyro/Config.in                 |  10 -
 package/python-pyro/python-pyro.hash          |   5 -
 package/python-pyro/python-pyro.mk            |  16 -
 package/python-pyroute2/Config.in             |   3 +-
 package/python-pyudev/Config.in               |   3 +-
 package/python-raven/Config.in                |   9 +-
 package/python-reentry/Config.in              |   1 -
 package/python-remi/Config.in                 |   3 +-
 package/python-scapy/Config.in                |   3 +-
 .../python-sentry-sdk/python-sentry-sdk.mk    |  10 -
 package/python-setuptools/Config.in           |   6 +-
 .../python-setuptools/python-setuptools.mk    |  16 -
 package/python-singledispatch/Config.in       |   9 -
 .../python-singledispatch.hash                |   5 -
 .../python-singledispatch.mk                  |  14 -
 package/python-sip/python-sip.mk              |  19 +-
 package/python-subprocess32/Config.in         |  13 -
 .../python-subprocess32.hash                  |   5 -
 .../python-subprocess32.mk                    |  31 --
 package/python-txtorcon/python-txtorcon.mk    |   9 -
 package/python-typing-extensions/Config.in    |   1 -
 package/python-typing/Config.in               |   8 -
 package/python-typing/python-typing.hash      |   5 -
 package/python-typing/python-typing.mk        |  15 -
 package/python-urllib3/Config.in              |   3 +-
 package/python-web2py/Config.in               |   9 +-
 package/python-webob/Config.in                |   4 +-
 package/python-websocket-client/Config.in     |   3 +-
 package/python-werkzeug/Config.in             |   3 +-
 package/python-whoosh/Config.in               |   3 +-
 package/python-xlrd/Config.in                 |   6 +-
 package/python-xmltodict/Config.in            |   3 +-
 package/python-yieldfrom/Config.in            |   8 -
 .../python-yieldfrom/python-yieldfrom.hash    |   5 -
 package/python-yieldfrom/python-yieldfrom.mk  |  15 -
 ...-do-not-add-invalid-header-locations.patch |  42 ---
 ...get_python_inc-for-cross-compilation.patch |  48 ---
 ...nstall-location-of-_sysconfigdata.py.patch |  88 -----
 ...ilation-of-.pyc-and-.pyo-conditional.patch |  78 -----
 ...taddrinfo-test-for-cross-compilation.patch |  31 --
 ...astructure-to-be-able-to-disable-ext.patch |  81 -----
 ...y-header-paths-for-cross-compilation.patch |  64 ----
 ...ook-in-usr-lib-termcap-for-libraries.patch |  31 --
 ...9-Fix-python-config-for-cross-builds.patch | 229 -------------
 ...ove-the-python-symlink-install-rules.patch |  43 ---
 .../0011-Don-t-add-multiarch-paths.patch      |  36 ---
 .../0012-Abort-on-failed-module-build.patch   |  30 --
 ...d-when-threads-are-not-used-availabl.patch |  58 ----
 .../python/0014-Serial-ioctl-workaround.patch |  33 --
 ...e-shebang-of-Python-scripts-for-cros.patch |  35 --
 ...-disable-installation-of-test-module.patch | 105 ------
 .../0017-Add-an-option-to-disable-pydoc.patch |  89 ------
 ...018-Add-an-option-to-disable-lib2to3.patch |  92 ------
 ...option-to-disable-the-sqlite3-module.patch |  69 ----
 ...d-an-option-to-disable-the-tk-module.patch |  73 -----
 ...-option-to-disable-the-curses-module.patch |  61 ----
 .../0022-Add-an-option-to-disable-expat.patch |  92 ------
 ...-Add-an-option-to-disable-CJK-codecs.patch |  32 --
 .../0024-Add-an-option-to-disable-NIS.patch   |  35 --
 ...Add-an-option-to-disable-unicodedata.patch |  32 --
 .../0026-Add-an-option-to-disable-bsddb.patch |  87 -----
 ...-an-option-to-disable-the-ssl-module.patch |  32 --
 ...-an-option-to-disable-the-bz2-module.patch |  32 --
 ...an-option-to-disable-the-zlib-module.patch |  32 --
 .../0030-Do-not-install-the-idle-editor.patch |  55 ----
 ...on-to-disable-the-ossaudiodev-module.patch |  32 --
 ...option-to-disable-the-hashlib-module.patch |  32 --
 ...an-option-to-disable-readline-module.patch |  32 --
 ...locale-and-set-to-default-when-addin.patch |  37 ---
 package/python/Config.in                      | 139 --------
 package/python/Config.in.host                 |  16 -
 package/python/python.hash                    |   5 -
 package/python/python.mk                      | 302 ------------------
 package/python3/Config.in                     |   1 -
 package/python3/python3.mk                    |   2 -
 package/ranger/Config.in                      |   5 +-
 package/selinux-python/Config.in              |   5 -
 package/snmpclitools/Config.in                |   2 +-
 package/supervisor/Config.in                  |   3 +-
 package/suricata/suricata.mk                  |   4 +-
 package/syslog-ng/syslog-ng.mk                |   7 +-
 package/tovid/Config.in                       |   6 +-
 package/trace-cmd/trace-cmd.mk                |   5 +-
 package/util-linux/util-linux.mk              |   4 +-
 package/zfs/zfs.mk                            |  12 +-
 .../package/sample_python_subprocess32.py     |   6 -
 .../testing/tests/package/test_bmap_tools.py  |   8 -
 support/testing/tests/package/test_crudini.py |   8 -
 .../testing/tests/package/test_libftdi1.py    |  12 -
 support/testing/tests/package/test_python.py  |  14 -
 .../testing/tests/package/test_python_argh.py |   9 -
 .../tests/package/test_python_bitstring.py    |  10 -
 .../testing/tests/package/test_python_can.py  |  11 -
 .../testing/tests/package/test_python_cbor.py |  11 -
 .../tests/package/test_python_click.py        |   9 -
 .../tests/package/test_python_constantly.py   |  10 -
 .../tests/package/test_python_gnupg.py        |  10 -
 .../tests/package/test_python_incremental.py  |  11 -
 .../tests/package/test_python_passlib.py      |  11 -
 .../tests/package/test_python_pexpect.py      |  10 -
 .../tests/package/test_python_pynacl.py       |  11 -
 .../tests/package/test_python_pyyaml.py       |  11 -
 .../tests/package/test_python_subprocess32.py |  11 -
 .../tests/package/test_python_ubjson.py       |  11 -
 223 files changed, 270 insertions(+), 3981 deletions(-)
 delete mode 100644 package/python-backports-abc/Config.in
 delete mode 100644 package/python-backports-abc/python-backports-abc.hash
 delete mode 100644 package/python-backports-abc/python-backports-abc.mk
 delete mode 100644 package/python-backports-shutil-get-terminal-size/Config.in
 delete mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.hash
 delete mode 100644 package/python-backports-shutil-get-terminal-size/python-backports-shutil-get-terminal-size.mk
 delete mode 100644 package/python-backports-ssl-match-hostname/Config.in
 delete mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.hash
 delete mode 100644 package/python-backports-ssl-match-hostname/python-backports-ssl-match-hostname.mk
 delete mode 100644 package/python-configobj/Config.in
 delete mode 100644 package/python-configobj/python-configobj.hash
 delete mode 100644 package/python-configobj/python-configobj.mk
 delete mode 100644 package/python-dialog/Config.in
 delete mode 100644 package/python-dialog/python-dialog.hash
 delete mode 100644 package/python-dialog/python-dialog.mk
 delete mode 100644 package/python-enum/Config.in
 delete mode 100644 package/python-enum/python-enum.hash
 delete mode 100644 package/python-enum/python-enum.mk
 delete mode 100644 package/python-enum34/Config.in
 delete mode 100644 package/python-enum34/python-enum34.hash
 delete mode 100644 package/python-enum34/python-enum34.mk
 delete mode 100644 package/python-functools32/Config.in
 delete mode 100644 package/python-functools32/python-functools32.hash
 delete mode 100644 package/python-functools32/python-functools32.mk
 delete mode 100644 package/python-futures/Config.in
 delete mode 100644 package/python-futures/python-futures.hash
 delete mode 100644 package/python-futures/python-futures.mk
 delete mode 100644 package/python-id3/Config.in
 delete mode 100644 package/python-id3/python-id3.hash
 delete mode 100644 package/python-id3/python-id3.mk
 delete mode 100644 package/python-ipaddr/Config.in
 delete mode 100644 package/python-ipaddr/python-ipaddr.hash
 delete mode 100644 package/python-ipaddr/python-ipaddr.mk
 delete mode 100644 package/python-ipaddress/Config.in
 delete mode 100644 package/python-ipaddress/python-ipaddress.hash
 delete mode 100644 package/python-ipaddress/python-ipaddress.mk
 delete mode 100644 package/python-mad/Config.in
 delete mode 100644 package/python-mad/python-mad.hash
 delete mode 100644 package/python-mad/python-mad.mk
 delete mode 100644 package/python-nfc/Config.in
 delete mode 100644 package/python-nfc/python-nfc.hash
 delete mode 100644 package/python-nfc/python-nfc.mk
 delete mode 100644 package/python-pam/0001-dealloc.patch
 delete mode 100644 package/python-pam/0002-nofree.patch
 delete mode 100644 package/python-pam/0003-memory-errors-CVE2012-1502.patch
 delete mode 100644 package/python-pam/Config.in
 delete mode 100644 package/python-pam/python-pam.hash
 delete mode 100644 package/python-pam/python-pam.mk
 delete mode 100644 package/python-pathlib2/Config.in
 delete mode 100644 package/python-pathlib2/python-pathlib2.hash
 delete mode 100644 package/python-pathlib2/python-pathlib2.mk
 delete mode 100644 package/python-pypcap/Config.in
 delete mode 100644 package/python-pypcap/python-pypcap.hash
 delete mode 100644 package/python-pypcap/python-pypcap.mk
 delete mode 100644 package/python-pyro/Config.in
 delete mode 100644 package/python-pyro/python-pyro.hash
 delete mode 100644 package/python-pyro/python-pyro.mk
 delete mode 100644 package/python-singledispatch/Config.in
 delete mode 100644 package/python-singledispatch/python-singledispatch.hash
 delete mode 100644 package/python-singledispatch/python-singledispatch.mk
 delete mode 100644 package/python-subprocess32/Config.in
 delete mode 100644 package/python-subprocess32/python-subprocess32.hash
 delete mode 100644 package/python-subprocess32/python-subprocess32.mk
 delete mode 100644 package/python-typing/Config.in
 delete mode 100644 package/python-typing/python-typing.hash
 delete mode 100644 package/python-typing/python-typing.mk
 delete mode 100644 package/python-yieldfrom/Config.in
 delete mode 100644 package/python-yieldfrom/python-yieldfrom.hash
 delete mode 100644 package/python-yieldfrom/python-yieldfrom.mk
 delete mode 100644 package/python/0001-setup.py-do-not-add-invalid-header-locations.patch
 delete mode 100644 package/python/0002-Fix-get_python_inc-for-cross-compilation.patch
 delete mode 100644 package/python/0003-Change-the-install-location-of-_sysconfigdata.py.patch
 delete mode 100644 package/python/0004-Make-the-compilation-of-.pyc-and-.pyo-conditional.patch
 delete mode 100644 package/python/0005-Adjust-getaddrinfo-test-for-cross-compilation.patch
 delete mode 100644 package/python/0006-Add-minimal-infrastructure-to-be-able-to-disable-ext.patch
 delete mode 100644 package/python/0007-Adjust-library-header-paths-for-cross-compilation.patch
 delete mode 100644 package/python/0008-Don-t-look-in-usr-lib-termcap-for-libraries.patch
 delete mode 100644 package/python/0009-Fix-python-config-for-cross-builds.patch
 delete mode 100644 package/python/0010-Remove-the-python-symlink-install-rules.patch
 delete mode 100644 package/python/0011-Don-t-add-multiarch-paths.patch
 delete mode 100644 package/python/0012-Abort-on-failed-module-build.patch
 delete mode 100644 package/python/0013-sqlite3-fix-build-when-threads-are-not-used-availabl.patch
 delete mode 100644 package/python/0014-Serial-ioctl-workaround.patch
 delete mode 100644 package/python/0015-Do-not-adjust-the-shebang-of-Python-scripts-for-cros.patch
 delete mode 100644 package/python/0016-Add-an-option-to-disable-installation-of-test-module.patch
 delete mode 100644 package/python/0017-Add-an-option-to-disable-pydoc.patch
 delete mode 100644 package/python/0018-Add-an-option-to-disable-lib2to3.patch
 delete mode 100644 package/python/0019-Add-option-to-disable-the-sqlite3-module.patch
 delete mode 100644 package/python/0020-Add-an-option-to-disable-the-tk-module.patch
 delete mode 100644 package/python/0021-Add-an-option-to-disable-the-curses-module.patch
 delete mode 100644 package/python/0022-Add-an-option-to-disable-expat.patch
 delete mode 100644 package/python/0023-Add-an-option-to-disable-CJK-codecs.patch
 delete mode 100644 package/python/0024-Add-an-option-to-disable-NIS.patch
 delete mode 100644 package/python/0025-Add-an-option-to-disable-unicodedata.patch
 delete mode 100644 package/python/0026-Add-an-option-to-disable-bsddb.patch
 delete mode 100644 package/python/0027-Add-an-option-to-disable-the-ssl-module.patch
 delete mode 100644 package/python/0028-Add-an-option-to-disable-the-bz2-module.patch
 delete mode 100644 package/python/0029-Add-an-option-to-disable-the-zlib-module.patch
 delete mode 100644 package/python/0030-Do-not-install-the-idle-editor.patch
 delete mode 100644 package/python/0031-Add-an-option-to-disable-the-ossaudiodev-module.patch
 delete mode 100644 package/python/0032-Add-option-to-disable-the-hashlib-module.patch
 delete mode 100644 package/python/0033-Add-an-option-to-disable-readline-module.patch
 delete mode 100644 package/python/0034-Override-system-locale-and-set-to-default-when-addin.patch
 delete mode 100644 package/python/Config.in
 delete mode 100644 package/python/Config.in.host
 delete mode 100644 package/python/python.hash
 delete mode 100644 package/python/python.mk
 delete mode 100644 support/testing/tests/package/sample_python_subprocess32.py
 delete mode 100644 support/testing/tests/package/test_python_subprocess32.py

-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
