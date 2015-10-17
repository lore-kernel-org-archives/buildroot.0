From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 17 Oct 2015 20:16:49 +0200
Subject: [Buildroot] [PATCH v3 1/1] package/ffmpeg: Add support for
 GnuTLS
In-Reply-To: <1445100748-1803-1-git-send-email-bernd.kuhls@t-online.de>
References: <1445100748-1803-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <20151017201649.34c10c8d@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Bernd Kuhls,

On Sat, 17 Oct 2015 18:52:28 +0200, Bernd Kuhls wrote:
> Besides OpenSSL ffmpeg also supports GnuTLS.
> 
> If both GnuTLS and OpenSSL are enabled, the former takes precedence over
> the latter:
> http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=7f9fed31a491ed0991aee2d354dba82e54e3291e;hb=refs/heads/release/2.8#l2719
> 
> Introduce a Kconfig choice option to let the user decide which SSL
> library ffmpeg should use. This choice also shows the fact, that OpenSSL
> is incompatible with the GPL unless the nonfree option is enabled,
> instead of silently ignoring OpenSSL when BR2_PACKAGE_FFMPEG_GPL is
> enabled.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

To be honest, I don't think it's worth adding a Config.in choice here.
Just use Gnutls if available, or use OpenSSL if available, and that's
it. I believe it's sufficient, and more in line with how we handle the
other options in ffmpeg (by doing "automatic handling of
optional dependencies")

Best regards;

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
