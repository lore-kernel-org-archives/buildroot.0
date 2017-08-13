From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 14 Aug 2017 01:28:58 +0200
Subject: [Buildroot] [PATCH] syslinux: Drop patch 0003,
 not needed after gnu-efi update
In-Reply-To: <1499073063-15005-1-git-send-email-benoit.allard@greenbone.net>
References: <1499073063-15005-1-git-send-email-benoit.allard@greenbone.net>
Message-ID: <314d6f8b-551b-172d-63f0-a65490baa00c@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Benoit,

On 03-07-17 11:11, Beno?t Allard wrote:
> Signed-off-by: Beno?t Allard <benoit.allard@greenbone.net>

 Is this patch really not needed anymore after the gnu-efi update? Isn't it
still needed for BIOS (and perhaps others as well, e.g. isolinux)? I'm looking
at the build failure of ts5x00_defconfig and it seems to point at this issue.
And indeed, reinstating this patch fixes the build failure.

[snip]
> -Fix for https://bugs.debian.org/846679: syslinux: FTBFS: ld:
> -ldlinux.elf: Not enough room for program headers, try linking with -N

 This is exactly the error we see.

 I sent a patch to revert this, could you check it?

 Regards,
 Arnout

[1] https://gitlab.com/arnout/buildroot/-/jobs/28979377

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
