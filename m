From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 28 May 2013 22:11:56 +0200
Subject: [Buildroot] [PATCH 4/6] gutenprint: ensure target and host
 variant have the same patch hooks
In-Reply-To: <1369695664-5670-5-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1369695664-5670-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1369695664-5670-5-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <51A50F8C.3040304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/05/13 01:01, Thomas Petazzoni wrote:
> In the case of gutenprint, the patch hook executed for the target just
> creates one directory which is needed for autoreconf to work, and the
> host variant is not autoreconf'ed. So there is no harm in also
> applying this patch hook to the host variant.

  Since autoreconf is going to be done on the source tree, you should 
probably autoreconf the host variant as well.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
