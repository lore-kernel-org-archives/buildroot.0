From: Peter Korsgaard <jacmet@uclibc.org>
Date: Mon, 11 Jun 2012 22:36:01 +0200
Subject: [Buildroot] [PATCH 02/10] libcurl: fix up prefix in curl-config
In-Reply-To: <9f69097a418b6d560a5b36463bdf6f02dd8c9c90.1338653505.git.thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Sat, 2 Jun 2012 18:13:52 +0200")
References: <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <cover.1338653505.git.thomas.petazzoni@free-electrons.com>
 <9f69097a418b6d560a5b36463bdf6f02dd8c9c90.1338653505.git.thomas.petazzoni@free-electrons.com>
Message-ID: <87sje1egcu.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> While most packages that rely on libcurl use pkg-config, a few
 Thomas> packages (such as libxmlrpc) still use curl-config. So we need to fix
 Thomas> up the prefix locations in the curl-config script installed in
 Thomas> STAGING_DIR.

 Thomas> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
 Thomas> ---
 Thomas>  package/libcurl/libcurl.mk |    6 ++++++
 Thomas>  1 file changed, 6 insertions(+)

 Thomas> diff --git a/package/libcurl/libcurl.mk b/package/libcurl/libcurl.mk
 Thomas> index e8f13bb..e43ff0f 100644
 Thomas> --- a/package/libcurl/libcurl.mk
 Thomas> +++ b/package/libcurl/libcurl.mk
 Thomas> @@ -30,6 +30,12 @@ endef
 
 Thomas>  LIBCURL_POST_INSTALL_TARGET_HOOKS += LIBCURL_TARGET_CLEANUP
 
 Thomas> +define LIBCURL_STAGING_FIXUP_CURL_CONFIG
 Thomas> +	$(SED) "s,prefix=,prefix=$(STAGING_DIR)," $(STAGING_DIR)/usr/bin/curl-config

For the other -config scripts we only replace if we match prefix=/usr to
ensure things don't get screwed up if this step is ever ran more than
once, so I fixed that - Committed, thanks.

-- 
Bye, Peter Korsgaard
