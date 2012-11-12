From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 22:06:07 +0100
Subject: [Buildroot] mesa3d:  "ImportError: No module named libxml2"
In-Reply-To: <50A0E402.1050805@carallon.com>
References: <1531E53627F1F749B4FE809BF2A4EB6703A24FFD@wetmex10>
 <509DB31C.90903@mind.be> <1531E53627F1F749B4FE809BF2A4EB6703AA459A@wetmex10>
 <50A0E402.1050805@carallon.com>
Message-ID: <50A164BF.7080603@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/12/12 12:56, Will Wagner wrote:
> I ported newer X11 to buildroot a while back a posted a link to the repository. At the time the only comment I got was
> from Thomas about the requirement for python/libxml2 which he hated then as well :)
>
> I patched it so that it conditionally build host-libxml2 with the reuqired support if mesa3d was selected. My patch for
> this is at https://gitorious.org/willw-buildroot/willw-buildroot/commit/421b4fd572869b22de11a0f0fad161e284c41bcc
>
> If we want newer mesa3d support I think we are going to have to come up with some suitable solution for this.

  Yes, and your patch looks in pretty good shape already.  I would make
BR2_PACKAGE_HOST_LIBXML2_PYTHON a blind option (i.e. remove the string after
bool).  I'd also remove the dependency on BR2_PACKAGE_LIBXML2 (in fact,
mesa3d doesn't require libxml2).  And I'd keep the --without-debug.  But
otherwise the patch looks good :-)

  Care to post it to the list, followed by a mesa3d patch that uses it?

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
