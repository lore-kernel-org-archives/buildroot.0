From: Cyril Bur <cyrilbur@gmail.com>
Date: Tue, 20 Sep 2016 09:12:25 +1000
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: new package
In-Reply-To: <20160919164843.3896425f@free-electrons.com>
References: <20160817230236.8255-1-cyrilbur@gmail.com>
 <20160919164843.3896425f@free-electrons.com>
Message-ID: <1474326745.4451.3.camel@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, 2016-09-19 at 16:48 +0200, Thomas Petazzoni wrote:
> Hello,
> 
> On Thu, 18 Aug 2016 09:02:36 +1000, Cyril Bur wrote:
> > 
> > The unit tests are tiny guest operating systems that generally
> > execute
> > only tens of lines of C and assembler test code in order to obtain
> > its
> > PASS/FAIL result. Unit tests provide KVM and virt hardware
> > functional
> > testing by targeting the features through minimal implementations
> > of
> > their use per the hardware specification. The simplicity of unit
> > tests
> > make them easy to verify they are correct, easy to maintain, and
> > easy
> > to use in timing measurements. Unit tests are also often used for
> > quick and dirty bug reproducers. The reproducers may then be kept
> > as
> > regression tests. It's strongly encouraged that patches
> > implementing
> > new KVM features are submitted with accompanying unit tests.
> > http://www.linux-kvm.org/page/KVM-unit-tests
> > 
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> > ?package/Config.in????????????????????????|??1 +
> > ?package/kvm-unit-tests/Config.in?????????| 17 ++++++++++++
> > ?package/kvm-unit-tests/kvm-unit-tests.mk | 45
> > ++++++++++++++++++++++++++++++++
> > ?3 files changed, 63 insertions(+)
> > ?create mode 100644 package/kvm-unit-tests/Config.in
> > ?create mode 100644 package/kvm-unit-tests/kvm-unit-tests.mk
> 
> Applied to master with the following changes:
> 
> ????[Thomas:
> ?????- order architecture dependencies in Config.in alphabetically.
> ?????- rewrap Config.in help text, lines were too long
> ?????- add an empty line between the package description and the
> upstream
> ???????project URL in the Config.in help text
> ?????- don't make KVM_UNIT_TESTS_ARCH default to $(ARCH). This was
> not
> ???????correct for i386 for example. Instead, just handle the few
> ???????architectures that the package supports.
> ?????- remove useless double quotes in variable definitions.
> ?????- remove --prefix="$(TARGET_DIR)" from CONF_OPTS. It was
> installing
> ???????everything in /share/ and not /usr/share/, and setting the
> prefix to
> ???????TARGET_DIR at configure time is not good. Instead, pass
> DESTDIR at
> ???????installation time.]
> 

Thanks for the fixups.

Cyril

> Thomas
