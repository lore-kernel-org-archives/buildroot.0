From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 15 Oct 2012 15:16:04 +0200
Subject: [Buildroot] [PATCHv5 2/5] packages: switch to host-pkgconf
In-Reply-To: <1350302313-17344-1-git-send-email-gustavo@zacarias.com.ar>
 (Gustavo Zacarias's message of "Mon, 15 Oct 2012 08:58:33 -0300")
References: <1350302313-17344-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <87sj9fx4dn.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

Hi,

 Gustavo> Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>

Sorry, I haven't found time to review this in detail yet, but I noticed
this:

 Gustavo> +++ b/package/rrdtool/rrdtool.mk
 Gustavo> @@ -6,7 +6,7 @@
 
 Gustavo>  RRDTOOL_VERSION = 1.2.30
 Gustavo>  RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 Gustavo> -RRDTOOL_DEPENDENCIES = host-pkg-config freetype libart libpng zlib
 Gustavo> +RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib

There recently was a (misdirected) mail about rrdtool not working
correctly with pkgconf:

http://lists.freedesktop.org/archives/pkg-config/2012-October/000904.html

Is that an issue for us or does the STAGING_DIR prefix mean pkgconfig
never outputs nothing?

-- 
Bye, Peter Korsgaard
