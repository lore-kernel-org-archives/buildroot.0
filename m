From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Sat, 6 Sep 2008 18:09:27 +0200
Subject: [Buildroot] [PATCH] svn commit: trunk/buildroot/package: audio
In-Reply-To: <200809061559.45793.michel@crondor.net>
References: <20080905120650.45FB73C67A@busybox.net>
	<200809061559.45793.michel@crondor.net>
Message-ID: <200809061809.27876.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Michel Wilson, 06.09.2008:
> On Friday 05 September 2008 14:06:50 laird at uclibc.org wrote:
> > Author: laird
> > Date: 2008-09-05 05:06:50 -0700 (Fri, 05 Sep 2008)
> > New Revision: 23330
> >
> > Log:
> > audio: Move all audio packages into audio subdir
> >
> > Moved all audio packages into a subdir called audio.
> > I then created a Config.in and made sure that a audio.mk
> > existed.
> 
> You missed some paths in package/audio/festival, see the attached patch.

There were also some old paths in the Config.in, see patch below.

> Note: it's my first contribution to buildroot, hopefully the patch etc. are in
> the correct format.

It applied. I don't know whether inline patches are preferred over
attachments. You'd have the possibility to comment on specific lines then.

Markus


diff --git a/package/audio/festival/Config.in b/package/audio/festival/Config.in
index 209c95b..4141e7a 100644
--- a/package/audio/festival/Config.in
+++ b/package/audio/festival/Config.in
@@ -8,15 +8,15 @@ help
 if BR2_PACKAGE_FESTIVAL
 
 	menu "speech tools"
-		source "package/festival/speech-tools/Config.in"
+		source "package/audio/festival/speech-tools/Config.in"
 	endmenu
 
 	menu "festival lexicons"
-		source "package/festival/lexicons/Config.in"
+		source "package/audio/festival/lexicons/Config.in"
 	endmenu
 
 	menu "festival voices"
-		source "package/festival/voices/Config.in"
+		source "package/audio/festival/voices/Config.in"
 	endmenu
 
 endif
