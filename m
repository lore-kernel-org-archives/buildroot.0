From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 17 Apr 2013 18:33:54 +0200
Subject: [Buildroot] [RFCv2] Per-package out-of-tree build
In-Reply-To: <20130413205422.7eb87375@skate>
References: <20130413205422.7eb87375@skate>
Message-ID: <516ECEF2.70307@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 13/04/13 20:54, Thomas Petazzoni wrote:
>   * A <pkg>_SUPPORTS_OUT_OF_TREE variable defines whether the package
>     supports out of tree build or not. By default, it's set to NO, in
>     which case the package source code is rsynced from its source
>     directory to the build directory at the beginning of the configure
>     step. It is set to YES by both the autotools and cmake package
>     infrastructures (which have been modified to do out of tree build),
>     and by some packages that use the generic infrastructure but
>     nonetheless support out of tree build.

  It may have been discussed before, but wouldn't it be more convenient 
to insert an extra rsync step explicitly? Similar to how it's currently 
done for OVERRIDE_SRCDIR.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
