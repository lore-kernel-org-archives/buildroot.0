From: Roland Franke <fli4l@franke-prem.de>
Date: Sun, 28 Feb 2016 17:04:51 +0100
Subject: [Buildroot] [PATCH 1/1] package/libfuse: fix internal version
	number
In-Reply-To: <56D31823.4090500@mind.be>
References: <1456668330-14361-1-git-send-email-bernd.kuhls@t-online.de>
 <56D31823.4090500@mind.be>
Message-ID: <9FB730B69E3C4F439B9AB6E84257FFA0@ROLANDAMD64>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,
yes this patch will fix the version in the file for the installation as by 
the
sourch-code from original version 2.9.5 will install in the output with the
wrong version 2.9.4.
I also guess that i am have sign the patch regarding the given link.
And this is the first time that i am trying to do that by my self, so please
note that i am not complete knowing all the thinks what be need.

Best regards,
Roland Franke

-----Urspr?ngliche Nachricht----- 
From: Arnout Vandecappelle
Sent: Sunday, February 28, 2016 4:54 PM
To: Bernd Kuhls ; buildroot at buildroot.org
Cc: Roland Franke
Subject: Re: [Buildroot] [PATCH 1/1] package/libfuse: fix internal version 
number

On 02/28/16 15:05, Bernd Kuhls wrote:
> Upstream forgot to bump the internal version number to 2.9.5 during the
> last update. Roland Franke sent me an e-mail about it before posting
> to the buildroot mailinglist, in order to help the integration of this
> patch into buildroot I am sending this patch formatted by git.

All this explanation should have been below a --- because it doesn't belong 
in
the git history.

Also, this doesn't explain what the real problem is, something like:

This will generate a library with the wrong library name.

AFAIU this is anyway harmless, so I guess it can go into next.


> Signed-off-by: Roland Franke <fli4l@franke-prem.de>

Bernd, you can't just add someone else's Signed-off-by.

Roland, can you confirm that you sign off this patch (see [1])?

[1] http://developercertificate.org/


With all that:
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Regards,
Arnout

> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  .../libfuse/0002-fix-libfuse-versionsnumber.patch  | 33 
> ++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>  create mode 100644 package/libfuse/0002-fix-libfuse-versionsnumber.patch
>
> diff --git a/package/libfuse/0002-fix-libfuse-versionsnumber.patch 
> b/package/libfuse/0002-fix-libfuse-versionsnumber.patch
> new file mode 100644
> index 0000000..bbcb1e6
> --- /dev/null
> +++ b/package/libfuse/0002-fix-libfuse-versionsnumber.patch
> @@ -0,0 +1,33 @@
> +Fix version number of build files from libfuse to real version
> +
> +Bug was reported upstream: https://github.com/libfuse/libfuse/issues/10
> +and will be fixed with the next release:
> +https://github.com/libfuse/libfuse/issues/10#issuecomment-172380172
> +
> +Signed-off-by: Roland Franke <fli4l@franke-prem.de>
> +[original post: 
> http://lists.busybox.net/pipermail/buildroot/2016-February/154294.html]
> +Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> +[added links to upstream bug report]
> +
> +--- a/lib/Makefile.am
> ++++ b/lib/Makefile.am
> +@@ -37,7 +37,7 @@
> + $(iconv_source) \
> + $(mount_source)
> +
> +-libfuse_la_LDFLAGS = -pthread @libfuse_libs@ -version-number 2:9:4 \
> ++libfuse_la_LDFLAGS = -pthread @libfuse_libs@ -version-number 2:9:5 \
> + -Wl,--version-script,$(srcdir)/fuse_versionscript
> +
> + if NETBSD
> +--- a/lib/Makefile.in
> ++++ b/lib/Makefile.in
> +@@ -367,7 +367,7 @@
> + $(iconv_source) \
> + $(mount_source)
> +
> +-libfuse_la_LDFLAGS = -pthread @libfuse_libs@ -version-number 2:9:4 \
> ++libfuse_la_LDFLAGS = -pthread @libfuse_libs@ -version-number 2:9:5 \
> + -Wl,--version-script,$(srcdir)/fuse_versionscript
> +
> + @NETBSD_TRUE at libfuse_la_LIBADD = -lperfuse -lpuffs
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF 
