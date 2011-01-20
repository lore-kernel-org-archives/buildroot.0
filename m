From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 20 Jan 2011 09:53:36 +0100
Subject: [Buildroot] [PATCH 03/10] libmad: install pkgconfig file
In-Reply-To: <1295369680-24816-4-git-send-email-gustavo@zacarias.com.ar>
	(Gustavo Zacarias's message of "Tue, 18 Jan 2011 13:54:33 -0300")
References: <1295369680-24816-1-git-send-email-gustavo@zacarias.com.ar>
	<1295369680-24816-4-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <874o94dkhb.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> new file mode 100644
 Gustavo> index 0000000..d1b4801
 Gustavo> --- /dev/null
 Gustavo> +++ b/package/multimedia/libmad/mad.pc
 Gustavo> @@ -0,0 +1,11 @@
 Gustavo> +prefix=/usr
 Gustavo> +exec_prefix=${prefix}
 Gustavo> +libdir=${exec_prefix}/lib
 Gustavo> +includedir=${prefix}/include
 Gustavo> +
 Gustavo> +Name: mad
 Gustavo> +Description: MPEG Audio Decoder
 Gustavo> +Requires:
 Gustavo> +Version: 0.15.1b
 Gustavo> +Libs: -L${libdir} -lmad -lm

Do we really need -lm? It's not in mad.pc on my Debian machine, and I
don't see any use of math.h in libmad.

-- 
Bye, Peter Korsgaard
