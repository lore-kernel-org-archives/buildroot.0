From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 4 Feb 2020 23:19:56 +0100
Subject: [Buildroot] [PATCH] package/vorbis-tools: add upstream security
 fixes for CVE-2014-96{38, 39, 40}
In-Reply-To: <20200204151819.22175-1-peter@korsgaard.com>
References: <20200204151819.22175-1-peter@korsgaard.com>
Message-ID: <20200204231956.43d1dd8e@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue,  4 Feb 2020 16:18:19 +0100
Peter Korsgaard <peter@korsgaard.com> wrote:

> Fixes the following security vulnerabilities:
> 
> - CVE-2014-9638: oggenc in vorbis-tools 1.4.0 allows remote attackers to
>   cause a denial of service (divide-by-zero error and crash) via a WAV file
>   with the number of channels set to zero.
> 
> - CVE-2014-9639: Integer overflow in oggenc in vorbis-tools 1.4.0 allows
>   remote attackers to cause a denial of service (crash) via a crafted number
>   of channels in a WAV file, which triggers an out-of-bounds memory access.
> 
> - CVE-2014-9640: oggenc/oggenc.c in vorbis-tools 1.4.0 allows remote
>   attackers to cause a denial of service (out-of-bounds read) via a crafted
>   raw file.
> 
> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
>  ...count-of-channels-in-the-header-CVE-.patch | 88 +++++++++++++++++++
>  ...-on-raw-file-close-reported-by-Hanno.patch | 55 ++++++++++++
>  2 files changed, 143 insertions(+)
>  create mode 100644 package/vorbis-tools/0002-oggenc-validate-count-of-channels-in-the-header-CVE-.patch
>  create mode 100644 package/vorbis-tools/0003-oggenc-fix-crash-on-raw-file-close-reported-by-Hanno.patch

Applied to master, thanks. Glad to see that the CVE tooling is useful :-)

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
