From: Hamish Moffatt <hamish@cloud.net.au>
Date: Wed, 2 Apr 2008 11:22:58 +1100
Subject: [Buildroot] [PATCH] Update lighttpd package
In-Reply-To: <DA636050-A5F5-4DA6-9D61-8B2C1FD153FE@valka.is>
References: <DA636050-A5F5-4DA6-9D61-8B2C1FD153FE@valka.is>
Message-ID: <20080402002258.GD4616@cloud.net.au>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Apr 01, 2008 at 11:58:27PM +0000, Arnar Mar Sig wrote:
> This patch bumps lighttpd up to version 1.4.19 and adds the option to  
> compile with pcre support to enable mod_rewrite. Tested on AVR32

Your patch is badly damaged by word-wrap. Can you resend?

> +--- lighttpd-1.4.19-org/configure	2008-03-10 21:46:12.000000000 +0000
> ++++ lighttpd-1.4.19/configure	2008-03-31 06:58:41.000000000 +0000
> +@@ -23971,7 +23971,7 @@
> + { echo "$as_me:$LINENO: result: $WITH_PCRE" >&5
> + echo "${ECHO_T}$WITH_PCRE" >&6; }
> +
> +-if test "x$cross_compiling" = xno -a "$WITH_PCRE" != "no"; then
> ++if test "$WITH_PCRE" != "no"; then
> +   # Extract the first word of "pcre-config", so it can be a program  
> name with args.
> + set dummy pcre-config; ac_word=$2
> + { echo "$as_me:$LINENO: checking for $ac_word" >&5

Patching configure scripts directly is a bit of a hack. Can you edit
configure.in/.ac and run $(AUTORECONF) instead?


Hamish
-- 
Hamish Moffatt VK3SB <hamish@debian.org> <hamish@cloud.net.au>
