From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 21 Jun 2012 22:11:44 +0200
Subject: [Buildroot] [PATCH] sudo: fix install
In-Reply-To: <1340268304-26103-1-git-send-email-spdawson@gmail.com>
References: <1340268304-26103-1-git-send-email-spdawson@gmail.com>
Message-ID: <4FE38000.4000107@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/21/12 10:45, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Running sudo on the target fails with the following errors.
>
>    sudo: /usr/libexec/sudoers.so: No such file or directory
>    sudo: fatal error, unable to load plugins
>
> The problem is that the installation of the sudo package is broken. This patch
> replaces the hand-crafted install rule with the default AUTOTARGETS install.
>
> Unfortunately, the default install fails because it includes a step that
> invokes the cross-compiled visudo binary. A patch is provided here to disable
> this visudo invocation, which is for sanity checking only. This local patch is
> a backport of upstream commit 8209:0c4e3f68b2f5; the real fix will be in the
> 1.8.6 release of sudo.
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Nice work, Simon!  I especially like the very extensive comment in the
patch header.

  It's a pity that upstream decided to add the cross_compiling assignment to
all these Makefile.in where it isn't actually used, but that's their choice...


  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
