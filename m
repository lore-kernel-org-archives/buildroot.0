From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 3 Jan 2014 20:47:00 +0100
Subject: [Buildroot] [git commit] zmqpp: bump git snapshot
Message-ID: <20140103194751.67CCE9C378@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=85d28790cdbaa68179632aca7e5708fead7614f0
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Also remove a patch which is no longer required.

Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/zmqpp/zmqpp-fix-typos-in-code.patch |   46 ---------------------------
 package/zmqpp/zmqpp.mk                      |    2 +-
 2 files changed, 1 insertions(+), 47 deletions(-)

diff --git a/package/zmqpp/zmqpp-fix-typos-in-code.patch b/package/zmqpp/zmqpp-fix-typos-in-code.patch
deleted file mode 100644
index a873de9..0000000
--- a/package/zmqpp/zmqpp-fix-typos-in-code.patch
+++ /dev/null
@@ -1,46 +0,0 @@
-Fix a couple of typos in the zmqpp source code.
-
-Signed-off-by: Simon Dawson <spdawson@gmail.com>
-
-diff -Nurp a/src/zmqpp/socket.cpp b/src/zmqpp/socket.cpp
---- a/src/zmqpp/socket.cpp	2012-12-11 11:06:23.000000000 +0000
-+++ b/src/zmqpp/socket.cpp	2013-03-18 17:32:01.464761776 +0000
-@@ -587,7 +587,7 @@ void socket::get(socket_option const& op
- 	}
- }
- 
--socket::socket(socket&& source) noexcept
-+socket::socket(socket& source) noexcept
- 	: _socket(source._socket)
- 	, _type(source._type)
- 	, _recv_buffer()
-@@ -601,7 +601,7 @@ socket::socket(socket&& source) noexcept
- 	source._socket = nullptr;
- }
- 
--socket& socket::operator=(socket&& source) noexcept
-+socket& socket::operator=(socket& source) noexcept
- {
- 	_socket = source._socket;
- 	source._socket = nullptr;
-diff -Nurp a/src/zmqpp/socket.hpp b/src/zmqpp/socket.hpp
---- a/src/zmqpp/socket.hpp	2012-12-11 11:06:23.000000000 +0000
-+++ b/src/zmqpp/socket.hpp	2013-03-18 17:31:53.556790457 +0000
-@@ -400,7 +400,7 @@ public:
- 	 *
- 	 * \param source target socket to steal internals from
- 	 */
--	socket(socket&& source) noexcept;
-+	socket(socket& source) noexcept;
- 
- 	/*!
- 	 * Move operator
-@@ -413,7 +413,7 @@ public:
- 	 * \param source target socket to steal internals from
- 	 * \return socket reference to this
- 	 */
--	socket& operator=(socket&& source) noexcept;
-+	socket& operator=(socket& source) noexcept;
- 
- 	/*!
- 	 * Check the socket is still valid
diff --git a/package/zmqpp/zmqpp.mk b/package/zmqpp/zmqpp.mk
index 53c58c3..cfd6f13 100644
--- a/package/zmqpp/zmqpp.mk
+++ b/package/zmqpp/zmqpp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-ZMQPP_VERSION = 31220ca4a0fb43a0848d78f5e4f23fce39945777
+ZMQPP_VERSION = 30d72d95f2cfdf9c5cedfd56747f549d65e65847
 ZMQPP_SITE = git://github.com/benjamg/zmqpp.git
 ZMQPP_INSTALL_STAGING = YES
 ZMQPP_DEPENDENCIES = zeromq
