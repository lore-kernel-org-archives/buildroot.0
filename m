From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 30 Mar 2019 11:19:39 +0100
Subject: [Buildroot] [RFC 0/1] Unify configuration for the GTK and WPE
 WebKit packages
Message-ID: <20190330101940.25868-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Adrian sent a first proposal about this topic, see http://lists.busybox.net/pipermail/buildroot/2019-February/243487.html

Discussion starts in http://lists.busybox.net/pipermail/buildroot/2019-February/243488.html

So, here, my minimalist alternative (but aligned with the Buildroot policy) :
the common part is limited to the variables BR2_PACKAGE_[WPE]WEBKIT[GTK]_ARCH_SUPPORTS[_JIT] in Config.in files

Francois Perrad (1):
  package/[wpe]webkit[gtk]: common config
    BR2_PACKAGE_WEBKIT_ARCH_SUPPORT[_JIT]

 package/midori/Config.in       |  4 ++--
 package/webkitgtk/Config.in    |  8 ++++----
 package/webkitgtk/webkitgtk.mk |  2 +-
 package/wpewebkit/Config.in    | 36 +++-------------------------------
 package/wpewebkit/wpewebkit.mk |  2 +-
 5 files changed, 11 insertions(+), 41 deletions(-)

-- 
2.17.1
