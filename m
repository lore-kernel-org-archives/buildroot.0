From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 12 Nov 2012 00:11:14 +0100
Subject: [Buildroot] [PATCH 21/23] manual: add pkg-list.txt (generated
 list of available packages)
In-Reply-To: <1352639701-27829-22-git-send-email-s.martin49@gmail.com>
References: <1352639701-27829-1-git-send-email-s.martin49@gmail.com>
 <1352639701-27829-22-git-send-email-s.martin49@gmail.com>
Message-ID: <50A03092.3060809@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/11/12 14:14, Samuel Martin wrote:
> +Available packages
> +------------------
> +// docs/manaual/pkg-list.txt is generated using the following command:
> +// $ git grep -E '\((autotools|cmake|generic)-package\)' package/ |  \
> +//     cut -d':' -f1 | grep '\.mk$' | \
> +//     sed -e 's;.*\?/\(.*\?\).mk;* \1;' | \
> +//     sort>  docs/manual/pkg-list.txt
> +
> +include::pkg-list.txt[]

  Would it be possible to generate this list dynamically?  Saves us the trouble
of keeping it consistent manually.  It could be difficult to convince a2x to
look into the output directory for its include:: files, though.

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
