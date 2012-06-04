From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 05 Jun 2012 01:38:12 +0200
Subject: [Buildroot] [PATCH] New package: cJSON
In-Reply-To: <1338432637-10766-1-git-send-email-danomimanchego123@gmail.com>
References: <1338432637-10766-1-git-send-email-danomimanchego123@gmail.com>
Message-ID: <4FCD46E4.9020102@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 05/31/12 04:50, Danomi Manchego wrote:
> Signed-off-by: Danomi Manchego<danomimanchego123@gmail.com>
[snip]
> +CJSON_VERSION         = undefined
> +CJSON_SOURCE          = cJSONFiles.zip
> +CJSON_SITE            = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/project/cjson/
> +CJSON_INSTALL_STAGING = YES
> +CJSON_INSTALL_TARGET  = YES

  INSTALL_TARGET = YES is the default so that line can be removed.

> +
> +CJSON_ARCHIVE_DIR = cJSON

  I don't really think it's useful to define this as a variable; it doesn't make
the commands below more readable.

> +
> +define CJSON_EXTRACT_CMDS
> +	unzip -o -q -d $(@D) $(DL_DIR)/$(CJSON_SOURCE)

  We don't use the -o and -q options in the other packages using zip.

  Otherwise, looks good.

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
