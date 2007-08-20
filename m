From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Mon, 20 Aug 2007 20:11:51 +0200
Subject: [Buildroot] [PATCH] Fix sed fail when building qtopia
In-Reply-To: <d6cda7730708201100l732f3131hc0eb086da6cb5ee2@mail.gmail.com>
References: <d6cda7730708201100l732f3131hc0eb086da6cb5ee2@mail.gmail.com>
Message-ID: <20070820181151.GR11697@aon.at>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Aug 20, 2007 at 07:00:17PM +0100, Thiago A. Corr?a wrote:
>Hi there,
>
>   This patch should fix the error:
>   sed: -e expression #1, char 21: unknown option to `s'
>
>   I am sure there is a better way to do this, but I'm not comfortable
>with shell scripts enough, so, if someone has a better solution, by
>all means :)

ergh, that's rather ugly.
Please try to use this instead and let me know if that works for you:
$(SED) 's,-O2,$(TARGET_CFLAGS),' \
$(QTOPIA4_TARGET_DIR)/mkspecs/qws/linux-$(BR2_PACKAGE_QTOPIA4_EMB_PLATFORM)-g++/qmake.conf

(i.e. use ',' instead if '/'.
