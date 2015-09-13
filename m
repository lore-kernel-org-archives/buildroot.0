From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Sep 2015 12:35:17 +0200
Subject: [Buildroot] [PATCH] perl: fix static build
In-Reply-To: <1442139982-29309-1-git-send-email-francois.perrad@gadz.org>
References: <1442139982-29309-1-git-send-email-francois.perrad@gadz.org>
Message-ID: <20150913123517.07275fa0@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Francois Perrad,

Thanks for this fix. See some comments below.

On Sun, 13 Sep 2015 12:26:22 +0200, Francois Perrad wrote:
> see http://autobuild.buildroot.net/results/502/502e6a6280451acc48e5f500e774b2bd04c7229e/
> 
> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> ---
>  package/perl/0001-hack-EUMM.patch | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>  create mode 100644 package/perl/0001-hack-EUMM.patch
> 
> diff --git a/package/perl/0001-hack-EUMM.patch b/package/perl/0001-hack-EUMM.patch
> new file mode 100644
> index 0000000..3d54f47
> --- /dev/null
> +++ b/package/perl/0001-hack-EUMM.patch
> @@ -0,0 +1,20 @@
> +hack EUMM 7.04_01 which comes with Perl 5.22.0
> +
> +with static lib build, we cannot call _find_magic_vstring(),
> +which does a `require B;` and B is not a pure Perl module.
> +

You should add your SoB line inside the patch as well.

Also, do you think this patch can be accepted upstream?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
