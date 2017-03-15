From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Mar 2017 13:33:16 +0100
Subject: [Buildroot] [PATCH] rpm: bump version to 4.13.0.1 (security)
In-Reply-To: <20170313123120.8847-1-Vincent.Riera@imgtec.com> (Vicente Olivert
 Riera's message of "Mon, 13 Mar 2017 12:31:20 +0000")
References: <20170313123120.8847-1-Vincent.Riera@imgtec.com>
Message-ID: <871styu3cj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:

 > Security fixes:
 >  - Fix several out of bounds reads in the OpenPGP parser
 >  - Fix handling of OpenPGP reserved tag (should be rejected)
 >  - Fix various crashes from malformed packages with invalid tags

 > Release notes:
 >   http://rpm.org/wiki/Releases/4.13.0.1

 > This patch also switches from GitHub to rpm.org since the last one seems
 > to be more up-to-date.

 > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
 > ---
 >  package/rpm/rpm.hash | 4 ++--
 >  package/rpm/rpm.mk   | 5 +++--
 >  2 files changed, 5 insertions(+), 4 deletions(-)

 > diff --git a/package/rpm/rpm.hash b/package/rpm/rpm.hash
 > index c9c4d65..fd77d33 100644
 > --- a/package/rpm/rpm.hash
 > +++ b/package/rpm/rpm.hash
 > @@ -1,5 +1,5 @@
 > -# From http://rpm.org/wiki/Releases/4.13.0
 > -sha1	c6ce4f879ca6a75340921093105e5ef9d33381d3	rpm-4.13.0.tar.bz2
 > +# From http://rpm.org/wiki/Releases/4.13.0.1
 > +sha1 9566f95f38fcb214e439c552f378c2f64ba0aff9  rpm-4.13.0.1.tar.bz2
 >  # Locally computed
 >  sha256	a3e5568d721737a24141737e6036bb39ba9dfbeaa03fa4a51cc7881a243e0c5d b5f1895aae096836d6e8e155ee289e1b10fcabcb.patch
 >  sha256	7ab0e08e143bb2d43d5b0553ee22ea34da15a611c597860a6110745467d20fa8 c810a0aca3f1148d2072d44b91b8cc9caeb4cf19.patch
 > diff --git a/package/rpm/rpm.mk b/package/rpm/rpm.mk
 > index 2e829d7..3fb1480 100644
 > --- a/package/rpm/rpm.mk
 > +++ b/package/rpm/rpm.mk
 > @@ -4,9 +4,10 @@
 >  #
 >  ################################################################################
 
 > -RPM_VERSION = 4.13.0
 > +RPM_MAJOR_VERSION = 4.13

Committed after renaming this to RPM_VERSION_MAJOR as suggested by
Jerzy, thanks.

-- 
Bye, Peter Korsgaard
