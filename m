From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 18 May 2012 10:44:58 +0200
Subject: [Buildroot] [PATCH 1/2] vala: do not append a -dirty suffix to
	the valac version number
In-Reply-To: <1337170229-29684-1-git-send-email-spdawson@gmail.com>
 (spdawson@gmail.com's message of "Wed, 16 May 2012 13:10:28 +0100")
References: <1337170229-29684-1-git-send-email-spdawson@gmail.com>
Message-ID: <87fwaxop2t.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "spdawson" == spdawson  <spdawson@gmail.com> writes:

 spdawson> From: Simon Dawson <spdawson@gmail.com>
 spdawson> Signed-off-by: Simon Dawson <spdawson@gmail.com>
 spdawson> ---
 spdawson>  package/vala/vala-fix-dirty-version-suffix.patch |   15 +++++++++++++++
 spdawson>  1 file changed, 15 insertions(+)
 spdawson>  create mode 100644 package/vala/vala-fix-dirty-version-suffix.patch

 spdawson> diff --git a/package/vala/vala-fix-dirty-version-suffix.patch b/package/vala/vala-fix-dirty-version-suffix.patch
 spdawson> new file mode 100644
 spdawson> index 0000000..4b0044d
 spdawson> --- /dev/null
 spdawson> +++ b/package/vala/vala-fix-dirty-version-suffix.patch
 spdawson> @@ -0,0 +1,15 @@
 spdawson> +Do not append a -dirty suffix to the valac version number. The presence of
 spdawson> +the suffix can caused problems for packages (e.g. midori) which check the
 spdawson> +valac version number during configuration.

Why is this needed? We don't apply any patches to vala, and I don't see
any "-dirty" suffix in valac --version:

./output/host/usr/bin/valac --version
Vala 0.15.2

-- 
Bye, Peter Korsgaard
