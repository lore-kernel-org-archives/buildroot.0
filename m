From: Waldemar Brodkorb <wbx@openadk.org>
Date: Fri, 11 Sep 2015 13:40:16 +0200
Subject: [Buildroot] [PATCH v2 0/1] package/freeswitch: new package
In-Reply-To: <1441652820-5922-1-git-send-email-bernd.kuhls@t-online.de>
References: <1441652820-5922-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20150911114016.GX8475@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd,
Bernd Kuhls wrote,

> Hi,
> 
> this is v2 of the freeswitch patch. It should address all comments by
> Thomas (http://patchwork.ozlabs.org/patch/506197/).
> 
> Please note that compiling freeswitch is still broken with uClibc-NG:
> 
> make[7]: Entering directory '/home/br/br2_next/output/build/freeswitch-7cf1238137d8876a1a34d28a54d60d328c44d895/libs/spandsp/src'
> [...]
> awgn.c: In function 'awgn_init_dbov':
> awgn.c:110:5: error: void value not ignored as it ought to be
>      s->rms = pow(10.0, level/20.0)*32768.0;
> 

Could you try with this patch:
http://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/commit/?h=1.0

It allows to compile the code in awgn.c for me.
I don't know the reason why the change was made. Reverting the
commit makes the tgmath.h file matching GNU libc code.

best regards
 Waldemar
