From: Fatih =?utf-8?B?QcWfxLFjxLE=?= <fatih.asici@gmail.com>
Date: Sun, 02 Mar 2014 19:56:44 +0200
Subject: [Buildroot] [PATCH 1/1] Qt5: add qttools
In-Reply-To: <1392379162-17980-1-git-send-email-syntheticpp@gmx.net>
References: <1392379162-17980-1-git-send-email-syntheticpp@gmx.net>
Message-ID: <2803480.yum1HfIk7d@asici>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Friday 14 February 2014 12:59:22 Peter K?mmel wrote:
> +       cp -dpf $(STAGING_DIR)/usr/lib/libQt5Help.so.* $(TARGET_DIR)/usr/lib
> +       cp -dpf $(STAGING_DIR)/usr/lib/libQt5CLucene.so.*
> $(TARGET_DIR)/usr/lib

These libraries are not build if widgets module is not enabled or png support 
is disabled. sql and network libraries are also needed at runtime.

It would be better to provide an option under qt5tools which selects these 
dependencies. Libraries are installed only if this option is selected. This 
way, it will be possible to use host tools without having to enable gui 
module.
