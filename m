From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 8 Dec 2014 22:40:01 +0100
Subject: [Buildroot] [git commit] thrift: bump to version 0.9.2
Message-ID: <20141208220413.7D02F8010D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=55284ae77f1f4de5ff8374b9403666751af2fcdf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Drop patches that are upstream.
Add hash file.
Tweak autoreconf patch since README is now missing as well.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...event-cross.patch => 0001-libevent-cross.patch} |    0
 package/thrift/0002-autoreconf.patch               |   28 +++++
 ...t-03-zlib-cross.patch => 0003-zlib-cross.patch} |    0
 package/thrift/thrift-02-autoreconf.patch          |   22 ----
 .../thrift-04-failed-to-build-on-OSX-10.9-GM.patch |   88 ---------------
 ...-05-stdlib-and-boost-both-define-uint64_t.patch |  112 --------------------
 package/thrift/thrift.hash                         |    2 +
 package/thrift/thrift.mk                           |   13 ++-
 8 files changed, 38 insertions(+), 227 deletions(-)

diff --git a/package/thrift/thrift-01-libevent-cross.patch b/package/thrift/0001-libevent-cross.patch
similarity index 100%
rename from package/thrift/thrift-01-libevent-cross.patch
rename to package/thrift/0001-libevent-cross.patch
diff --git a/package/thrift/0002-autoreconf.patch b/package/thrift/0002-autoreconf.patch
new file mode 100644
index 0000000..1a52f7c
--- /dev/null
+++ b/package/thrift/0002-autoreconf.patch
@@ -0,0 +1,28 @@
+Fillers to make autoreconf (automake) happy.
+
+Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
+
+diff -Nura thrift-0.9.2.orig/AUTHORS thrift-0.9.2/AUTHORS
+--- thrift-0.9.2.orig/AUTHORS	1969-12-31 21:00:00.000000000 -0300
++++ thrift-0.9.2/AUTHORS	2014-12-05 14:46:20.431211224 -0300
+@@ -0,0 +1,2 @@
++
++
+diff -Nura thrift-0.9.2.orig/ChangeLog thrift-0.9.2/ChangeLog
+--- thrift-0.9.2.orig/ChangeLog	1969-12-31 21:00:00.000000000 -0300
++++ thrift-0.9.2/ChangeLog	2014-12-05 14:46:34.290686170 -0300
+@@ -0,0 +1,2 @@
++
++
+diff -Nura thrift-0.9.2.orig/NEWS thrift-0.9.2/NEWS
+--- thrift-0.9.2.orig/NEWS	1969-12-31 21:00:00.000000000 -0300
++++ thrift-0.9.2/NEWS	2014-12-05 14:46:32.308618241 -0300
+@@ -0,0 +1,2 @@
++
++
+diff -Nura thrift-0.9.2.orig/README thrift-0.9.2/README
+--- thrift-0.9.2.orig/README	1969-12-31 21:00:00.000000000 -0300
++++ thrift-0.9.2/README	2014-12-05 14:46:28.305481028 -0300
+@@ -0,0 +1,2 @@
++
++
diff --git a/package/thrift/thrift-03-zlib-cross.patch b/package/thrift/0003-zlib-cross.patch
similarity index 100%
rename from package/thrift/thrift-03-zlib-cross.patch
rename to package/thrift/0003-zlib-cross.patch
diff --git a/package/thrift/thrift-02-autoreconf.patch b/package/thrift/thrift-02-autoreconf.patch
deleted file mode 100644
index d56212a..0000000
--- a/package/thrift/thrift-02-autoreconf.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-Fillers to make autoreconf (automake) happy.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
-diff -Nura thrift-0.9.1.orig/AUTHORS thrift-0.9.1/AUTHORS
---- thrift-0.9.1.orig/AUTHORS	1969-12-31 21:00:00.000000000 -0300
-+++ thrift-0.9.1/AUTHORS	2013-10-07 20:45:15.745315148 -0300
-@@ -0,0 +1,2 @@
-+
-+
-diff -Nura thrift-0.9.1.orig/ChangeLog thrift-0.9.1/ChangeLog
---- thrift-0.9.1.orig/ChangeLog	1969-12-31 21:00:00.000000000 -0300
-+++ thrift-0.9.1/ChangeLog	2013-10-07 20:45:23.078554836 -0300
-@@ -0,0 +1,2 @@
-+
-+
-diff -Nura thrift-0.9.1.orig/NEWS thrift-0.9.1/NEWS
---- thrift-0.9.1.orig/NEWS	1969-12-31 21:00:00.000000000 -0300
-+++ thrift-0.9.1/NEWS	2013-10-07 20:45:20.351465699 -0300
-@@ -0,0 +1,2 @@
-+
-+
diff --git a/package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch b/package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch
deleted file mode 100644
index 8ff9def..0000000
--- a/package/thrift/thrift-04-failed-to-build-on-OSX-10.9-GM.patch
+++ /dev/null
@@ -1,88 +0,0 @@
-THRIFT-2229 thrift failed to build on OSX 10.9 GM
-
----
- compiler/cpp/src/thrifty.yy |  4 ++--
- tutorial/cpp/CppClient.cpp  |  6 +++---
- tutorial/cpp/CppServer.cpp  | 16 ++++++++--------
- 3 files changed, 13 insertions(+), 13 deletions(-)
- mode change 100644 => 100755 compiler/cpp/src/thrifty.yy
-
-diff --git a/compiler/cpp/src/thrifty.yy b/compiler/cpp/src/thrifty.yy
-old mode 100644
-new mode 100755
-index b543552..8814332
---- a/compiler/cpp/src/thrifty.yy
-+++ b/compiler/cpp/src/thrifty.yy
-@@ -675,7 +675,7 @@ ConstValue:
-       $$ = new t_const_value();
-       $$->set_integer($1);
-       if (!g_allow_64bit_consts && ($1 < INT32_MIN || $1 > INT32_MAX)) {
--        pwarning(1, "64-bit constant \"%"PRIi64"\" may not work in all languages.\n", $1);
-+        pwarning(1, "64-bit constant \"%" PRIi64"\" may not work in all languages.\n", $1);
-       }
-     }
- | tok_dub_constant
-@@ -987,7 +987,7 @@ FieldIdentifier:
-              * warn if the user-specified negative value isn't what
-              * thrift would have auto-assigned.
-              */
--            pwarning(1, "Nonpositive field key (%"PRIi64") differs from what would be "
-+            pwarning(1, "Nonpositive field key (%" PRIi64") differs from what would be "
-                      "auto-assigned by thrift (%d).\n", $1, y_field_val);
-           }
-           /*
-diff --git a/tutorial/cpp/CppClient.cpp b/tutorial/cpp/CppClient.cpp
-index ba71caa..b91df2e 100644
---- a/tutorial/cpp/CppClient.cpp
-+++ b/tutorial/cpp/CppClient.cpp
-@@ -38,9 +38,9 @@ using namespace shared;
- using namespace boost;
- 
- int main(int argc, char** argv) {
--  shared_ptr<TTransport> socket(new TSocket("localhost", 9090));
--  shared_ptr<TTransport> transport(new TBufferedTransport(socket));
--  shared_ptr<TProtocol> protocol(new TBinaryProtocol(transport));
-+  boost::shared_ptr<TTransport> socket(new TSocket("localhost", 9090));
-+  boost::shared_ptr<TTransport> transport(new TBufferedTransport(socket));
-+  boost::shared_ptr<TProtocol> protocol(new TBinaryProtocol(transport));
-   CalculatorClient client(protocol);
- 
-   try {
-diff --git a/tutorial/cpp/CppServer.cpp b/tutorial/cpp/CppServer.cpp
-index d0dbad9..f19258c 100644
---- a/tutorial/cpp/CppServer.cpp
-+++ b/tutorial/cpp/CppServer.cpp
-@@ -113,11 +113,11 @@ protected:
- 
- int main(int argc, char **argv) {
- 
--  shared_ptr<TProtocolFactory> protocolFactory(new TBinaryProtocolFactory());
--  shared_ptr<CalculatorHandler> handler(new CalculatorHandler());
--  shared_ptr<TProcessor> processor(new CalculatorProcessor(handler));
--  shared_ptr<TServerTransport> serverTransport(new TServerSocket(9090));
--  shared_ptr<TTransportFactory> transportFactory(new TBufferedTransportFactory());
-+  boost::shared_ptr<TProtocolFactory> protocolFactory(new TBinaryProtocolFactory());
-+  boost::shared_ptr<CalculatorHandler> handler(new CalculatorHandler());
-+  boost::shared_ptr<TProcessor> processor(new CalculatorProcessor(handler));
-+  boost::shared_ptr<TServerTransport> serverTransport(new TServerSocket(9090));
-+  boost::shared_ptr<TTransportFactory> transportFactory(new TBufferedTransportFactory());
- 
-   TSimpleServer server(processor,
-                        serverTransport,
-@@ -128,10 +128,10 @@ int main(int argc, char **argv) {
-   /**
-    * Or you could do one of these
- 
--  shared_ptr<ThreadManager> threadManager =
-+  boost::shared_ptr<ThreadManager> threadManager =
-     ThreadManager::newSimpleThreadManager(workerCount);
--  shared_ptr<PosixThreadFactory> threadFactory =
--    shared_ptr<PosixThreadFactory>(new PosixThreadFactory());
-+  boost::shared_ptr<PosixThreadFactory> threadFactory =
-+    boost::shared_ptr<PosixThreadFactory>(new PosixThreadFactory());
-   threadManager->threadFactory(threadFactory);
-   threadManager->start();
-   TThreadPoolServer server(processor,
--- 
-1.8.5.3
-
diff --git a/package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch b/package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch
deleted file mode 100644
index 70a5885..0000000
--- a/package/thrift/thrift-05-stdlib-and-boost-both-define-uint64_t.patch
+++ /dev/null
@@ -1,112 +0,0 @@
-THRIFT-2367 Build failure: stdlib and boost both define uint64_t
-
-Fix: remove "using namespace boost;"
-Patch: Roger Meier
----
- lib/cpp/src/thrift/transport/TSSLServerSocket.cpp | 8 +++-----
- lib/cpp/src/thrift/transport/TSSLSocket.cpp       | 7 +++----
- tutorial/cpp/CppClient.cpp                        | 2 --
- tutorial/cpp/CppServer.cpp                        | 2 --
- 4 files changed, 6 insertions(+), 13 deletions(-)
-
-diff --git a/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp b/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
-index 4689e4a..df5ed75 100644
---- a/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
-+++ b/lib/cpp/src/thrift/transport/TSSLServerSocket.cpp
-@@ -22,25 +22,23 @@
- 
- namespace apache { namespace thrift { namespace transport {
- 
--using namespace boost;
--
- /**
-  * SSL server socket implementation.
-  */
- TSSLServerSocket::TSSLServerSocket(int port,
--                                   shared_ptr<TSSLSocketFactory> factory):
-+                                   boost::shared_ptr<TSSLSocketFactory> factory):
-                                    TServerSocket(port), factory_(factory) {
-   factory_->server(true);
- }
- 
- TSSLServerSocket::TSSLServerSocket(int port, int sendTimeout, int recvTimeout,
--                                   shared_ptr<TSSLSocketFactory> factory):
-+                                   boost::shared_ptr<TSSLSocketFactory> factory):
-                                    TServerSocket(port, sendTimeout, recvTimeout),
-                                    factory_(factory) {
-   factory_->server(true);
- }
- 
--shared_ptr<TSocket> TSSLServerSocket::createSocket(int client) {
-+boost::shared_ptr<TSocket> TSSLServerSocket::createSocket(int client) {
-   return factory_->createSocket(client);
- }
- 
-diff --git a/lib/cpp/src/thrift/transport/TSSLSocket.cpp b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-index 029c541..5029f74 100644
---- a/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-+++ b/lib/cpp/src/thrift/transport/TSSLSocket.cpp
-@@ -41,7 +41,6 @@
- #define OPENSSL_VERSION_NO_THREAD_ID 0x10000000L
- 
- using namespace std;
--using namespace boost;
- using namespace apache::thrift::concurrency;
- 
- struct CRYPTO_dynlock_value {
-@@ -489,7 +488,7 @@ int TSSLSocketFactory::passwordCallback(char* password,
-   return length;
- }
- 
--static shared_array<Mutex> mutexes;
-+static boost::shared_array<Mutex> mutexes;
- 
- static void callbackLocking(int mode, int n, const char*, int) {
-   if (mode & CRYPTO_LOCK) {
-@@ -533,7 +532,7 @@ void TSSLSocketFactory::initializeOpenSSL() {
-   SSL_library_init();
-   SSL_load_error_strings();
-   // static locking
--  mutexes = shared_array<Mutex>(new Mutex[::CRYPTO_num_locks()]);
-+  mutexes = boost::shared_array<Mutex>(new Mutex[::CRYPTO_num_locks()]);
-   if (mutexes == NULL) {
-     throw TTransportException(TTransportException::INTERNAL_ERROR,
-           "initializeOpenSSL() failed, "
-@@ -591,7 +590,7 @@ void buildErrors(string& errors, int errno_copy) {
-     }
-   }
-   if (errors.empty()) {
--    errors = "error code: " + lexical_cast<string>(errno_copy);
-+    errors = "error code: " + boost::lexical_cast<string>(errno_copy);
-   }
- }
- 
-diff --git a/tutorial/cpp/CppClient.cpp b/tutorial/cpp/CppClient.cpp
-index ba71caa..6db8db6 100644
---- a/tutorial/cpp/CppClient.cpp
-+++ b/tutorial/cpp/CppClient.cpp
-@@ -35,8 +35,6 @@ using namespace apache::thrift::transport;
- using namespace tutorial;
- using namespace shared;
- 
--using namespace boost;
--
- int main(int argc, char** argv) {
-   shared_ptr<TTransport> socket(new TSocket("localhost", 9090));
-   shared_ptr<TTransport> transport(new TBufferedTransport(socket));
-diff --git a/tutorial/cpp/CppServer.cpp b/tutorial/cpp/CppServer.cpp
-index d0dbad9..d0bff32 100644
---- a/tutorial/cpp/CppServer.cpp
-+++ b/tutorial/cpp/CppServer.cpp
-@@ -41,8 +41,6 @@ using namespace apache::thrift::server;
- using namespace tutorial;
- using namespace shared;
- 
--using namespace boost;
--
- class CalculatorHandler : public CalculatorIf {
-  public:
-   CalculatorHandler() {}
--- 
-1.8.5.3
-
diff --git a/package/thrift/thrift.hash b/package/thrift/thrift.hash
new file mode 100644
index 0000000..811aa98
--- /dev/null
+++ b/package/thrift/thrift.hash
@@ -0,0 +1,2 @@
+# From https://www.apache.org/dist/thrift/0.9.2/thrift-0.9.2.tar.gz.md5
+md5	89f63cc4d0100912f4a1f8a9dee63678	thrift-0.9.2.tar.gz
diff --git a/package/thrift/thrift.mk b/package/thrift/thrift.mk
index e14cb57..5c350dd 100644
--- a/package/thrift/thrift.mk
+++ b/package/thrift/thrift.mk
@@ -4,15 +4,17 @@
 #
 ################################################################################
 
-THRIFT_VERSION = 0.9.1
+THRIFT_VERSION = 0.9.2
 THRIFT_SITE = http://www.us.apache.org/dist/thrift/$(THRIFT_VERSION)
 THRIFT_DEPENDENCIES = host-pkgconf host-thrift boost libevent openssl zlib
 THRIFT_INSTALL_STAGING = YES
 HOST_THRIFT_DEPENDENCIES = host-boost host-libevent host-openssl host-pkgconf \
 	host-zlib host-bison host-flex
-THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) --with-tests=no \
-	--with-boost=$(STAGING_DIR)
-HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) --with-tests=no
+THRIFT_CONF_OPTS = --with-sysroot=$(STAGING_DIR) \
+	--with-boost=$(STAGING_DIR) \
+	--disable-tests
+HOST_THRIFT_CONF_OPTS = --with-sysroot=$(HOST_DIR) \
+	--disable-tests
 THRIFT_AUTORECONF = YES
 THRIFT_LICENSE = Apache-2.0
 THRIFT_LICENSE_FILES = LICENSE
@@ -27,7 +29,8 @@ endif
 # This is just for the libraries / bindings
 THRIFT_LANG_CONF_OPTS += --without-csharp --without-java --without-erlang \
 	--without-python --without-perl --without-php --without-php_extension \
-	--without-ruby --without-haskell --without-go --without-d --without-qt4
+	--without-ruby --without-haskell --without-go --without-d \
+	--without-qt4 --without-lua
 HOST_THRIFT_CONF_OPTS += $(THRIFT_LANG_CONF_OPTS) --without-c_glib
 THRIFT_CONF_OPTS += $(THRIFT_LANG_CONF_OPTS)
 
