From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Wed, 16 Apr 2014 10:31:27 +0200
Subject: [Buildroot] legal-info: which version to show in manifest for
 modified packages?
In-Reply-To: <CAAXf6LWqZeuCLB3kZK-pzYh1JqY8OMmG68wFcUN9rYqRiNu69g@mail.gmail.com>
References: <CAAXf6LWqZeuCLB3kZK-pzYh1JqY8OMmG68wFcUN9rYqRiNu69g@mail.gmail.com>
Message-ID: <534E3FDF.6090107@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

Thomas De Schampheleire wrote:
> Hi,
>
> I'm pondering on the following: which 'version' should we show in the
> legal-info manifest for packages that have been modified for the
> project and are using a version-controlled source?
>
> For example, the linux and uboot packages allow to specify a custom
> version and custom location of the sources. In a given project, the
> version could be the git/hg/... revision of the repository containing
> these modified sources of linux/uboot/...
>
> When running 'make legal-info', these revision hashes would be stored
> in the manifest.csv file, but these numbers are meaningless outside of
> the project.

Not necessarily. They may be commits of a public repo, e.g.:

$ grep UBOOT_CUSTOM configs/cubieboard2_defconfig
BR2_TARGET_UBOOT_CUSTOM_GIT=y
BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux-sunxi/u-boot-sunxi.git"
BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="b4bca5e0651b460a4511582f07a935cb48f74948"
$

>
> Aside from the technical complications to integrate this in buildroot,
> would it instead be better to put the upstream version in the
> manifest, being the base version used to make the modifications on?

I don't think so.

First, if the manifest reports an upstream version, say "3.13.6", one
would think the target ships Linux version 3.13.6, unmodified. This
would be plain false.

Second, we would need a way to detect whether the VCS repository is
public or not (see example above). But I don't think this is feasible
in a reliable way.

Third, extracting the "upstream" version would be not straightforward.

-- 
Luca
