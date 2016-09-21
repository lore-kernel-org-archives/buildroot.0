From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 21 Sep 2016 09:24:49 +0200
Subject: [Buildroot] [PATCH] package/kvm-unit-tests: new package
In-Reply-To: <20160817230236.8255-1-cyrilbur@gmail.com>
References: <20160817230236.8255-1-cyrilbur@gmail.com>
Message-ID: <20160921092449.32147532@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 18 Aug 2016 09:02:36 +1000, Cyril Bur wrote:
> The unit tests are tiny guest operating systems that generally execute
> only tens of lines of C and assembler test code in order to obtain its
> PASS/FAIL result. Unit tests provide KVM and virt hardware functional
> testing by targeting the features through minimal implementations of
> their use per the hardware specification. The simplicity of unit tests
> make them easy to verify they are correct, easy to maintain, and easy
> to use in timing measurements. Unit tests are also often used for
> quick and dirty bug reproducers. The reproducers may then be kept as
> regression tests. It's strongly encouraged that patches implementing
> new KVM features are submitted with accompanying unit tests.
> http://www.linux-kvm.org/page/KVM-unit-tests
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>

This package is causing a good number of build failures. See:

         arm | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/a81d40f1453ee027c7e2a9da01f482e1d09b464d
        i686 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/20efe1e310fe71a587774bbe8490d6357acc8edd
      x86_64 | kvm-unit-tests-682187afcc99... | NOK | http://autobuild.buildroot.net/results/07deb6183ed23447de5182ee20df6c9c49e5ca49

Could you have a look and provide patches to address these?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
