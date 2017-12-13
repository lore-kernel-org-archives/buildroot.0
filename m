From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Dec 2017 08:20:04 +0100
Subject: [Buildroot] [PATCH 1/1] package/vlc: security bump to version
 2.2.8
In-Reply-To: <20171212175414.28267-1-bernd.kuhls@t-online.de>
References: <20171212175414.28267-1-bernd.kuhls@t-online.de>
Message-ID: <20171213082004.415441de@windsurf.png.is.keysight.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 12 Dec 2017 18:54:14 +0100, Bernd Kuhls wrote:
> Version 2.2.7 fixes CVE-2017-10699
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commitdiff;h=0de56d69ff06afceb5b16721ea5965a676b938b9
> 
> Removed patches applied upstream:
> 0013-codec-avcodec-check-avcodec-visible-sizes.patch
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commitdiff;h=6cc73bcad19da2cd2e95671173f2e0d203a57e9b
> 
> 0014-decoder-check-visible-size-when-creating-buffer.patch
> http://git.videolan.org/?p=vlc/vlc-2.2.git;a=commitdiff;h=a38a85db58c569cc592d9380cc07096757ef3d49
> 
> Added all hashes provided by upstream, added license hashes.
> 
> Switched _SITE to https.
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
> ---
>  ...codec-avcodec-check-avcodec-visible-sizes.patch | 33 ----------------------
>  ...r-check-visible-size-when-creating-buffer.patch | 33 ----------------------
>  package/vlc/vlc.hash                               | 10 +++++--
>  package/vlc/vlc.mk                                 |  4 +--
>  4 files changed, 10 insertions(+), 70 deletions(-)
>  delete mode 100644 package/vlc/0013-codec-avcodec-check-avcodec-visible-sizes.patch
>  delete mode 100644 package/vlc/0014-decoder-check-visible-size-when-creating-buffer.patch

I've applied to master. However, since 2.2.7 is the one fixing the
security issue, it might have been nicer to provide a patch bumping to
2.2.7, which we can backport to the LTS branch, and then another patch
to bump to 2.2.8. I'll let Peter comment on that.

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
