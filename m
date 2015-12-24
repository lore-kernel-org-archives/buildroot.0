From: Baruch Siach <baruch@tkos.co.il>
Date: Thu, 24 Dec 2015 14:04:39 +0200
Subject: [Buildroot] [PATCHv2] package/connman: cleanup backtrace patch
In-Reply-To: <1450957909-28085-1-git-send-email-yann.morin.1998@free.fr>
References: <1450957909-28085-1-git-send-email-yann.morin.1998@free.fr>
Message-ID: <20151224120439.GP1548@tarshish>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Yann,

On Thu, Dec 24, 2015 at 12:51:49PM +0100, Yann E. MORIN wrote:
> +@@ -112,6 +114,7 @@ void connman_debug(const char *format, ...)
> + 
> + static void print_backtrace(unsigned int offset)
> + {
> ++#if defined(HAVE_EXECINFO_H)
> + 	void *frames[99];
> + 	size_t n_ptrs;
> + 	unsigned int i;
> +@@ -210,6 +213,7 @@ static void print_backtrace(unsigned int offset)
> + 
> + 	close(outfd[1]);
> + 	close(infd[0]);
> ++#endif /* HAVE_BACKTRACE */

The comment is wrong now.

baruch

-- 
     http://baruch.siach.name/blog/                  ~. .~   Tk Open Systems
=}------------------------------------------------ooO--U--Ooo------------{=
   - baruch at tkos.co.il - tel: +972.2.679.5364, http://www.tkos.co.il -
