From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri,  5 Mar 2021 23:27:41 +0100
Subject: [Buildroot] [PATCH 0/3] package: don't set CPE_ID_VALID (branch
 yem/cpe-no-ID_VALID)
Message-ID: <cover.1614983175.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello All!

Currently, packages have two ways to trigger a full SPE_ID defition:

  - either set one or more of the actual CPE_ID variables: _PREFIX,
    _VENDOR, _PRODUCT, _VERSION, or _UPDATE,

  - or set _CPE_ID_VALID=YES to use the defaults for all those
    variables.

But really, CPE_ID_VALID should be treated as an internal implementation
detail, and packages should really set one of the actual CPE variables
to trigger their full CPE defition.

Regards,
Yann E. MORIN.


----------------------------------------------------------------
Yann E. MORIN (3):
      docs/manual: do not expose CPE_ID_VALID as package-settable
      package/sudo: cleanup the CPE_ID variables
      package: drop _CPE_ID_VALID, use _CPE_ID_VENDOR

 docs/manual/adding-packages-generic.txt                          | 6 ------
 package/asn1c/asn1c.mk                                           | 2 +-
 package/atftp/atftp.mk                                           | 2 +-
 package/atop/atop.mk                                             | 2 +-
 package/attr/attr.mk                                             | 2 +-
 package/axel/axel.mk                                             | 2 +-
 package/bdwgc/bdwgc.mk                                           | 2 +-
 package/beecrypt/beecrypt.mk                                     | 2 +-
 package/botan/botan.mk                                           | 2 +-
 package/c-icap/c-icap.mk                                         | 2 +-
 package/civetweb/civetweb.mk                                     | 2 +-
 package/cjson/cjson.mk                                           | 2 +-
 package/cryptsetup/cryptsetup.mk                                 | 2 +-
 package/dosfstools/dosfstools.mk                                 | 2 +-
 package/e2fsprogs/e2fsprogs.mk                                   | 2 +-
 package/elfutils/elfutils.mk                                     | 2 +-
 package/file/file.mk                                             | 2 +-
 package/flac/flac.mk                                             | 2 +-
 package/flex/flex.mk                                             | 2 +-
 package/fontconfig/fontconfig.mk                                 | 2 +-
 package/giflib/giflib.mk                                         | 2 +-
 package/gnuplot/gnuplot.mk                                       | 2 +-
 package/harfbuzz/harfbuzz.mk                                     | 2 +-
 package/heimdal/heimdal.mk                                       | 2 +-
 package/ipmitool/ipmitool.mk                                     | 2 +-
 package/iucode-tool/iucode-tool.mk                               | 2 +-
 package/jansson/jansson.mk                                       | 2 +-
 package/jasper/jasper.mk                                         | 2 +-
 package/jhead/jhead.mk                                           | 2 +-
 package/jq/jq.mk                                                 | 2 +-
 package/json-c/json-c.mk                                         | 2 +-
 package/jsoncpp/jsoncpp.mk                                       | 2 +-
 package/lame/lame.mk                                             | 2 +-
 package/lftp/lftp.mk                                             | 2 +-
 package/libass/libass.mk                                         | 2 +-
 package/libcap-ng/libcap-ng.mk                                   | 2 +-
 package/libconfuse/libconfuse.mk                                 | 2 +-
 package/libesmtp/libesmtp.mk                                     | 2 +-
 package/libevent/libevent.mk                                     | 2 +-
 package/libexif/libexif.mk                                       | 2 +-
 package/libgit2/libgit2.mk                                       | 2 +-
 package/libksba/libksba.mk                                       | 2 +-
 package/librsync/librsync.mk                                     | 2 +-
 package/libseccomp/libseccomp.mk                                 | 2 +-
 package/libsndfile/libsndfile.mk                                 | 2 +-
 package/libtirpc/libtirpc.mk                                     | 2 +-
 package/libupnp/libupnp.mk                                       | 2 +-
 package/libvncserver/libvncserver.mk                             | 2 +-
 package/logrotate/logrotate.mk                                   | 2 +-
 package/lzo/lzo.mk                                               | 2 +-
 package/matio/matio.mk                                           | 2 +-
 package/minicom/minicom.mk                                       | 2 +-
 package/ncmpc/ncmpc.mk                                           | 2 +-
 package/netatalk/netatalk.mk                                     | 2 +-
 package/netcat/netcat.mk                                         | 2 +-
 package/nettle/nettle.mk                                         | 2 +-
 package/oniguruma/oniguruma.mk                                   | 2 +-
 package/openrc/openrc.mk                                         | 2 +-
 package/p11-kit/p11-kit.mk                                       | 2 +-
 package/polkit/polkit.mk                                         | 2 +-
 package/powerpc-utils/powerpc-utils.mk                           | 2 +-
 package/procps-ng/procps-ng.mk                                   | 2 +-
 package/rabbitmq-c/rabbitmq-c.mk                                 | 2 +-
 package/rhash/rhash.mk                                           | 2 +-
 package/rpcbind/rpcbind.mk                                       | 2 +-
 package/rtmpdump/rtmpdump.mk                                     | 2 +-
 package/sane-backends/sane-backends.mk                           | 2 +-
 package/spice/spice.mk                                           | 2 +-
 package/squashfs/squashfs.mk                                     | 2 +-
 package/strace/strace.mk                                         | 2 +-
 package/sudo/sudo.mk                                             | 9 +++++----
 package/sysklogd/sysklogd.mk                                     | 2 +-
 package/tmux/tmux.mk                                             | 2 +-
 package/unzip/unzip.mk                                           | 2 +-
 package/upx/upx.mk                                               | 2 +-
 package/valijson/valijson.mk                                     | 2 +-
 package/vsftpd/vsftpd.mk                                         | 2 +-
 package/x11vnc/x11vnc.mk                                         | 2 +-
 package/xscreensaver/xscreensaver.mk                             | 2 +-
 package/yaml-cpp/yaml-cpp.mk                                     | 2 +-
 package/zziplib/zziplib.mk                                       | 2 +-
 .../core/cpeid-br2-external/package/cpe-id-pkg3/cpe-id-pkg3.mk   | 2 +-
 82 files changed, 85 insertions(+), 90 deletions(-)

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
