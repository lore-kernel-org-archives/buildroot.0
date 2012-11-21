From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Nov 2012 10:38:44 +0100
Subject: [Buildroot] How to regenerate zImage?
In-Reply-To: <slrnkamq24.2u9.narkewoody@zuhnb712.local.com>
References: <slrnkamf41.9pu.narkewoody@zuhnb712.local.com>
 <20121120100158.15b1b159@skate>
 <slrnkamq24.2u9.narkewoody@zuhnb712.local.com>
Message-ID: <20121121103844.0eeefba6@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Woody Wu,

On Tue, 20 Nov 2012 11:24:36 +0000 (UTC), Woody Wu wrote:

> > However, note that making changing to the source code anywhere in
> > output/build/... is a really stupid idea, as all those changes will be
> > lost next time you do 'make clean'.
> >
> Yes, I agree this is stupid. So I also really like to know whta's the
> best practice to do this kind of work. Would you be so kind to have a
> introduction or point me to a docment? Thanks

Two solutions:

 *) Do the build of the component you're actively working on outside of
    Buildroot. Typically, when I do kernel hacking, I do it outside of
    Buildroot, and I use Buildroot only as a final integration
    mechanism, to make sure that the system build process is
    reproducible. But not during development.

 *) Use the OVERRIDE_SRCDIR mechanism, as documented in
    http://www.elinux.org/images/2/2a/Using-buildroot-real-project.pdf,
    slide 41.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
