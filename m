From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 12 Jul 2021 10:17:24 +0200
Subject: [Buildroot] [git commit] boot/arm-trusted-firmware: add SSP
 option
In-Reply-To: <20210626144011.82B4C8113D@busybox.osuosl.org> (Yann E. MORIN's
 message of "Sat, 26 Jun 2021 17:10:25 +0200")
References: <20210626144011.82B4C8113D@busybox.osuosl.org>
Message-ID: <87sg0kx7xn.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > commit: https://git.buildroot.net/buildroot/commit/?id=cf176128ec4ad60c29c8828cab1887f69edb9473
 > branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

 > Buildroot sets appropriate ENABLE_STACK_PROTECTOR build flag value based
 > on the toolchain global BR2_SSP_* options, and all packages are built
 > with that setting.

 > However it might not be always convenient to automatically infer TF-A
 > stack protection from the toolchain features. For instance, secure
 > memory constraints may become an issue and all the extra TF-A features
 > need to be tuned or disabled in order to shrink TF-A firmware image.

 > Besides, for any value other than "none", TF-A platform specific hook
 > 'plat_get_stack_protector_canary' must be implemented. However this hook
 > is not implemented by all the platforms supported by TF-A. For instance,
 > Allwinner currently does not provide such a hook.

 > Add an new option that a user can toggle to enable or disable SSP in
 > their ATF build. If enabled, the SSP level is automatically inherited
 > from the global setting.

 > Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
 > [yann.morin.1998 at free.fr: simplify logic with a single boolean]
 > Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>

Committed to 2021.02.x and 2021.05.x, thanks.

-- 
Bye, Peter Korsgaard
