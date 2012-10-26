From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 26 Oct 2012 13:13:41 +0200
Subject: [Buildroot] [PATCH v2] lcdapi: new package
In-Reply-To: <1351166671-16726-1-git-send-email-spdawson@gmail.com>
References: <1351166671-16726-1-git-send-email-spdawson@gmail.com>
Message-ID: <508A7065.8030304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 25/10/12 14:04, spdawson at gmail.com wrote:
> From: Simon Dawson<spdawson@gmail.com>
>
> Signed-off-by: Simon Dawson<spdawson@gmail.com>
[snip]
> diff --git a/package/lcdapi/lcdapi.mk b/package/lcdapi/lcdapi.mk
> new file mode 100644
> index 0000000..3b5aaa3
> --- /dev/null
> +++ b/package/lcdapi/lcdapi.mk
> @@ -0,0 +1,41 @@
> +#############################################################
> +#
> +# lcdapi
> +#
> +#############################################################
> +LCDAPI_VERSION = 27e16c37a39c7fab2cf2e912795a730c0e92bcf1
> +LCDAPI_SITE = git://github.com/spdawson/lcdapi.git

  From docs/manual/manual.txt:

How to add package from github
------------------------------

If the package has no release version, or its version cannot be
identified using tag, then the sha1 of the particular commit should be
used to identify the version (the first 7 characters of the sha1 are
enough):

------------------------
FOO_VERSION = 1234567
FOO_SITE = http://github.com/<user>/<package>/tarball/<branch>
------------------------

If the package version matches a tag, then this tag should be used to
identify the version:

------------------------
FOO_VERSION = v1.0
FOO_SITE = http://github.com/<user>/<package>/tarball/$(FOO_VERSION)
------------------------


  Maybe you can just create a tag?

  Regards,
  Arnout

[snip]

-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
