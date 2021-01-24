From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 24 Jan 2021 16:14:40 +0100
Subject: [Buildroot] No rule to make target 'host-python !!
In-Reply-To: <CAGshWo2ngucacs+BJocUb36G4QX7Q7ssv2_M0R9kAiV+oick1Q@mail.gmail.com>
References: <CAGshWo02DNPmGa_Nj7aBjf5TrQgVz2ePTP8EkABRfGFSYBsU0A@mail.gmail.com>
 <CAGshWo1eWoWDUd_0jD8xQbpZg7dGzOzhwNeNmhrc5ewh9z6TSQ@mail.gmail.com>
 <20210123114813.0f7048c2@windsurf.home>
 <CAGshWo2ngucacs+BJocUb36G4QX7Q7ssv2_M0R9kAiV+oick1Q@mail.gmail.com>
Message-ID: <20210124161440.52c2d7d6@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 24 Jan 2021 12:40:31 +0100, manu f <e.fiancette@gmail.com> wrote:

> here my complete .config

Importing your .config into a plain buildroot-2020.02.8 gives
the following diff:

@@ -1,9 +1,8 @@
 #
 # Automatically generated file; DO NOT EDIT.
-# Buildroot 2020.02.8-dirty Configuration
+# Buildroot 2020.02.8 Configuration
 #
 BR2_HAVE_DOT_CONFIG=y
-BR2_EXTERNAL_ATOS_PATH="/home/user/cleta_buildroot/br-external"
 BR2_HOST_GCC_AT_LEAST_4_9=y
 BR2_HOST_GCC_AT_LEAST_5=y
 BR2_HOST_GCC_AT_LEAST_6=y
@@ -1446,6 +1445,7 @@
 #
 # BR2_PACKAGE_PERL is not set
 # BR2_PACKAGE_PHP is not set
+# BR2_PACKAGE_PYTHON is not set
 BR2_PACKAGE_PYTHON3=y
 # BR2_PACKAGE_PYTHON3_PY_ONLY is not set
 BR2_PACKAGE_PYTHON3_PYC_ONLY=y
@@ -4174,6 +4174,7 @@
 # BR2_PACKAGE_HOST_PKGCONF is not set
 # BR2_PACKAGE_HOST_PRU_SOFTWARE_SUPPORT is not set
 # BR2_PACKAGE_HOST_PWGEN is not set
+# BR2_PACKAGE_HOST_PYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_CYTHON is not set
 # BR2_PACKAGE_HOST_PYTHON_LXML is not set
 # BR2_PACKAGE_HOST_PYTHON_SIX is not set
@@ -4876,17 +4877,3 @@
 # BR2_VFP_FLOAT is not set
 # BR2_PACKAGE_GCC_TARGET is not set
 # BR2_HAVE_DEVFILES is not set
-
-#
-# External options
-#
-
-#
-# br2-external tree for atos projects (in /home/user/cleta_buildroot/br-external)
-#
-BR2_PACKAGE_BACKLIGHT_MONITORING=y
-BR2_PACKAGE_TEST_UART=y
-BR2_PACKAGE_APP_MOUNT=y
-BR2_PACKAGE_APP_UPDATER=y
-BR2_NODE_JS_14x=y
-# BR2_PYTHON_37 is not set


Note the lines with 'Buildroot 2020.02.8-dirty',
'-BR2_EXTERNAL_ATOS_PATH="/home/user/cleta_buildroot/br-external"',
'+# BR2_PACKAGE_PYTHON is not set' and '-# BR2_PYTHON_37 is not set',
so most likely something with your local change and/or br-external
changing the package python to python37?

Otherwise the config compiles fine here (even with libevdev enabled)...

Regards,
Peter

 
> 
> Le sam. 23 janv. 2021 ? 11:48, Thomas Petazzoni <
> thomas.petazzoni at bootlin.com> a ?crit :  
> 
> > On Fri, 22 Jan 2021 23:53:30 +0100
> > manu f <e.fiancette@gmail.com> wrote:
> >  
> > > ok, I remove libevdev in Target package =>libraries=>Other and its copile
> > > without error!
> > >
> > > (But I dont know if I realy need this lib... )
> > >
> > > Well why it no compile with libdevdev ?
> > > @ Thomas Petazzoni I saw you already got problem and make patch for
> > > host-python interpreter...is there something to see with ?  
> >
> > host-python is definitely part of Buildroot 2020.02, so I'm not sure
> > how you can get this error. We would need more details, such as the
> > complete .config that reproduces the issue.
> >
> > Thomas
> > --
> > Thomas Petazzoni, CTO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >  
