From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:13 +0100
Subject: [Buildroot] [PATCH 21/80 v1] package/python{,
	3}: move inclusion of external python modules
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <d327278baa3d87bec8aaebe25167bb540b9b5564.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a Config.ext for external python modules, that both python and
python include from there respective sub-menus.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in          | 98 ----------------------------------------------
 package/python/Config.ext  | 98 ++++++++++++++++++++++++++++++++++++++++++++++
 package/python/Config.in   |  2 +
 package/python3/Config.ext |  1 +
 package/python3/Config.in  |  2 +
 5 files changed, 103 insertions(+), 98 deletions(-)
 create mode 100644 package/python/Config.ext
 create mode 120000 package/python3/Config.ext

diff --git a/package/Config.in b/package/Config.in
index 91c96ea..531b1a0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -546,104 +546,6 @@ endif
 	source "package/php/Config.in"
 	source "package/python/Config.in"
 	source "package/python3/Config.in"
-if BR2_PACKAGE_PYTHON || BR2_PACKAGE_PYTHON3
-menu "External python modules"
-	source "package/python-alsaaudio/Config.in"
-	source "package/python-backports-abc/Config.in"
-	source "package/python-bottle/Config.in"
-	source "package/python-can/Config.in"
-	source "package/python-certifi/Config.in"
-	source "package/python-cffi/Config.in"
-	source "package/python-cheetah/Config.in"
-	source "package/python-cherrypy/Config.in"
-	source "package/python-coherence/Config.in"
-	source "package/python-configobj/Config.in"
-	source "package/python-configshell-fb/Config.in"
-	source "package/python-crc16/Config.in"
-	source "package/python-daemon/Config.in"
-	source "package/python-dialog/Config.in"
-	source "package/python-django/Config.in"
-	source "package/python-docopt/Config.in"
-	source "package/python-dpkt/Config.in"
-	source "package/python-enum/Config.in"
-	source "package/python-enum34/Config.in"
-	source "package/python-flask/Config.in"
-	source "package/python-flup/Config.in"
-	source "package/python-gobject/Config.in"
-	source "package/python-html5lib/Config.in"
-	source "package/python-httplib2/Config.in"
-	source "package/python-id3/Config.in"
-	source "package/python-idna/Config.in"
-	source "package/python-ipaddr/Config.in"
-	source "package/python-ipaddress/Config.in"
-	source "package/python-ipy/Config.in"
-	source "package/python-ipython/Config.in"
-	source "package/python-itsdangerous/Config.in"
-	source "package/python-jinja2/Config.in"
-	source "package/python-json-schema-validator/Config.in"
-	source "package/python-keyring/Config.in"
-	source "package/python-libconfig/Config.in"
-	source "package/python-lxml/Config.in"
-	source "package/python-mad/Config.in"
-	source "package/python-mako/Config.in"
-	source "package/python-markdown/Config.in"
-	source "package/python-markupsafe/Config.in"
-	source "package/python-meld3/Config.in"
-	source "package/python-msgpack/Config.in"
-	source "package/python-netifaces/Config.in"
-	source "package/python-networkmanager/Config.in"
-	source "package/python-nfc/Config.in"
-	source "package/python-numpy/Config.in"
-	source "package/python-paho-mqtt/Config.in"
-	source "package/python-pam/Config.in"
-	source "package/python-posix-ipc/Config.in"
-	source "package/python-protobuf/Config.in"
-	source "package/python-psutil/Config.in"
-	source "package/python-pyasn/Config.in"
-	source "package/python-pycli/Config.in"
-	source "package/python-pycrypto/Config.in"
-	source "package/python-pydal/Config.in"
-	source "package/python-pyftpdlib/Config.in"
-	source "package/python-pygame/Config.in"
-	source "package/python-pyinotify/Config.in"
-	source "package/python-pyparsing/Config.in"
-	source "package/python-pypcap/Config.in"
-	source "package/python-pyqt/Config.in"
-	source "package/python-pyratemp/Config.in"
-	source "package/python-pyro/Config.in"
-	source "package/python-pyroute2/Config.in"
-	source "package/python-pysendfile/Config.in"
-	source "package/python-pysmb/Config.in"
-	source "package/python-pysnmp/Config.in"
-	source "package/python-pysnmp-apps/Config.in"
-	source "package/python-pysnmp-mibs/Config.in"
-	source "package/python-pyudev/Config.in"
-	source "package/python-pyusb/Config.in"
-	source "package/python-pyxb/Config.in"
-	source "package/python-pyyaml/Config.in"
-	source "package/python-pyzmq/Config.in"
-	source "package/python-requests/Config.in"
-	source "package/python-rtslib-fb/Config.in"
-	source "package/python-serial/Config.in"
-	source "package/python-setuptools/Config.in"
-	source "package/python-simplejson/Config.in"
-	source "package/python-singledispatch/Config.in"
-	source "package/python-sip/Config.in"
-	source "package/python-six/Config.in"
-	source "package/python-spidev/Config.in"
-	source "package/python-thrift/Config.in"
-	source "package/python-tornado/Config.in"
-	source "package/python-twisted/Config.in"
-	source "package/python-urllib3/Config.in"
-	source "package/python-urwid/Config.in"
-	source "package/python-versiontools/Config.in"
-	source "package/python-web2py/Config.in"
-	source "package/python-webpy/Config.in"
-	source "package/python-werkzeug/Config.in"
-	source "package/python-ws4py/Config.in"
-	source "package/python-zope-interface/Config.in"
-endmenu
-endif
 	source "package/ruby/Config.in"
 	source "package/tcl/Config.in"
 if BR2_PACKAGE_TCL
