From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 29 Apr 2012 12:06:35 +0200
Subject: [Buildroot] [PATCH 2/2] lsof: add busybox tweaks
In-Reply-To: <87ehr77x56.fsf@macbook.be.48ers.dk>
References: <1335435324-18792-1-git-send-email-gustavo@zacarias.com.ar>
 <201204272354.58069.arnout@mind.be> <87ehr77x56.fsf@macbook.be.48ers.dk>
Message-ID: <201204291206.36021.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sunday 29 April 2012 10:36:05 Peter Korsgaard wrote:
> True. But the first thing to decide on is if this _SHOW_OTHERS option is
> really useful. It was afaik introduced long time ago to encourage people
> to use the busybox applets instead of the full blown versions, but
> perhaps we should just let people decide for themselves?

 Admittedly, the first thing I do when a start configuring is to enable
_SHOW_OTHERS.  However, I think it is very useful for Joe Random User
to be informed of which packages are redundant because they are already
provided by busybox.  Still, maybe a better way is to mention that in the
package's menu entry:

diff --git a/package/lsof/Config.in b/package/lsof/Config.in
index cc7512c..c3a878f 100644
--- a/package/lsof/Config.in
+++ b/package/lsof/Config.in
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_LSOF
-       bool "lsof"
+       bool "lsof (also in busybox)"
        help
          lsof (LiSt Open Files)
          The lsof tool lists information about files opened by


 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
