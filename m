From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 05 Feb 2019 10:58:57 +0100
Subject: [Buildroot] [WIP] support/testing: add xserver + Mesa OpenGL
 (GLX) + glxinfo
In-Reply-To: <20190107235024.6819-1-romain.naour@gmail.com> (Romain Naour's
 message of "Tue, 8 Jan 2019 00:50:24 +0100")
References: <20190107235024.6819-1-romain.naour@gmail.com>
Message-ID: <87imxypndq.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:

 > This test allow to check if the xserver with GLX is working properly.
 > This is a basic test but it allow to trigger the current bug reported
 > by [1].

 > [1] https://bugs.buildroot.org/show_bug.cgi?id=11591

 > Signed-off-by: Romain Naour <romain.naour@gmail.com>
 > Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
 > Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 > ---
 >  support/testing/tests/package/test_glxinfo.py | 57 +++++++++++++++++++++++++++
 >  1 file changed, 57 insertions(+)
 >  create mode 100644 support/testing/tests/package/test_glxinfo.py

..

 > +    def test_run(self):
 > +        self.login()
 > +

Dont we need to wait for the xserver to start?

 > +        # The test case verifies that the xserver with GLX is working
 > +        cmd = "glxinfo -display :0 2>&1 >/dev/null | grep Error"
 > +        # Error case: "Error: couldn't find RGB GLX visual or fbconfig"

Why the redirect / grep when you ignore the output in emulator.run()?

> +        _, exit_code = self.emulator.run(cmd, GLXINFO_TIMEOUT)
 > +        self.assertEqual(exit_code, 1)

So your expect glxinfo to fail?

-- 
Bye, Peter Korsgaard
