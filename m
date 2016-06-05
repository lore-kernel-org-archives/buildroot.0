From: Stanislas Bach <sbach@0g.re>
Date: Sun, 5 Jun 2016 15:54:58 -0700
Subject: [Buildroot] [PATCH] xserver_xorg-server: apply modesettings
 patch for 1.18.3 only
In-Reply-To: <87y46jl7ek.fsf@dell.be.48ers.dk>
References: <575344F8.2030103@0g.re> <87y46jl7ek.fsf@dell.be.48ers.dk>
Message-ID: <5754ADC2.4070209@0g.re>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Peter,

To give more details about this patch, I found the error while trying to 
configure/compile a root-filesystem for a Tegra2 platform:
When enabling BR2_PACKAGE_NVIDIA_TEGRA23, one must select 
BR2_PACKAGE_XSERVER_XORG_SERVER_VIDEODRV_ABI_14 causing the issue.

On 06/05/2016 01:14 PM, Peter Korsgaard wrote:
>>>>>> "Stanislas" == Stanislas Bach <sbach@0g.re> writes:
>
>   > We currently have two choices for the server's version (1.18.3, and 1.14.7)
>   > but the following patch will only apply for versions >= 1.17.2.
>
>   > If 1.14.7 is selected the build will fail with the following error:
>
>   > Applying 0001-modesettings-needs-dri2.patch using patch:
>   > patching file configure.ac
>   > Hunk #1 FAILED at 2036
>
>   > So move this patch to an appropriate version folder in the package's
>   > directory. It should be good enough until this package provides more
>   > versions >= 1.17.2.
>
>   > Signed-off-by: Stanislas Bach <sbach@0g.re>
>
>   > diff --git
>   > a/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
>   > b/package/x11r7/xserver_xorg-server/0001-modesettings-needs-dri2.patch
>
> Thanks! Your mailer unfortunately corrupted the patch so I couldn't
> apply this directly. It would also be helpful for reviews if you
> configure git to detect renames (git config --global diff.renames copy -
> Or simply upgrade your git version, as it is enabled by default
> nowadays).

Sorry, and thank you for the advice, I will be careful next time in 
order to ease your work.

> Committed with the patch fixed, thanks.

Thanks for accepting it!

-- 
Stanislas Bach
GPG / D0B7 1846 5B5F 224F AF81
