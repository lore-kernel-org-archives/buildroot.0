From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
Date: Tue, 18 Nov 2008 20:10:02 +0100
Subject: [Buildroot] [PATCH] skeletons patch
In-Reply-To: <e4c675870811181001u6d5a4643h7dc77efe3dfeae76@mail.gmail.com>
References: <e4c675870811181001u6d5a4643h7dc77efe3dfeae76@mail.gmail.com>
Message-ID: <20081118191002.GA32079@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Nov 18, 2008 at 07:01:52PM +0100, Roberto A. Foglietta wrote:
>Hi
>
> a) using busybox_skeleton loopback interface is configured two times
>in inittab and in interfaces
>
> b) in both skeletons append /usr/X11R6/bin in PATH does not hurt.
>
>
>roberto at rafbook:~/gles/buildroot$ cat skeletons.patch
>--- target/generic/target_busybox_skeleton/etc/network/interfaces	(revision
>24038)
>+++ target/generic/target_busybox_skeleton/etc/network/interfaces	(working copy)
>@@ -1,4 +1,5 @@
> # Configure Loopback
>-auto lo
>-iface lo inet loopback
>+# In this skeleton happens in inittab

ok, but
# lo is setup in /etc/inittab

>+#auto lo
>+#iface lo inet loopback
>

>--- target/generic/target_busybox_skeleton/etc/profile	(revision 24038)
>+++ target/generic/target_busybox_skeleton/etc/profile	(working copy)
>@@ -6,6 +6,7 @@
> /usr/bin:\
> /usr/sbin:\
> /usr/bin/X11:\
>+/usr/X11R6/bin:\
> /usr/local/bin

both /usr/bin/X11 and /usr/X11R6/bin are all symlinked back to /usr/bin for
me.  Note that the latter is utter legacy stuff, you shouldn't have that in
the first place.
