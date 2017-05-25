From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 25 May 2017 15:37:36 +0200
Subject: [Buildroot] [PATCH/next v2] package/bootstrap: bump version to
 3.3.7
In-Reply-To: <20170524153239.8485-1-bernd.kuhls@t-online.de>
References: <20170524153239.8485-1-bernd.kuhls@t-online.de>
Message-ID: <20170525153736.70c3f420@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 24 May 2017 17:32:39 +0200, Bernd Kuhls wrote:

>  define BOOTSTRAP_EXTRACT_CMDS
>  	$(UNZIP) $(DL_DIR)/$(BOOTSTRAP_SOURCE) -d $(@D)
> +	mv $(@D)/bootstrap-$(BOOTSTRAP_VERSION)-dist $(@D)/dist

This still wasn't what I wanted to see. I wanted you to drop this
useless dist/ sub-directory, so that output/build/bootstrap-<version>/
directly has the bootstrap source code, with no silly sub-directory. So
I've fixed up EXTRACT_CMDS and INSTALL_TARGET_CMDS and applied to next.

See:

  https://git.buildroot.org/buildroot/commit/?h=next&id=cc7e8828729441393c3e825500094ac2fbf54694

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
