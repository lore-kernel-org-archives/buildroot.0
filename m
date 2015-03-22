From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 22 Mar 2015 16:19:18 +0100
Subject: [Buildroot] [PATCH 2/7] pkg-generic: fix the logic showing the
 "Downloading" message
In-Reply-To: <1425147313-17380-3-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1425147313-17380-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1425147313-17380-3-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <550EDD76.90600@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 28/02/15 19:15, Thomas Petazzoni wrote:
> Even though the .stamp_downloaded target is executed for each package
> being built, the pkg-generic tries to not display the "Downloading"
> message when there is in fact nothing to download.
> 
> Unfortunately, the logic was incorrect for the patch download: it
> forgot the fact that <pkg>_PATCH can contain either file names (in
> which case we assume the patch should be downloaded from <pkg>_SITE),
> or full URLs. The latter case was not properly handled, as we were
> checking if $(DL_DIR)/<full URL> existed, while we should be testing
> if $(DL_DIR)/`basename <full URL>` exists.
> 
> This patch fixes that, which makes sure the "Downloading" message is
> displayed only when necessary.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>


 Regards,
 Arnout

[snip]

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
