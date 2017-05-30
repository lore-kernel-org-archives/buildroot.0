From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 30 May 2017 16:51:55 +0200
Subject: [Buildroot] [PATCH 00/16] Bump ejabberd version to 17.04
Message-ID: <20170530145211.15320-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ejabberd has many dependencies, bump all of them to the versions used by
ejabberd-17.04. There are three new dependencies: erlang-jiffy,
erlang-p1-oauth, and erlang-p1-xmpp.
This version of ejabberd is compatible with Erlang 19.03, which is not
the case of ejabberd 16.01.

Christophe Romain (from process-one) helps me in this work. I'm not sure
how to properly credit him here.

Johan Oudinet (16):
  erlang-goldrush: bump version to 0.1.9
  erlang-lager: bump to version 3.2.1
  erlang-p1-utils: bump to version 1.0.8
  erlang-p1-zlib: bump to version 1.0.2
  erlang-p1-cache-tab: bump to version 1.0.7
  erlang-p1-iconv: bump to version 1.0.4
  erlang-p1-stringprep: bump to version 1.0.8
  erlang-p1-tls: bump to version 1.0.11
  erlang-p1-stun: bump to version 1.0.10
  erlang-p1-sip: bump to version 1.0.11
  erlang-p1-xml: bump to version 1.1.22
  erlang-p1-yaml: bump to version 1.0.9
  erlang-jiffy: New package
  erlang-p1-oauth: New package
  erlang-p1-xmpp: New package
  ejabberd: bump to version 17.04

 package/Config.in                                  |   3 +
 .../0001-remove-make-targets-for-deps.patch        |  42 +------
 ...002-remove-dependencies-from-rebar-config.patch | 129 +++++++++++----------
 .../ejabberd/0006-fix-install-permissions.patch    |  42 +++----
 package/ejabberd/0007-fix-ejabberdctl.patch        |  12 +-
 .../0008-rebar-uses-host-dependencies.patch        |  33 ++++++
 package/ejabberd/Config.in                         |   8 +-
 package/ejabberd/ejabberd.hash                     |   4 +-
 package/ejabberd/ejabberd.mk                       |   6 +-
 package/erlang-goldrush/erlang-goldrush.hash       |   2 +-
 package/erlang-goldrush/erlang-goldrush.mk         |   2 +-
 package/erlang-jiffy/Config.in                     |  10 ++
 package/erlang-jiffy/erlang-jiffy.hash             |   2 +
 package/erlang-jiffy/erlang-jiffy.mk               |  12 ++
 package/erlang-lager/erlang-lager.hash             |   2 +-
 package/erlang-lager/erlang-lager.mk               |   2 +-
 .../erlang-p1-cache-tab/erlang-p1-cache-tab.hash   |   2 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |   2 +-
 package/erlang-p1-iconv/Config.in                  |   1 +
 package/erlang-p1-iconv/erlang-p1-iconv.hash       |   2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk         |   9 +-
 package/erlang-p1-oauth/Config.in                  |   6 +
 package/erlang-p1-oauth/erlang-p1-oauth.hash       |   2 +
 package/erlang-p1-oauth/erlang-p1-oauth.mk         |  13 +++
 ...002-remove-dependencies-from-rebar-config.patch |  20 ++++
 package/erlang-p1-sip/erlang-p1-sip.hash           |   2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk             |   8 +-
 .../0001-Stdint-is-required-on-windows.patch       |  28 -----
 .../erlang-p1-stringprep/erlang-p1-stringprep.hash |   2 +-
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |   2 +-
 ...001-remove-dependencies-from-rebar-config.patch |  16 +++
 package/erlang-p1-stun/erlang-p1-stun.hash         |   2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk           |   6 +-
 package/erlang-p1-tls/Config.in                    |   1 +
 package/erlang-p1-tls/erlang-p1-tls.hash           |   2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk             |  10 +-
 package/erlang-p1-utils/erlang-p1-utils.hash       |   2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk         |   5 +-
 ...001-remove-dependencies-from-rebar-config.patch |  18 +++
 package/erlang-p1-xml/erlang-p1-xml.hash           |   2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk             |   5 +-
 package/erlang-p1-xmpp/0001-fix-includes.patch     |  16 +++
 ...002-remove-dependencies-from-rebar-config.patch |  18 +++
 package/erlang-p1-xmpp/Config.in                   |   8 ++
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash         |   2 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk           |  16 +++
 ...001-remove-dependencies-from-rebar-config.patch |  18 +++
 package/erlang-p1-yaml/erlang-p1-yaml.hash         |   2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk           |   6 +-
 package/erlang-p1-zlib/erlang-p1-zlib.hash         |   2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk           |   8 +-
 51 files changed, 371 insertions(+), 204 deletions(-)
 create mode 100644 package/ejabberd/0008-rebar-uses-host-dependencies.patch
 create mode 100644 package/erlang-jiffy/Config.in
 create mode 100644 package/erlang-jiffy/erlang-jiffy.hash
 create mode 100644 package/erlang-jiffy/erlang-jiffy.mk
 create mode 100644 package/erlang-p1-oauth/Config.in
 create mode 100644 package/erlang-p1-oauth/erlang-p1-oauth.hash
 create mode 100644 package/erlang-p1-oauth/erlang-p1-oauth.mk
 create mode 100644 package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
 delete mode 100644 package/erlang-p1-stringprep/0001-Stdint-is-required-on-windows.patch
 create mode 100644 package/erlang-p1-stun/0001-remove-dependencies-from-rebar-config.patch
 create mode 100644 package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
 create mode 100644 package/erlang-p1-xmpp/0001-fix-includes.patch
 create mode 100644 package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
 create mode 100644 package/erlang-p1-xmpp/Config.in
 create mode 100644 package/erlang-p1-xmpp/erlang-p1-xmpp.hash
 create mode 100644 package/erlang-p1-xmpp/erlang-p1-xmpp.mk
 create mode 100644 package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch

--
2.11.0
