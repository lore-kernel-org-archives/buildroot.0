From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 16 Oct 2016 12:07:54 +0200
Subject: [Buildroot] [git commit] dependencies: check for MakeMaker Perl
	module
Message-ID: <20161016101033.70AC581E77@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=026d47c7c524a026e04871084343c9a371efde65
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ExtUtils::MakeMaker is one of the Perl Core modules usually packaged in
Perl package for a Debian/Ubuntu based system.
For a Fedora based system, each Perl Core modules have their own RPM
package. So install only Perl package is not enough.

Fixes:
>>> host-libxml-parser-perl 2.41 Configuring
[...]
perl `which perl` Makefile.PL
Can't locate ExtUtils/MakeMaker.pm in @INC (you may need to install the ExtUtils::MakeMaker module)

Add a new Perl module check in dependency.sh.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Fran??ois Perrad <francois.perrad@gadz.org>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 support/dependencies/dependencies.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/support/dependencies/dependencies.sh b/support/dependencies/dependencies.sh
index 3146401..5832cf3 100755
--- a/support/dependencies/dependencies.sh
+++ b/support/dependencies/dependencies.sh
@@ -238,6 +238,7 @@ fi
 
 # Check that the Perl installation is complete enough for Buildroot.
 required_perl_modules="Data::Dumper" # Needed to build host-autoconf
+required_perl_modules="$required_perl_modules ExtUtils::MakeMaker" # Used by host-libxml-parser-perl
 required_perl_modules="$required_perl_modules Thread::Queue" # Used by host-automake
 
 # This variable will keep the modules that are missing in your system.
