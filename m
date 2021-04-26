From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 26 Apr 2021 21:15:13 +0200
Subject: [Buildroot] [PATCH 02/10] package/coreutils: ignore
 CVE-2013-0221, CVE-2013-0222, CVE-2013-0223
In-Reply-To: <20210421204235.5956-3-matthew.weber@rockwellcollins.com> (Matt
 Weber's message of "Wed, 21 Apr 2021 15:42:27 -0500")
References: <20210421204235.5956-1-matthew.weber@rockwellcollins.com>
 <20210421204235.5956-3-matthew.weber@rockwellcollins.com>
Message-ID: <87mttkhn7i.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Matt" == Matt Weber <matthew.weber@rockwellcollins.com> writes:

 > This CVE is only relevant to a build when the SUSE coreutils-i18n.patch
 > is included. The upstream codebase does not include this patch, nor
 > does Buildroot.

 > https://security-tracker.debian.org/tracker/CVE-2013-0221
 > https://security-tracker.debian.org/tracker/CVE-2013-0222
 > https://security-tracker.debian.org/tracker/CVE-2013-0223

 > Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
 > ---
 >  package/coreutils/coreutils.mk | 4 ++++
 >  1 file changed, 4 insertions(+)

 > diff --git a/package/coreutils/coreutils.mk b/package/coreutils/coreutils.mk
 > index 0e75cdfcda..65234a113e 100644
 > --- a/package/coreutils/coreutils.mk
 > +++ b/package/coreutils/coreutils.mk
 > @@ -10,6 +10,10 @@ COREUTILS_SOURCE = coreutils-$(COREUTILS_VERSION).tar.xz
 >  COREUTILS_LICENSE = GPL-3.0+
 >  COREUTILS_LICENSE_FILES = COPYING
 >  COREUTILS_CPE_ID_VENDOR = gnu
 > +# Only when including SUSE coreutils-i18n.patch
 > +COREUTILS_IGNORE_CVES = CVE-2013-0221
 > +COREUTILS_IGNORE_CVES += CVE-2013-0222
 > +COREUTILS_IGNORE_CVES += CVE-2013-0223

NIT: There is no problem having multiple CVE's on the same line:

COREUTILS_IGORE_CVES += CVE-2013-0221 CVE-2013-0222 CVE-2013-0223

-- 
Bye, Peter Korsgaard
