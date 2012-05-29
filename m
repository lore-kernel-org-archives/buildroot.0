From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 29 May 2012 21:38:35 +0200
Subject: [Buildroot] [PATCH] quota: add package
In-Reply-To: <1337927625-18671-1-git-send-email-jarkko.sakkinen@intel.com>
References: <1337927625-18671-1-git-send-email-jarkko.sakkinen@intel.com>
Message-ID: <4FC525BB.2030803@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/25/12 08:33, Jarkko Sakkinen wrote:
[snip]
> +QUOTA_CONF_OPT = \
> +	--prefix=$(TARGET_DIR) \
> +	--exec-prefix=$(TARGET_DIR)

  Although this probably works, it's better to use /usr as prefix, and add
ROOTDIR=$(TARGET_DIR) to QUOTA_MAKE_OPT.  You may want to add the
--enable-rootsbin=yes configure option as well.

  Regards,
  Arnout

[snip]
-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
