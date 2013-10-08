From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue,  8 Oct 2013 21:02:32 +0200
Subject: [Buildroot] [PATCH 2/3] perl: fix license info
In-Reply-To: <1381258953-13487-1-git-send-email-arnout@mind.be>
References: <1381258953-13487-1-git-send-email-arnout@mind.be>
Message-ID: <1381258953-13487-2-git-send-email-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to the README, perl can be used either under
Artistic or under GPLv1+ license, so include both.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
I haven't done a thorough check, but te modules I looked at specify
their license either as "Artistic or GPL" or as "same as Perl".

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/perl/perl.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/perl/perl.mk b/package/perl/perl.mk
index 5ef0b24..ac85ed9 100644
--- a/package/perl/perl.mk
+++ b/package/perl/perl.mk
@@ -8,8 +8,8 @@ PERL_VERSION_MAJOR = 18
 PERL_VERSION = 5.$(PERL_VERSION_MAJOR).1
 PERL_SITE = http://www.cpan.org/src/5.0
 PERL_SOURCE = perl-$(PERL_VERSION).tar.bz2
-PERL_LICENSE = Artistic
-PERL_LICENSE_FILES = Artistic
+PERL_LICENSE = Artistic or GPLv1+
+PERL_LICENSE_FILES = Artistic Copying README
 PERL_INSTALL_STAGING = YES
 
 PERL_CROSS_VERSION = 0.8
-- 
1.8.4.rc3
