From: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>
Date: Wed, 20 Aug 2008 10:44:36 +0200
Subject: [Buildroot] [buildroot 0004674]: The Openchrome package is
 br0ken..
In-Reply-To: <74b075a6b3ba6c7ebcab73b3dd3328d4@bugs.uclibc.org>
References: <74b075a6b3ba6c7ebcab73b3dd3328d4@bugs.uclibc.org>
Message-ID: <20080820104436.48e270cc@atmel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 20 Aug 2008 01:37:42 -0700
bugs at busybox.net wrote:

<snipp>

> The openchrome package is broken. It needs, to do install instead of
> install-exec just like ALL the other xorg vidio drivers do, currently
> only extra libs are installed, not the actual graphics driver!
> 
> Index: openchrome.mk
> ===================================================================
> --- openchrome.mk       (revision 23102)
> +++ openchrome.mk       (working copy)
> @@ -11,5 +11,6 @@
> 
>  OPENCHROME_AUTORECONF = YES
>  OPENCHROME_CONF_OPT = --enable-shared --disable-static
> +OPENCHROME_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR)/usr install
> 

Hmm, the DESTDIR looks wrong, why /usr to the end? The /usr should be
part of the prefix when configured.

<snipp rest of bug report>

-- 
Best regards,
Hans-Christian Egtvedt
