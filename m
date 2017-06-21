From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Jun 2017 21:43:05 +0200
Subject: [Buildroot] [PATCH v2] barebox: support multiple image files
In-Reply-To: <20170621070353.16521-1-m.niestroj@grinn-global.com>
References: <20170621070353.16521-1-m.niestroj@grinn-global.com>
Message-ID: <20170621214305.6ae863f9@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Wed, 21 Jun 2017 09:03:53 +0200, Marcin Niestroj wrote:

>  define $(1)_INSTALL_IMAGES_CMDS
>  	if test -n "$$($(1)_IMAGE_FILE)"; then \

I've renamed this variable to $(1)_IMAGE_FILES, because it now contains
potentially multiple files.

Applied with this fixed.

BTW, it would be nice to provide a test case for this feature in our
testing infrastructure, see support/testing/. I think in the long run
we should require the addition of test cases when such features are
added.

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
