From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 14 Jun 2012 01:27:05 +0200
Subject: [Buildroot] [PATCH 7/7] automatically set PARALLEL_JOBS when
 BR2_JLEVEL is 0
In-Reply-To: <1339466983-19786-8-git-send-email-ntl@pobox.com>
References: <1339466983-19786-1-git-send-email-ntl@pobox.com>
 <1339466983-19786-8-git-send-email-ntl@pobox.com>
Message-ID: <4FD921C9.4020302@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/12/12 04:09, Nathan Lynch wrote:
> When BR2_JLEVEL is 0, set PARALLEL_JOBS to the number of CPUs
> detected.  This allows one to more or less fully utilize the host
> system without manually tuning the configuration.

  In my experience, you need 2 times the number of CPUs to fully utilize
the processor because most compilations have long iowait latencies.

  Otherwise, looks good.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
