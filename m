From: Cam Mannett <camden.mannett@protonmail.ch>
Date: Fri, 24 Feb 2017 12:52:16 -0500
Subject: [Buildroot] [PATCH 1/2] pru-software-support: bump version to
	v5.1.0
In-Reply-To: <d7700b0f-d96b-9d38-4d74-4aecc0e4b041@mind.be>
References: <v876CxL3ex-BtugJbekKoJbWXsHAngjnGCZdxMw6pmIrZrJdYmCOp5gWgjmDazOIanKjZhCok9Zp5GHyXXCWYD_ZfU89WjpVHISmaVUnD60=@protonmail.ch>
 <d7700b0f-d96b-9d38-4d74-4aecc0e4b041@mind.be>
Message-ID: <IHfmit0N2T4Hv_e2FNdpRv4CDWbZDLBiK16FsK3EcXQgp9tU_u6JqkZIZ5rlj4obcHNqbQfFS31J8gGPuJASGb-i8FmIPLg3pNVm2X3UiNE=@protonmail.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

I'll resend using git send-email. Why are tarballs preferred over a git clone? I removed the hash file as I thought that it wasn't necessary when using a git source - is that incorrect?

Also I'm having difficulty with the tarball, when Gitorius packages the tarball it does not provide a file extension, which must confuse buildroot as it treats the tarball as uncompressed (it is really a tar.gz) and so the extraction stage fails. Is there a way renaming the downloaded file before the extraction stage, or is there a better way of solving this?

Thanks





-------- Original Message --------
Subject: Re: [Buildroot] [PATCH 1/2] pru-software-support: bump version to v5.1.0
Local Time: February 24, 2017 5:20 PM
UTC Time: February 24, 2017 5:20 PM
From: arnout@mind.be
To: Cam Mannett <camden.mannett@protonmail.ch>, buildroot at busybox.net <buildroot@busybox.net>

Hi Cam,

Please use git send-email to send patches - your mailer has removed the
whitespace, so it is no longer a valid patch.

On 24-02-17 17:36, Cam Mannett wrote:
> Signed-off-by: Camden Mannett <camden.mannett@protonmail.ch>
> ---
> package/pru-software-support/pru-software-support.hash | 2 --
> package/pru-software-support/pru-software-support.mk | 4 ++--
> 2 files changed, 2 insertions(+), 4 deletions(-)
> delete mode 100644 package/pru-software-support/pru-software-support.hash
>
> diff --git a/package/pru-software-support/pru-software-support.hash
> b/package/pru-software-support/pru-software-support.hash
> deleted file mode 100644
> index 8f624da..0000000
> --- a/package/pru-software-support/pru-software-support.hash
> +++ /dev/null
> @@ -1,2 +0,0 @@
> -# Locally-calculated hash
> -sha256 b257535ca9b1641d1a238795f3c7004064c573a91cf4a1fa566e3f7c2360c38f
> pru-software-support-804b548e69ef9fdf44445f6d0968d81cb8a1e7b4.tar.gz

Don't remove the hash file. Instead, calculate the new hash and replace it.

> diff --git a/package/pru-software-support/pru-software-support.mk
> b/package/pru-software-support/pru-software-support.mk
> index 06983c2..412abdb 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,10 +4,10 @@
> #
> ################################################################################
>
> -PRU_SOFTWARE_SUPPORT_VERSION = 804b548e69ef9fdf44445f6d0968d81cb8a1e7b4
> +PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
> PRU_SOFTWARE_SUPPORT_SITE =
> git://git.ti.com/pru-software-support-package/pru-software-support-package.git

Is there by any chance a release tarball that can be downloaded, rather than
doing a git clone? That would be convenient...

Regards,
Arnout

> PRU_SOFTWARE_SUPPORT_LICENSE = BSD-3c, GPLv2, Public Domain
> -PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v4.0-Manifest.html
> +PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
> PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
> HOST_PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru
>
> --
> 2.9.3
>
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

--
Arnout Vandecappelle arnout at mind be
Senior Embedded Software Architect +32-16-286500
Essensium/Mind http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint: 7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20170224/a41f9dbf/attachment.html>
