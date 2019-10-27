From: Heiko Thiery <Heiko.Thiery@kontron.com>
Date: Sun, 27 Oct 2019 08:43:25 +0000
Subject: [Buildroot] [PATCH] package/pru-software-support: remove 'v'
 prefix from github-fetched packages
In-Reply-To: <CANQCQpa4bfmxmGRqsvHKqRB5De9oPPAh8HGb5KBQLLbHnWGK2w@mail.gmail.com>
References: <20191027065116.16076-1-matthew.weber@rockwellcollins.com>
 <816a4158467746b9964c0b9ef46c20d2@kontron.com>,
 <CANQCQpa4bfmxmGRqsvHKqRB5De9oPPAh8HGb5KBQLLbHnWGK2w@mail.gmail.com>
Message-ID: <5EE797A9AEAFA1E8.af98fe18-3680-46d1-a536-d090d86abbd4@mail.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Take care. Not all need this change.

Holen Sie sich Outlook f?r Android<https://aka.ms/ghei36>



On Sun, Oct 27, 2019 at 9:18 AM +0100, "Matthew Weber" <matthew.weber at collins.com<mailto:matthew.weber@collins.com>> wrote:


Heiko,

On Sun, Oct 27, 2019 at 2:35 AM Heiko Thiery  wrote:
>
> Hi Matt,
>
> utils/test-pkg -k -p pru-software-support fails because of the wrong name in the hash file
>
> ERROR: No hash found for pru-software-support-5.1.0.tar.gz
> make: *** [package/pkg-generic.mk:146: /home/hthiery/br-test-pkg/br-arm-full/build/host-pru-software-support-5.1.0/.stamp_downloaded] Fehler 1
>

:)  missed the hash fixups...  I'll redo this series of 'v' fixup
patches and send a v2

>
> ________________________________
> From: Matt Weber
> Sent: Sunday, October 27, 2019 7:51:16 AM
> To: buildroot at buildroot.org
> Cc: Matt Weber; Heiko Thiery
> Subject: [PATCH] package/pru-software-support: remove 'v' prefix from github-fetched packages
>
> Fixes version parsing for release-monitoring.org support.
>
> Cc: Heiko Thiery
> Signed-off-by: Matthew Weber
> ---
>  package/pru-software-support/pru-software-support.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/package/pru-software-support/pru-software-support.mk b/package/pru-software-support/pru-software-support.mk
> index f30ff6b5e3..b8ccf2d0d3 100644
> --- a/package/pru-software-support/pru-software-support.mk
> +++ b/package/pru-software-support/pru-software-support.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>
> -PRU_SOFTWARE_SUPPORT_VERSION = v5.1.0
> -PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/$(PRU_SOFTWARE_SUPPORT_VERSION)?
> +PRU_SOFTWARE_SUPPORT_VERSION = 5.1.0
> +PRU_SOFTWARE_SUPPORT_SITE = https://git.ti.com/pru-software-support-package/pru-software-support-package/archive-tarball/v$(PRU_SOFTWARE_SUPPORT_VERSION)?
>  PRU_SOFTWARE_SUPPORT_LICENSE =  BSD-3-Clause, GPL-2.0, Public Domain
>  PRU_SOFTWARE_SUPPORT_LICENSE_FILES = PRU-Package-v5.0-Manifest.html
>  PRU_SOFTWARE_SUPPORT_DEPENDENCIES = host-ti-cgt-pru host-pru-software-support
> --
> 2.17.1
>


--

Matthew Weber | Associate Director Software Engineer | Commercial Avionics

COLLINS AEROSPACE

400 Collins Road NE, Cedar Rapids, Iowa 52498, USA

Tel: +1 319 295 7349 | FAX: +1 319 263 6099

matthew.weber at collins.com | collinsaerospace.com



CONFIDENTIALITY WARNING: This message may contain proprietary and/or
privileged information of Collins Aerospace and its affiliated
companies. If you are not the intended recipient, please 1) Do not
disclose, copy, distribute or use this message or its contents. 2)
Advise the sender by return email. 3) Delete all copies (including all
attachments) from your computer. Your cooperation is greatly
appreciated.


Any export restricted material should be shared using my
matthew.weber at corp.rockwellcollins.com address.

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20191027/6e271b40/attachment.html>
