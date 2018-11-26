From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon, 26 Nov 2018 12:07:52 +0100
Subject: [Buildroot] [PATCH 00/15] Bump ejabberd to version 18.09
Message-ID: <20181126110807.31431-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ejabberd has many dependencies. Bump all of them to the versions
needed by ejabberd-18.09.

Johan Oudinet (15):
  package/pkg-rebar.mk: Remove dependencies from rebar.config
  erlang-p1-utils: Bump to version 1.0.13
  erlang-p1-cache-tab: Bump to version 1.0.16
  erlang-p1-tls: Bump to version 1.0.25
  erlang-p1-stringprep: Bump to version 1.0.14
  erlang-p1-xml: Bump to version 1.1.34
  erlang-p1-zlib: Bump to version 1.0.4
  erlang-p1-xmpp: Bump to version 1.2.5
  erlang-p1-yaml: Bump to version 1.0.17
  erlang-p1-oauth2: Bump to version 0.6.3
  erlang-p1-stun: Bump to version 1.0.25
  erlang-p1-sip: Bump to version 1.0.26
  erlang-p1-iconv: Bump to version 1.0.10
  erlang-p1-eimp: New package
  ejabberd: Bump to version 18.09

 package/Config.in                             |    1 +
 ...not-download-or-compile-dependencies.patch |   35 +
 .../0001-remove-make-targets-for-deps.patch   |   43 -
 ...rdctl.patch => 0002-fix-ejabberdctl.patch} |    0
 ...emove-dependencies-from-rebar-config.patch |  106 -
 .../0003-remove-checking-erlang-version.patch |   32 -
 package/ejabberd/0004-correct-includes.patch  | 1919 -----------------
 ...0005-disable-ERLANG_DEPRECATED_CHECK.patch |   29 -
 .../0006-fix-install-permissions.patch        |   84 -
 .../0008-handle-error-case-from-lib_dir.patch |   32 -
 .../ejabberd/0009-disable-mod_avatar.patch    |   32 -
 package/ejabberd/Config.in                    |    1 +
 package/ejabberd/ejabberd.hash                |    2 +-
 package/ejabberd/ejabberd.mk                  |   12 +-
 package/erlang-eimp/Config.in                 |   12 +
 package/erlang-eimp/erlang-eimp.mk            |   13 +
 .../erlang-p1-cache-tab.hash                  |    2 +-
 .../erlang-p1-cache-tab.mk                    |    2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.hash  |    2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk    |    2 +-
 .../erlang-p1-oauth2/erlang-p1-oauth2.hash    |    2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk  |    2 +-
 ...emove-dependencies-from-rebar-config.patch |   20 -
 package/erlang-p1-sip/erlang-p1-sip.hash      |    2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk        |    2 +-
 .../erlang-p1-stringprep.hash                 |    2 +-
 .../erlang-p1-stringprep.mk                   |    2 +-
 ...ove-dependencies-from-rebar-config.patch#} |    4 +-
 package/erlang-p1-stun/erlang-p1-stun.hash    |    2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk      |    2 +-
 package/erlang-p1-tls/erlang-p1-tls.hash      |    2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk        |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.hash  |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk    |    2 +-
 ...emove-dependencies-from-rebar-config.patch |   18 -
 package/erlang-p1-xml/erlang-p1-xml.hash      |    2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk        |    2 +-
 ...emove-dependencies-from-rebar-config.patch |   19 -
 package/erlang-p1-xmpp/Config.in              |    2 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash    |    2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk      |    4 +-
 ...emove-dependencies-from-rebar-config.patch |   18 -
 package/erlang-p1-yaml/erlang-p1-yaml.hash    |    2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk      |    2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.hash    |    2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk      |    2 +-
 package/pkg-rebar.mk                          |    9 +
 47 files changed, 109 insertions(+), 2384 deletions(-)
 create mode 100644 package/ejabberd/0001-Makefile.in-do-not-download-or-compile-dependencies.patch
 delete mode 100644 package/ejabberd/0001-remove-make-targets-for-deps.patch
 rename package/ejabberd/{0007-fix-ejabberdctl.patch => 0002-fix-ejabberdctl.patch} (100%)
 delete mode 100644 package/ejabberd/0002-remove-dependencies-from-rebar-config.patch
 delete mode 100644 package/ejabberd/0003-remove-checking-erlang-version.patch
 delete mode 100644 package/ejabberd/0004-correct-includes.patch
 delete mode 100644 package/ejabberd/0005-disable-ERLANG_DEPRECATED_CHECK.patch
 delete mode 100644 package/ejabberd/0006-fix-install-permissions.patch
 delete mode 100644 package/ejabberd/0008-handle-error-case-from-lib_dir.patch
 delete mode 100644 package/ejabberd/0009-disable-mod_avatar.patch
 create mode 100644 package/erlang-eimp/Config.in
 create mode 100644 package/erlang-eimp/erlang-eimp.mk
 delete mode 100644 package/erlang-p1-sip/0002-remove-dependencies-from-rebar-config.patch
 rename package/erlang-p1-stun/{0001-remove-dependencies-from-rebar-config.patch => #0001-remove-dependencies-from-rebar-config.patch#} (78%)
 delete mode 100644 package/erlang-p1-xml/0001-remove-dependencies-from-rebar-config.patch
 delete mode 100644 package/erlang-p1-xmpp/0002-remove-dependencies-from-rebar-config.patch
 delete mode 100644 package/erlang-p1-yaml/0001-remove-dependencies-from-rebar-config.patch

-- 
2.17.1
