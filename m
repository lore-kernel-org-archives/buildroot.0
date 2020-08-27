From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 27 Aug 2020 23:11:02 +0200
Subject: [Buildroot] [PATCH 1/1] package/openjpeg: fix CVE-2020-15389
In-Reply-To: <20200827204012.146472-1-fontaine.fabrice@gmail.com>
References: <20200827204012.146472-1-fontaine.fabrice@gmail.com>
Message-ID: <20200827231102.1e0aad9c@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, 27 Aug 2020 22:40:12 +0200
Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:

> Fix CVE-2020-15389: jp2/opj_decompress.c in OpenJPEG through 2.3.1 has a
> use-after-free that can be triggered if there is a mix of valid and
> invalid files in a directory operated on by the decompressor. Triggering
> a double-free may also be possible. This is related to calling
> opj_image_destroy twice.
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  ...on-input-directory-with-mix-of-valid.patch | 43 +++++++++++++++++++
>  1 file changed, 43 insertions(+)
>  create mode 100644 package/openjpeg/0008-opj_decompress-fix-double-free-on-input-directory-with-mix-of-valid.patch

Applied to master, thanks.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
