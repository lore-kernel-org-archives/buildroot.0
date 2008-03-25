From: Christian SCHWARZ <christian.schwarz@st.com>
Date: Tue, 25 Mar 2008 18:50:18 +0100
Subject: [Buildroot] Linking Cups with dbus broken
Message-ID: <47E93B5A.6060805@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The linking of Cups with dbus does not work (any more). ARM11 target 
with March 17th snapshot, dbus is 1.1.1 :

------------------------snip---------------------------------
subscriptions.o: In function `cupsd_send_dbus':
buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1334: undefined 
reference to `dbus_message_append_iter_init'
buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1336: undefined 
reference to `dbus_message_iter_append_string'
buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1339: undefined 
reference to `dbus_message_iter_append_uint32'
buildroot/build_arm/cups-1.3.5/scheduler/subscriptions.c:1340: undefined 
reference to `dbus_message_iter_append_string'
-------------------------snap--------------------------------

The linker correctly finds the dbus libraries, but a grep/objdump 
confirmed that the symbols are not in the dbus libraries. Might need to 
bump the version?

CUPS is automatically selected when building X, is that really necessary?

cheers,
Christian
