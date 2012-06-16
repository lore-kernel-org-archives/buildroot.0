From: Peter Korsgaard <jacmet@uclibc.org>
Date: Sat, 16 Jun 2012 22:35:38 +0200
Subject: [Buildroot] [PATCH] fbv: Allow selection of supported image
	formats.
In-Reply-To: <1339747818-5118-1-git-send-email-arnerro@gmail.com> (Arn R.'s
 message of "Fri, 15 Jun 2012 18:10:18 +1000")
References: <1339747818-5118-1-git-send-email-arnerro@gmail.com>
Message-ID: <87ehpfgfl1.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arn" == Arn R <arnerro@gmail.com> writes:

 Arn> This removes fbv's compulsory dependency on either libpng and/or
 Arn> libjpeg and/or libungif.  The user can choose which compressed
 Arn> image format's fbv should support.  By default PNG, JPEG and GIF
 Arn> are selected.  Note that BMP format support will still always be
 Arn> included.

..
 
 Arn>  #fbv donesn't support cross-compilation
 Arn>  define FBV_CONFIGURE_CMDS
 Arn> @@ -17,6 +34,7 @@ define FBV_CONFIGURE_CMDS
 Arn>  		./configure \
 Arn>  		--prefix=/usr \
 Arn>  		--libs="-lz -lm" \
 Arn> +		$(FBV_CONFIGURE_OPTS) \

This would fail because of the --libs line if PNG (which pulls in zlib)
wasn't enabled. Looking closer at it, it doesn't seem to be needed, so I
removed that line and committed, thanks.

-- 
Bye, Peter Korsgaard
