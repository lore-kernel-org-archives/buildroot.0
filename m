From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Tue, 16 Jan 2018 15:06:35 +0100
Subject: [Buildroot] [PATCH 00/14] Bump ejabberd version to 17.04
Message-ID: <20180116140649.7381-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ejabberd has many dependencies. Bump all of them to the versions needed
by ejabberd-17.11.

Johan Oudinet (14):
  erlang-lager: Bump to version 3.4.2
  erlang-p1-utils: Bump to version 1.0.10
  erlang-p1-zlib: Bump to version 1.0.3
  erlang-p1-xml: Bump to version 1.1.25
  erlang-stringprep: Bump to version 1.0.10
  erlang-p1-xmpp: Bump to version 1.1.16
  erlang-p1-cache-tab: Bump to version 1.0.12
  erlang-p1-iconv: Bump to version 1.0.6
  erlang-p1-oauth2: Bump to version 0.6.2
  erlang-p1-tls: Bump to version 1.0.17
  erlang-p1-stun: Bump to version 1.0.16
  erlang-p1-sip: Bump to version 1.0.17
  erlang-p1-yaml: Bump to version 1.0.12
  ejabberd: Bump to version 17.11

 .../0001-remove-make-targets-for-deps.patch        |    5 +-
 ...002-remove-dependencies-from-rebar-config.patch |   82 +-
 package/ejabberd/0004-correct-include.patch        |   58 -
 package/ejabberd/0004-correct-includes.patch       | 1909 ++++++++++++++++++++
 package/ejabberd/0007-fix-ejabberdctl.patch        |   34 +-
 .../0008-handle-error-case-from-lib_dir.patch      |   28 +
 .../0008-rebar-uses-host-dependencies.patch        |   33 -
 package/ejabberd/0009-disable-mod_avatar.patch     |   32 +
 package/ejabberd/Config.in                         |   10 +
 package/ejabberd/ejabberd.hash                     |    2 +-
 package/ejabberd/ejabberd.mk                       |   38 +-
 package/erlang-lager/erlang-lager.hash             |    2 +-
 package/erlang-lager/erlang-lager.mk               |    4 +-
 .../erlang-p1-cache-tab/erlang-p1-cache-tab.hash   |    2 +-
 package/erlang-p1-cache-tab/erlang-p1-cache-tab.mk |    2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.hash       |    2 +-
 package/erlang-p1-iconv/erlang-p1-iconv.mk         |    2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.hash     |    2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk       |    2 +-
 ...002-remove-dependencies-from-rebar-config.patch |   10 +-
 package/erlang-p1-sip/erlang-p1-sip.hash           |    2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk             |    2 +-
 .../erlang-p1-stringprep/erlang-p1-stringprep.hash |    2 +-
 .../erlang-p1-stringprep/erlang-p1-stringprep.mk   |    2 +-
 ...001-remove-dependencies-from-rebar-config.patch |    6 +-
 package/erlang-p1-stun/erlang-p1-stun.hash         |    2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk           |    2 +-
 package/erlang-p1-tls/erlang-p1-tls.hash           |    2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk             |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.hash       |    2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk         |    2 +-
 ...001-remove-dependencies-from-rebar-config.patch |    6 +-
 package/erlang-p1-xml/erlang-p1-xml.hash           |    2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk             |    2 +-
 ...002-remove-dependencies-from-rebar-config.patch |   19 +-
 package/erlang-p1-xmpp/Config.in                   |    1 +
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash         |    2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk           |    4 +-
 ...001-remove-dependencies-from-rebar-config.patch |    4 +-
 package/erlang-p1-yaml/erlang-p1-yaml.hash         |    2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk           |    2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.hash         |    2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk           |    2 +-
 43 files changed, 2134 insertions(+), 199 deletions(-)
 delete mode 100644 package/ejabberd/0004-correct-include.patch
 create mode 100644 package/ejabberd/0004-correct-includes.patch
 create mode 100644 package/ejabberd/0008-handle-error-case-from-lib_dir.patch
 delete mode 100644 package/ejabberd/0008-rebar-uses-host-dependencies.patch
 create mode 100644 package/ejabberd/0009-disable-mod_avatar.patch

-- 
2.14.1
