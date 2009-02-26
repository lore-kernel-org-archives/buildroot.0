From: Daniel Laird <danieljlaird@hotmail.com>
Date: Thu, 26 Feb 2009 15:53:10 +0000
Subject: [Buildroot] [Bug 101] New: update gstreamer packages
In-Reply-To: <bug-101-163@https.bugs.busybox.net/>
References: <bug-101-163@https.bugs.busybox.net/>
Message-ID: <COL102-DS38E057154929657A976F2DCAD0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I tried to use this patch and could not get it to work.  The reason appears
to be that they have moved on some libtool version in the gstreamer packages
which means the LIBTOOL_PATCH cannot be set to YES.  This means that it then
starts linking against my host libraries rather than my STAGING_DIR/ mips
based libraries and unsurprisingly the linker gives up.

If anyone has succesfully built this package using a cross compiler (ideally
external toolchain) I would love to know how you did it because I had real
trouble.

Also,
We have this libtool-patch script currently and some of it appears to still
be required with the newer libtool versions being used.  Is there a plan to
support patching newer libtool files? As I see some real value in this.

Many thanks
Dan laird

-----Original Message-----
From: buildroot-bounces@busybox.net [mailto:buildroot-bounces at busybox.net]
On Behalf Of bugzilla at busybox.net
Sent: 2009 Feb 11 09:38
To: buildroot at uclibc.org
Subject: [Buildroot] [Bug 101] New: update gstreamer packages

https://bugs.busybox.net/show_bug.cgi?id=101

           Summary: update gstreamer packages
           Product: buildroot
           Version: unspecified
          Platform: PC
        OS/Version: Linux
            Status: NEW
          Severity: enhancement
          Priority: P3
         Component: Outdated package
        AssignedTo: unassigned at buildroot.uclibc.org
        ReportedBy: s.neumann at phase-zero.de
                CC: buildroot at uclibc.org
   Estimated Hours: 0.0


Created an attachment (id=63)
 --> (https://bugs.busybox.net/attachment.cgi?id=63)
update gstreamer packages

I have successfully updated the GStreamer packages in my tree. Attaching the
patch here so that it can be applied upstream after the buildroot release.
The
patch updates gstreamer to version 0.10.22, gst-plugins-base to 0.10.22,
gst-plugins-good to 0.10.13 and gst-plugins-ugly to 0.10.10. It also removes
two patches which are not any longer needed as they have been applied
upstream.


-- 
Configure bugmail: https://bugs.busybox.net/userprefs.cgi?tab=email
------- You are receiving this mail because: -------
You are on the CC list for the bug.
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
