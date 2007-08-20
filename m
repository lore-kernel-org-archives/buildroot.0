From: Brad House <brad@mainstreetsoftworks.com>
Date: Mon, 20 Aug 2007 12:32:00 -0400
Subject: [Buildroot] soekris build problem
In-Reply-To: <80a8c9800708200924p1aea572fwbff50b4fbcb98012@mail.gmail.com>
References: <80a8c9800708200924p1aea572fwbff50b4fbcb98012@mail.gmail.com>
Message-ID: <46C9C200.7030009@mainstreetsoftworks.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

> I'm using buildroot for cross compiling  a soekris build and I'm
> getting the following error :


what does /home/local_smishra/buildroot/toolchain_build_i586/mpfr-2.2.1-host/config.log
say ?

I'm probably going to bet on your 'make menuconfig' you selected a Target Architecture
Variant of 'geode'.  This is known to be broken as it tries to set your -march=geode
which is not a supported architecture in GCC 4.2 (though will be in GCC 4.3 supposedly).
Select your variant as i586 ....

If that's no the problem, then you are probably missing something in your build system,
what distro are you using?

I just got finished rebuilding the latest svn for a soekris net4801 this morning,
no errors ...

-Brad
