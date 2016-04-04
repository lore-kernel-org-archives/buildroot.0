From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 5 Apr 2016 00:59:52 +0200
Subject: [Buildroot] [PATCH v4 4/7] barebox: introduce barebox-package
	function
In-Reply-To: <1458513351-6556-5-git-send-email-pieter@boesman.nl>
References: <1458513351-6556-1-git-send-email-pieter@boesman.nl>
 <1458513351-6556-5-git-send-email-pieter@boesman.nl>
Message-ID: <5702F1E8.90309@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/20/16 23:35, Pieter Smith wrote:
> No functional changes: Introduces a barebox-package function towards re-use by
> a 2nd config build.
>
> Because the function is meant to be called from within a $(eval), all instances
> of '$' has to be escaped. I.e. rename '$' -> '$$'.
>
> Signed-off-by: Pieter Smith<pieter@boesman.nl>

Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

  Checked that it is exactly the same except for the '$' -> '$$' replacement.


  However, I wonder if it wouldn't be better to hoist the parts that are really 
common (or only for barebox-1) out of the function. In particular, I'm thinking of:

- everything concerning BR2_TARGET_BAREBOX_BAREBOXENV, because that option 
doesn't exist for barebox-2 and it can be cleanly separated;

- the definition of BAREBOX_APPLY_CUSTOM_PATCHES, because there is only a single 
BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR;

- the definition of BAREBOX_ARCH and BAREBOX_MAKE_FLAGS, because they are not 
used by kconfig-package but only internally.


  I'm not entirely sure if it is better that way. Pieter, I leave it up to you 
to decide.


  Regards,
  Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
