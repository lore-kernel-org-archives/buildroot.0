From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 28 Aug 2013 00:17:34 +0200
Subject: [Buildroot] [PATCH] minidlna: Fix automagic dependency to
	libiconv
In-Reply-To: <1377278794-16469-1-git-send-email-markos.chandras@imgtec.com>
 (Markos Chandras's message of "Fri, 23 Aug 2013 18:26:34 +0100")
References: <1377278794-16469-1-git-send-email-markos.chandras@imgtec.com>
Message-ID: <877gf6ixs1.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Markos" == Markos Chandras <markos.chandras@imgtec.com> writes:

 Markos> minidlna will detect and use the libiconv library if
 Markos> the package is selected. In that case, we need to link
 Markos> against -liconv.

 Markos> Fixes the following linking problem:

 Markos> taguitils/tagutils.o: In function `do_iconv.constprop.6':
 Markos> tagutils.c:(.text+0x4d5c): undefined reference to `libiconv_open'
 Markos> tagutils.c:(.text+0x4da0): undefined reference to `libiconv'
 Markos> tagutils.c:(.text+0x4e08): undefined reference to `libiconv_close'

 Markos> Signed-off-by: Markos Chandras <markos.chandras@imgtec.com>

 Markos> ---
 Markos>  package/minidlna/minidlna.mk | 11 ++++++++++-
 Markos>  1 file changed, 10 insertions(+), 1 deletion(-)

 Markos> diff --git a/package/minidlna/minidlna.mk b/package/minidlna/minidlna.mk
 Markos> index 10e3b33..e1a56ef 100644
 Markos> --- a/package/minidlna/minidlna.mk
 Markos> +++ b/package/minidlna/minidlna.mk
 Markos> @@ -19,12 +19,21 @@ MINIDLNA_CFLAGS=$(TARGET_CFLAGS) \
 Markos>  	-I"$(STAGING_DIR)/usr/include/libavcodec" \
 Markos>  	-I"$(STAGING_DIR)/usr/include/libavformat"
 
 Markos> +MINIDLNA_COMMON_LIBS=-lpthread -lexif -ljpeg -lsqlite3 -lavformat -lavutil -lavcodec -lid3tag -lFLAC -logg -lvorbis

We normally add a space around '=' and wrap long lines.

Committed with that fixed, thanks.

-- 
Bye, Peter Korsgaard
