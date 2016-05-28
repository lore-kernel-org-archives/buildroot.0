From: Christian Stewart <christian@paral.in>
Date: Sat, 28 May 2016 12:46:18 -0700
Subject: [Buildroot] [PATCH v5 3/3] docker-engine: new package
In-Reply-To: <1464464553-17764-4-git-send-email-christian@paral.in>
References: <1464464553-17764-1-git-send-email-christian@paral.in>
 <1464464553-17764-4-git-send-email-christian@paral.in>
Message-ID: <CA+h8R2rrTa-AEQ4uFih-R47CZ=okQP4+jYaR3XVkTdUvn2yfgg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sat, May 28, 2016 at 12:42 PM, Christian Stewart <christian@paral.in>
wrote:
>
> +comment "docker-engine needs a toolchain w/ threads"
> +       depends on !BR2_TOOLCHAIN_HAS_THREADS
>

Despite reviewing this several times before submitting, it's just occurred
to me I forgot to put the HOST_GO_ARCH_SUPPORTS line on this package. I did
include it in the previous few.

Here's how this *should* look:

+comment "docker-engine needs a toolchain w/ threads"
+       depends on BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS
+       depends on !BR2_TOOLCHAIN_HAS_THREADS

Apologies, hopefully this is something you can touch up without needing a
respin.

Best,
Christian
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20160528/72c05aca/attachment.html>
