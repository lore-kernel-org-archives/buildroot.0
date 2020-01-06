From: Johan Oudinet <johan.oudinet@gmail.com>
Date: Mon,  6 Jan 2020 17:10:53 +0100
Subject: [Buildroot] [PATCH 00/22] Bump ejabberd to version 19.09.1
Message-ID: <20200106161115.16524-1-johan.oudinet@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Ejabberd has many dependencies. Bump all of them to the versions
required by ejabberd-19.09.1.

Johan Oudinet (22):
  erlang-p1-utils: Bump to version 1.0.16
  erlang-lager: Bump to version 3.6.10
  erlang-eimp: Bump to version 1.0.12
  erlang-p1-cache-tab: Bump to version 1.0.20
  erlang-p1-oauth2: Bump to version 0.6.5
  erlang-p1-sip: Bump to version 1.0.30
  erlang-p1-stringprep: Bump to version 1.0.17
  erlang-p1-tls: Bump to version 1.1.2
  ejabberd-p1-stun: Bump to version 1.0.29
  erlang-p1-xml: Bump to version 1.1.37
  erlang-p1-zlib: Bump to version 1.0.6
  erlang-p1-xmpp: Bump to version 1.4.2
  erlang-p1-yaml: Bump to version 1.0.21
  erlang-base64url: New package
  erlang-jose: New package
  erlang-idna: New package
  erlang-p1-mqtree: New package
  erlang-p1-pkix: New package
  erlang-p1-yconf: New package
  erlang-p1-acme: New package
  ejabberd: Bump to version 19.09.1
  erlang-p1-iconv: Remove package

 package/Config.in                             |  8 +++++++-
 package/ejabberd/0002-fix-ejabberdctl.patch   | 18 +++++++-----------
 package/ejabberd/Config.in                    |  7 ++++++-
 package/ejabberd/S50ejabberd                  |  2 +-
 package/ejabberd/ejabberd.hash                |  2 +-
 package/ejabberd/ejabberd.mk                  |  7 +++----
 package/erlang-base64url/Config.in            |  6 ++++++
 .../erlang-base64url/erlang-base64url.hash    |  2 ++
 package/erlang-base64url/erlang-base64url.mk  | 13 +++++++++++++
 package/erlang-eimp/erlang-eimp.hash          |  2 ++
 package/erlang-eimp/erlang-eimp.mk            |  2 +-
 package/erlang-idna/Config.in                 |  6 ++++++
 package/erlang-idna/erlang-idna.hash          |  2 ++
 package/erlang-idna/erlang-idna.mk            | 13 +++++++++++++
 package/erlang-jose/Config.in                 |  7 +++++++
 package/erlang-jose/erlang-jose.hash          |  2 ++
 package/erlang-jose/erlang-jose.mk            | 13 +++++++++++++
 package/erlang-lager/erlang-lager.hash        |  2 +-
 package/erlang-lager/erlang-lager.mk          |  2 +-
 package/erlang-p1-acme/Config.in              | 10 ++++++++++
 package/erlang-p1-acme/erlang-p1-acme.hash    |  2 ++
 package/erlang-p1-acme/erlang-p1-acme.mk      | 14 ++++++++++++++
 .../erlang-p1-cache-tab.hash                  |  2 +-
 .../erlang-p1-cache-tab.mk                    |  2 +-
 package/erlang-p1-iconv/Config.in             |  8 --------
 package/erlang-p1-iconv/erlang-p1-iconv.hash  |  2 --
 package/erlang-p1-iconv/erlang-p1-iconv.mk    | 19 -------------------
 package/erlang-p1-mqtree/Config.in            |  7 +++++++
 .../erlang-p1-mqtree/erlang-p1-mqtree.hash    |  2 ++
 package/erlang-p1-mqtree/erlang-p1-mqtree.mk  | 13 +++++++++++++
 .../erlang-p1-oauth2/erlang-p1-oauth2.hash    |  2 +-
 package/erlang-p1-oauth2/erlang-p1-oauth2.mk  |  2 +-
 package/erlang-p1-pkix/Config.in              |  6 ++++++
 package/erlang-p1-pkix/erlang-p1-pkix.hash    |  2 ++
 package/erlang-p1-pkix/erlang-p1-pkix.mk      | 13 +++++++++++++
 package/erlang-p1-sip/erlang-p1-sip.hash      |  2 +-
 package/erlang-p1-sip/erlang-p1-sip.mk        |  2 +-
 .../erlang-p1-stringprep.hash                 |  2 +-
 .../erlang-p1-stringprep.mk                   |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.hash    |  2 +-
 package/erlang-p1-stun/erlang-p1-stun.mk      |  2 +-
 package/erlang-p1-tls/erlang-p1-tls.hash      |  2 +-
 package/erlang-p1-tls/erlang-p1-tls.mk        |  2 +-
 package/erlang-p1-utils/erlang-p1-utils.hash  |  2 +-
 package/erlang-p1-utils/erlang-p1-utils.mk    |  2 +-
 package/erlang-p1-xml/erlang-p1-xml.hash      |  2 +-
 package/erlang-p1-xml/erlang-p1-xml.mk        |  2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.hash    |  2 +-
 package/erlang-p1-xmpp/erlang-p1-xmpp.mk      |  2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.hash    |  2 +-
 package/erlang-p1-yaml/erlang-p1-yaml.mk      |  2 +-
 package/erlang-p1-yconf/Config.in             |  5 +++++
 package/erlang-p1-yconf/erlang-p1-yconf.hash  |  2 ++
 package/erlang-p1-yconf/erlang-p1-yconf.mk    | 13 +++++++++++++
 package/erlang-p1-zlib/erlang-p1-zlib.hash    |  2 +-
 package/erlang-p1-zlib/erlang-p1-zlib.mk      |  2 +-
 56 files changed, 205 insertions(+), 73 deletions(-)
 create mode 100644 package/erlang-base64url/Config.in
 create mode 100644 package/erlang-base64url/erlang-base64url.hash
 create mode 100644 package/erlang-base64url/erlang-base64url.mk
 create mode 100644 package/erlang-eimp/erlang-eimp.hash
 create mode 100644 package/erlang-idna/Config.in
 create mode 100644 package/erlang-idna/erlang-idna.hash
 create mode 100644 package/erlang-idna/erlang-idna.mk
 create mode 100644 package/erlang-jose/Config.in
 create mode 100644 package/erlang-jose/erlang-jose.hash
 create mode 100644 package/erlang-jose/erlang-jose.mk
 create mode 100644 package/erlang-p1-acme/Config.in
 create mode 100644 package/erlang-p1-acme/erlang-p1-acme.hash
 create mode 100644 package/erlang-p1-acme/erlang-p1-acme.mk
 delete mode 100644 package/erlang-p1-iconv/Config.in
 delete mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.hash
 delete mode 100644 package/erlang-p1-iconv/erlang-p1-iconv.mk
 create mode 100644 package/erlang-p1-mqtree/Config.in
 create mode 100644 package/erlang-p1-mqtree/erlang-p1-mqtree.hash
 create mode 100644 package/erlang-p1-mqtree/erlang-p1-mqtree.mk
 create mode 100644 package/erlang-p1-pkix/Config.in
 create mode 100644 package/erlang-p1-pkix/erlang-p1-pkix.hash
 create mode 100644 package/erlang-p1-pkix/erlang-p1-pkix.mk
 create mode 100644 package/erlang-p1-yconf/Config.in
 create mode 100644 package/erlang-p1-yconf/erlang-p1-yconf.hash
 create mode 100644 package/erlang-p1-yconf/erlang-p1-yconf.mk

-- 
2.20.1
