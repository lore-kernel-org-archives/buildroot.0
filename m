From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 30 Dec 2015 14:58:44 +0100
Subject: [Buildroot] [PATCH v3] package/tpm-tools: fix build with locale
 support
In-Reply-To: <1451470250-27174-1-git-send-email-s.martin49@gmail.com>
References: <1451470250-27174-1-git-send-email-s.martin49@gmail.com>
Message-ID: <20151230145844.61ae1cf3@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Samuel,

On Wed, 30 Dec 2015 11:10:50 +0100, Samuel Martin wrote:
> tpm-tools needs to link with libintl when locale support is enabled.
> 
> However, tpm-tools' build-system internally builds a couple of static libraries
> used to build the final programs.
> When linking these libraries or the final programs, we need to explicitly tell
> the linker to link with libintl in order to resolve all the missing symbols.
> 
> Fixes:
>   http://autobuild.buildroot.org/results/560/56020558ec298ac4007bf7f6ce030b3f2fa1157d/
>   http://autobuild.buildroot.org/results/17f/17fc6ca79765fd9ecdacec4f5a2b58caa554d48d/
>   http://autobuild.buildroot.org/results/2d2/2d2c655429df62da2b8746a564fc064609e96001/
>   http://autobuild.buildroot.org/results/d52/d5259b83e7a269bca019d024366aa201f5a174fd/
>   http://autobuild.buildroot.org/results/11c/11cb0d1e51459e75e5f376cb07ce0188f8f050c4/
>   http://autobuild.buildroot.org/results/bad/bad9a97b4fff00732f2efb043bbb76a99963c491/
>   http://autobuild.buildroot.org/results/2f8/2f8bd534e6fcd9d356fe9087cb1394b9b2c4192c/
>   and many others...
> 
> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
> Cc: No? Rubinstein <nrubinstein@aldebaran.com>
> 
> ---
> changes v2->v3:
> - rework the patch to not alter LIBS values (ThomasP)

Applied, thanks. Thanks for submitting the patch upstream. Sadly, when
I see the activity on the mailing list, I don't have a serious hope of
seeing your patch merged anytime soon :-/

Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
