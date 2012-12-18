From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Dec 2012 09:29:36 +0100
Subject: [Buildroot] [PATCH] libglib2: fix g_print()
In-Reply-To: <1355774740-28679-1-git-send-email-benoit.thebaudeau@advansee.com>
References: <1355774740-28679-1-git-send-email-benoit.thebaudeau@advansee.com>
Message-ID: <50D02970.7050408@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/12/12 21:05, Beno?t Th?baudeau wrote:
> If GLib is cross-compiled, the default printf settings that it selects are wrong
> for glibc. This leads to issues with the g_print() functions, e.g. "Aborted"
> errors returned by gst-inspect.
>
> This patch fixes this issue by setting printf configuration options compatible
> with glibc. These options should also be compatible with uClibc.
>
> This solution has been suggested for LTIB by Rogerio Nunes:
> https://community.freescale.com/thread/302734
>
> Signed-off-by: Beno?t Th?baudeau<benoit.thebaudeau@advansee.com>

Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
  (fixes our aborts when doing gst-inspect on an i.MX6 platform)

  Regards,
  Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
