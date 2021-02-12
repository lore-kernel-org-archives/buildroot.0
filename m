From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 12 Feb 2021 23:13:57 +0100
Subject: [Buildroot] [PATCH 1/1] package/x265: update project URL
In-Reply-To: <20210212091138.27649-1-sebastien.szymanski@armadeus.com>
 (=?utf-8?Q?=22S=C3=A9bastien?= Szymanski"'s message of "Fri, 12 Feb 2021
 10:11:38 +0100")
References: <20210212091138.27649-1-sebastien.szymanski@armadeus.com>
Message-ID: <87v9axdjdm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "S?bastien" == S?bastien Szymanski <sebastien.szymanski@armadeus.com> writes:

 > The project moved to https://bitbucket.org/multicoreware/x265_git
 > Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
 > ---
 >  package/x265/Config.in | 2 +-
 >  package/x265/x265.mk   | 4 ++--
 >  2 files changed, 3 insertions(+), 3 deletions(-)

 > diff --git a/package/x265/Config.in b/package/x265/Config.in
 > index 180931db66..1067505d31 100644
 > --- a/package/x265/Config.in
 > +++ b/package/x265/Config.in
 > @@ -11,7 +11,7 @@ config BR2_PACKAGE_X265
 >  	  General Public License (GPL) 2 license or a commercial
 >  	  license, similar to the x264 project.
 
 > -	  https://bitbucket.org/multicoreware/x265/wiki/Home
 > +	  https://bitbucket.org/multicoreware/x265_git/wiki/Home
 
 >  if BR2_PACKAGE_X265
 
 > diff --git a/package/x265/x265.mk b/package/x265/x265.mk
 > index 872753eea8..7bc1d11e19 100644
 > --- a/package/x265/x265.mk
 > +++ b/package/x265/x265.mk
 > @@ -6,7 +6,7 @@
 
 >  X265_VERSION = 3.3
 >  X265_SOURCE = x265_$(X265_VERSION).tar.gz
 > -X265_SITE = https://bitbucket.org/multicoreware/x265/downloads
 > +X265_SITE = https://bitbucket.org/multicoreware/x265_git/downloads

That's no good:

make x265-legal-info
>>> x265 3.3 Downloading
--2021-02-12 23:11:53--  https://bitbucket.org/multicoreware/x265_git/downloads/x265_3.3.tar.gz
Resolving bitbucket.org (bitbucket.org)... 104.192.141.1, 2406:da00:ff00::22c5:2ef4, 2406:da00:ff00::34cc:ea4a, ...
Connecting to bitbucket.org (bitbucket.org)|104.192.141.1|:443... connected.
HTTP request sent, awaiting response... 302 Found
Location: https://bbuseruploads.s3.amazonaws.com/c105f477-2003-4e12-80e5-06858cf7e40b/downloads/4247de9f-1484-4e31-b9b8-f69a505230de/x265_3.3.tar.gz?Signature=db4jq18NjpWhN69UKLdeNlmLUto%3D&Expires=1613169568&AWSAccessKeyId=AKIA6KOSE3BNJRRFUUX6&versionId=s9fflFgseT2OEPm_eT1G33eu3G8q_RJ5&response-content-disposition=attachment%3B%20filename%3D%22x265_3.3.tar.gz%22&response-content-encoding=None [following]
--2021-02-12 23:11:54--  https://bbuseruploads.s3.amazonaws.com/c105f477-2003-4e12-80e5-06858cf7e40b/downloads/4247de9f-1484-4e31-b9b8-f69a505230de/x265_3.3.tar.gz?Signature=db4jq18NjpWhN69UKLdeNlmLUto%3D&Expires=1613169568&AWSAccessKeyId=AKIA6KOSE3BNJRRFUUX6&versionId=s9fflFgseT2OEPm_eT1G33eu3G8q_RJ5&response-content-disposition=attachment%3B%20filename%3D%22x265_3.3.tar.gz%22&response-content-encoding=None
Resolving bbuseruploads.s3.amazonaws.com (bbuseruploads.s3.amazonaws.com)... 52.217.48.92
Connecting to bbuseruploads.s3.amazonaws.com (bbuseruploads.s3.amazonaws.com)|52.217.48.92|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 1508513 (1,4M) [application/x-gzip]
Saving to: ?/home/peko/source/buildroot/output/build/.x265_3.3.tar.gz.fsI64y/output?

/home/peko/source/buildroot/output/build/.x265_3.3.tar.gz.fsI64 100%[======================================================================================================================================================>]   1,44M   697KB/s    in 2,1s

2021-02-12 23:11:57 (697 KB/s) - ?/home/peko/source/buildroot/output/build/.x265_3.3.tar.gz.fsI64y/output? saved [1508513/1508513]

ERROR: x265_3.3.tar.gz has wrong md5 hash:
ERROR: expected: 0c8c747b59b5411dea8cf557554636c1
ERROR: got     : be6ea7a139b01fa6f2614d5c1197492d
ERROR: Incomplete download, or man-in-the-middle (MITM) attack

Either we need to change the hashes (and update the copy on
sources.buildroot.org) or keep it as is until we bump the version.

-- 
Bye, Peter Korsgaard
