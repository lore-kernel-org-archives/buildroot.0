From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 30 Nov 2012 10:15:27 +0100
Subject: [Buildroot] [PATCH] [PATCH][RFC] new target: live filesystem
In-Reply-To: <CAJJ6jxv6w=wq7taFt4rxXfSmjY7Vkd+m06_U+A9fz4z1eyFM_w@mail.gmail.com>
References: <1354003953-10875-1-git-send-email-jeremy.rosen@openwide.fr>
 <CAJJ6jxv6w=wq7taFt4rxXfSmjY7Vkd+m06_U+A9fz4z1eyFM_w@mail.gmail.com>
Message-ID: <50B8792F.7040000@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 30/11/12 01:04, Steve Calfee wrote:
> I don't understand why you need this. It is a one line "sudo tar -xf
> ..." to unpack the tarball into your nfs directory. Either type this
> line or add a one line script to your ~/bin directory to do it for
> each of your buildroot trees/environments. Don't add clutter to the
> buildroot makefile.

  If that is the reasoning, we can also remove the compression of the
.tar file, or the -dirclean targets, etc. etc.

  In addition, this target also cleans up the NFS directory first, so
it's slightly more than just untarring.

  Regards,
  Arnout
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
