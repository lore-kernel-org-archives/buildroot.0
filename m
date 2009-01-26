From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Mon, 26 Jan 2009 15:28:06 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/acpid
Message-ID: <20090126152806.D6A9277458@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-01-26 15:28:05 +0000 (Mon, 26 Jan 2009)
New Revision: 25054

Log:
acpid: remove unused legacy patches

As discussed on the list.

Removed:
   trunk/buildroot/package/acpid/acpid-sign-warning.patch
   trunk/buildroot/package/acpid/acpid-socket-path.patch


Changeset:
Deleted: trunk/buildroot/package/acpid/acpid-sign-warning.patch
===================================================================
--- trunk/buildroot/package/acpid/acpid-sign-warning.patch	2009-01-26 14:49:37 UTC (rev 25053)
+++ trunk/buildroot/package/acpid/acpid-sign-warning.patch	2009-01-26 15:28:05 UTC (rev 25054)
@@ -1,11 +0,0 @@
---- acpid-1.0.4/ud_socket.c
-+++ acpid-1.0.4/ud_socket.c
-@@ -58,7 +58,7 @@ ud_accept(int listenfd, struct ucred *cr
- 	while (1) {
- 		int newsock = 0;
- 		struct sockaddr_un cliaddr;
--		int len = sizeof(struct sockaddr_un);
-+		socklen_t len = sizeof(struct sockaddr_un);
- 
- 		newsock = accept(listenfd, (struct sockaddr *)&cliaddr, &len);
- 		if (newsock < 0) {

Deleted: trunk/buildroot/package/acpid/acpid-socket-path.patch
===================================================================
--- trunk/buildroot/package/acpid/acpid-socket-path.patch	2009-01-26 14:49:37 UTC (rev 25053)
+++ trunk/buildroot/package/acpid/acpid-socket-path.patch	2009-01-26 15:28:05 UTC (rev 25054)
@@ -1,11 +0,0 @@
---- acpid-1.0.4/acpid.h
-+++ acpid-1.0.4/acpid.h
-@@ -32,7 +32,7 @@
- #define ACPI_EVENTFILE		ACPI_PROCDIR "/event"
- #define ACPI_CONFDIR		"/etc/acpi/events"
- #define ACPI_LOGFILE		"/var/log/acpid"
--#define ACPI_SOCKETFILE		"/var/run/acpid.socket"
-+#define ACPI_SOCKETFILE		"/tmp/acpid.socket"
- #define ACPI_SOCKETMODE		0666
- #define ACPI_MAX_ERRS		5
- 
