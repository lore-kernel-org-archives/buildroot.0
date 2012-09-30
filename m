From: Arnout Vandecappelle <arnout@mind.be>
Date: Sun, 30 Sep 2012 18:42:51 +0200
Subject: [Buildroot] [PATCH] refresh patch used to sync with upstream,
 suggested by Thomas Petazzoni
In-Reply-To: <20120920080220.GA5031@waldemar-brodkorb.de>
References: <20120920080220.GA5031@waldemar-brodkorb.de>
Message-ID: <5068768B.1000409@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 20/09/12 10:02, Waldemar Brodkorb wrote:
> Hi,
>
> update patch used to sync with upstream kconfig.
>
> Signed-off-by: Waldemar Brodkorb<mail@waldemar-brodkorb.de>

  This text (and the subject line) will be part of the commit message in
git - obviously it's not a very good commit message.  If you want to include
some message for the mailing list in the commit message, it should be below
---.  For instance, the following could be a good commit message:

Use a more portable syntax of mktemp.

mktemp on MacOS doesn't have a default template, so a template has to be given
explicitly.

Signed-off-by: Waldemar Brodkorb<mail@waldemar-brodkorb.de>
---
Refresh patch to sync with upstream kconfig, as suggested by Thomas Petazzoni

> ---
>   support/kconfig/patches/11-use-mktemp-for-lxdialog.patch | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
> index 21ca228..7a731c1 100644
> --- a/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
> +++ b/support/kconfig/patches/11-use-mktemp-for-lxdialog.patch
> @@ -11,7 +11,7 @@ Index: config/lxdialog/check-lxdialog.sh
>
>    # Temp file, try to clean up after us
>   -tmp=.lxdialog.tmp
> -+tmp=$(mktemp)
> ++tmp=$(mktemp -t yyy)

  GNU mktemp marks the -t option as deprecated, so it's still not portable :-)
Also, 'yyy' is not a very descriptive name.  So I'd propose to use:

mktemp ${TMPDIR}/lxdialog.XXXXXXXX


  Regards,
  Arnout

>    trap "rm -f $tmp" 0 1 2 3 15
>
>    # Check if we can link to ncurses


-- 
Arnout Vandecappelle                               arnout at mind be
Senior Embedded Software Architect                 +32-16-286540
Essensium/Mind                                     http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium                BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
