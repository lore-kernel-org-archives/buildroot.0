From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 30 Aug 2020 08:52:48 +0200
Subject: [Buildroot] [git commit branch/2020.02.x] package/busybox:
 enable flags for use as systemd pager
In-Reply-To: <CAB0FRsu08kyDTzNtSLgfNeb=nySwS2Mv4RPugV-pLD7aKfN9QQ@mail.gmail.com>
 (=?utf-8?Q?=22Fran=C3=A7ois?= Perrad"'s message of "Sun, 30 Aug 2020
 08:22:17 +0200")
References: <20200828155253.1CA9A86539@busybox.osuosl.org>
 <CAB0FRsu08kyDTzNtSLgfNeb=nySwS2Mv4RPugV-pLD7aKfN9QQ@mail.gmail.com>
Message-ID: <87imd0eibj.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Fran?ois" == Fran?ois Perrad <francois.perrad@gadz.org> writes:

 > Le ven. 28 ao?t 2020 ? 18:00, Peter Korsgaard <peter@korsgaard.com> a
 > ?crit :

 >> commit:
 >> https://git.buildroot.net/buildroot/commit/?id=9faba29108e74eb4acab21f5919dfab0288b23ac
 >> branch:
 >> https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x
 >> 
 >> If the less package is not enable and systemd is enabled,
 >> then configure the less applet to fully work with systemd.
 >> 
 >> systemd sets the flags for less in an environment variable
 >> and requires a few options for correct display.
 >> 
 >> Signed-off-by: Norbert Lange <nolange79@gmail.com>
 >> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 >> (cherry picked from commit c2caf816e9296c4812f83f0a5d16e0e33a264b72)
 >> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
 >> ---
 >> package/busybox/busybox.mk | 13 +++++++++++++
 >> 1 file changed, 13 insertions(+)
 >> 
 >> diff --git a/package/busybox/busybox.mk b/package/busybox/busybox.mk
 >> index b9d82ed71e..55aa9b0bb1 100644
 >> --- a/package/busybox/busybox.mk
 >> +++ b/package/busybox/busybox.mk
 >> @@ -237,6 +237,18 @@ define BUSYBOX_SET_SELINUX
 >> endef
 >> endif
 >> 
 >> +# enable relevant options to allow the Busybox less applet to be used
 >> +# as a systemd pager
 >> +ifeq ($(BR2_PACKAGE_SYSTEMD):$(BR2_PACKAGE_LESS),y:)
 >> +define BUSYBOX_SET_LESS_FLAGS
 >> +       $(call KCONFIG_ENABLE_OPT,CONFIG_FEATURE_LESS_DASHCMD)
 >> 

 > the backport of this patch on the branch 2020.02.x breaks the build of
 > busybox.
 > on 2020.02.x, an additional parameter is required with the value :
 > $(BUSYBOX_BUILD_CONFIG)

Crap, and I just released 2020.02.5 :/ Strange that we didn't have any
autobuilder issues so far.

I'll fix it, thanks.

-- 
Bye, Peter Korsgaard
