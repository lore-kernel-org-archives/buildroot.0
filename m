From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 27 Oct 2015 23:48:56 +0100
Subject: [Buildroot] [PATCH 2/3] package/git: Add git patch for static
 compilation
In-Reply-To: <1445893962-13338-3-git-send-email-repk@triplefau.lt>
References: <1445893962-13338-1-git-send-email-repk@triplefau.lt>
 <1445893962-13338-3-git-send-email-repk@triplefau.lt>
Message-ID: <562FFF58.3090909@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26-10-15 22:12, Remi Pommarel wrote:
[snip]
> diff --git a/package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch b/package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch
> new file mode 100644
> index 0000000..e8dc367
> --- /dev/null
> +++ b/package/git/0003-configure.ac-detect-ssl-need-with-libcurl.patch
> @@ -0,0 +1,85 @@
> +From 7e91e8d73a757801c0604a03fd2f0fa8003e4ac0 Mon Sep 17 00:00:00 2001
> +From: Remi Pommarel <repk@triplefau.lt>
> +Date: Thu, 24 Sep 2015 21:14:00 +0200
> +Subject: [PATCH 3/3] configure.ac: detect ssl need with libcurl
> +
> +When libcurl has been statically compiled with openssl support they both
> +need to be linked in everytime libcurl is used.
> +
> +During configuration this can be detected by looking for Curl_ssl_init
> +function symbol in libcurl, which will only be present if libcurl has been
> +compiled statically built with openssl.
> +
> +configure.ac checks for Curl_ssl_init function in libcurl and if such function
> +exists; it sets NEEDS_SSL_WITH_CURL that is used by the Makefile to include
> +-lssl alongside with -lcurl.
> +
> +Signed-off-by: Remi Pommarel <repk@triplefau.lt>
> +Signed-off-by: Junio C Hamano <gitster@pobox.com>
> +---
> + configure.ac | 10 ++++++++++
> + 1 file changed, 10 insertions(+)
> +
> +diff -rup a/configure b/configure
> +--- a/configure 2015-10-26 20:33:23.829904205 +0100
> ++++ b/configure 2015-10-26 20:33:40.429904052 +0100

 We prefer the original patch to configure.ac and adding GIT_AUTORECONF = YES

[snip]


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
