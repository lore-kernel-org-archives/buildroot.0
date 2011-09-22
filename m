From: Arnout Vandecappelle <arnout@mind.be>
Date: Thu, 22 Sep 2011 19:20:36 +0200
Subject: [Buildroot] [PATCH] barebox: add support for custom version,
	tarball, git and patch dir
In-Reply-To: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
References: <1316290988-25108-1-git-send-email-plagnioj@jcrosoft.com>
Message-ID: <201109221920.37170.arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


On Saturday 17 September 2011 22:23:08, Jean-Christophe PLAGNIOL-VILLARD 
wrote:
> +config BR2_TARGET_BAREBOX_CUSTOM_PATCH_DIR
> +       string "custom patch dir"
> +       help
> +         If your board requires custom patches, add the path to the
> +         directory containing the patches here. The patches must be
> +         named barebox-<version>-<something>.patch.
> +
> +         Most users may leave this empty

 Do people often use buildroot this way?  I always make a project-specific 
branch of the buildroot tree and drop any patches directly in there.

 Not that it hurts to have the option of course :-)

 But if many people use buildroot this way, it would make total sense to try 
to implement overlays like openembedded does.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  31BB CF53 8660 6F88 345D  54CC A836 5879 20D7 CF43