diff --git a/package/python/Config.ext b/package/python/Config.ext
new file mode 100644
index 0000000..154e653
--- /dev/null
+++ b/package/python/Config.ext
@@ -0,0 +1,98 @@
+# This file is included both from python and python3
+
+comment "External python modules"
+
+source "package/python-alsaaudio/Config.in"
+source "package/python-backports-abc/Config.in"
+source "package/python-bottle/Config.in"
+source "package/python-can/Config.in"
+source "package/python-certifi/Config.in"
+source "package/python-cffi/Config.in"
+source "package/python-cheetah/Config.in"
+source "package/python-cherrypy/Config.in"
+source "package/python-coherence/Config.in"
+source "package/python-configobj/Config.in"
+source "package/python-configshell-fb/Config.in"
+source "package/python-crc16/Config.in"
+source "package/python-daemon/Config.in"
+source "package/python-dialog/Config.in"
+source "package/python-django/Config.in"
+source "package/python-docopt/Config.in"
+source "package/python-dpkt/Config.in"
+source "package/python-enum/Config.in"
+source "package/python-enum34/Config.in"
+source "package/python-flask/Config.in"
+source "package/python-flup/Config.in"
+source "package/python-gobject/Config.in"
+source "package/python-html5lib/Config.in"
+source "package/python-httplib2/Config.in"
+source "package/python-id3/Config.in"
+source "package/python-idna/Config.in"
+source "package/python-ipaddr/Config.in"
+source "package/python-ipaddress/Config.in"
+source "package/python-ipy/Config.in"
+source "package/python-ipython/Config.in"
+source "package/python-itsdangerous/Config.in"
+source "package/python-jinja2/Config.in"
+source "package/python-json-schema-validator/Config.in"
+source "package/python-keyring/Config.in"
+source "package/python-libconfig/Config.in"
+source "package/python-lxml/Config.in"
+source "package/python-mad/Config.in"
+source "package/python-mako/Config.in"
+source "package/python-markdown/Config.in"
+source "package/python-markupsafe/Config.in"
+source "package/python-meld3/Config.in"
+source "package/python-msgpack/Config.in"
+source "package/python-netifaces/Config.in"
+source "package/python-networkmanager/Config.in"
+source "package/python-nfc/Config.in"
+source "package/python-numpy/Config.in"
+source "package/python-paho-mqtt/Config.in"
+source "package/python-pam/Config.in"
+source "package/python-posix-ipc/Config.in"
+source "package/python-protobuf/Config.in"
+source "package/python-psutil/Config.in"
+source "package/python-pyasn/Config.in"
+source "package/python-pycli/Config.in"
+source "package/python-pycrypto/Config.in"
+source "package/python-pydal/Config.in"
+source "package/python-pyftpdlib/Config.in"
+source "package/python-pygame/Config.in"
+source "package/python-pyinotify/Config.in"
+source "package/python-pyparsing/Config.in"
+source "package/python-pypcap/Config.in"
+source "package/python-pyqt/Config.in"
+source "package/python-pyratemp/Config.in"
+source "package/python-pyro/Config.in"
+source "package/python-pyroute2/Config.in"
+source "package/python-pysendfile/Config.in"
+source "package/python-pysmb/Config.in"
+source "package/python-pysnmp/Config.in"
+source "package/python-pysnmp-apps/Config.in"
+source "package/python-pysnmp-mibs/Config.in"
+source "package/python-pyudev/Config.in"
+source "package/python-pyusb/Config.in"
+source "package/python-pyxb/Config.in"
+source "package/python-pyyaml/Config.in"
+source "package/python-pyzmq/Config.in"
+source "package/python-requests/Config.in"
+source "package/python-rtslib-fb/Config.in"
+source "package/python-serial/Config.in"
+source "package/python-setuptools/Config.in"
+source "package/python-simplejson/Config.in"
+source "package/python-singledispatch/Config.in"
+source "package/python-sip/Config.in"
+source "package/python-six/Config.in"
+source "package/python-spidev/Config.in"
+source "package/python-thrift/Config.in"
+source "package/python-tornado/Config.in"
+source "package/python-twisted/Config.in"
+source "package/python-urllib3/Config.in"
+source "package/python-urwid/Config.in"
+source "package/python-versiontools/Config.in"
+source "package/python-web2py/Config.in"
+source "package/python-webpy/Config.in"
+source "package/python-werkzeug/Config.in"
+source "package/python-ws4py/Config.in"
+source "package/python-zope-interface/Config.in"
diff --git a/package/python/Config.in b/package/python/Config.in
index 40a2ef4..6563cd6 100644
--- a/package/python/Config.in
+++ b/package/python/Config.in
@@ -127,4 +127,6 @@ config BR2_PACKAGE_PYTHON_HASHLIB
 	help
 	  hashlib support in Python
 
+source "package/python/Config.ext"
+
 endif
diff --git a/package/python3/Config.ext b/package/python3/Config.ext
new file mode 120000
index 0000000..1b3df59
--- /dev/null
+++ b/package/python3/Config.ext
@@ -0,0 +1 @@
+../python/Config.ext
\ No newline at end of file
diff --git a/package/python3/Config.in b/package/python3/Config.in
index aadc8b6..f221a54 100644
--- a/package/python3/Config.in
+++ b/package/python3/Config.in
@@ -104,4 +104,6 @@ config BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  zlib support in Python3
 
+source "package/python3/Config.ext"
+
 endif
-- 
1.9.1
