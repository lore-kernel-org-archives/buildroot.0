From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 4 Aug 2013 19:54:23 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
 2013-08-02
In-Reply-To: <20130803063005.737FF52C616@lolut.humanoidz.org>
References: <20130803063005.737FF52C616@lolut.humanoidz.org>
Message-ID: <20130804195423.5bd46023@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat,  3 Aug 2013 08:30:05 +0200 (CEST), Thomas Petazzoni wrote:

>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/89da9f9127984837b0570a5c4863164f83b9e3ad/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/7dc6d1b91425cd50256ee5d9205a604982d09a9b/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/13c2514d3e05e04eabbae07a0e8687a49465bf5b/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/82bdccf5fb5616c27102da0af69d5a7111723021/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/cf1f18d2630babdfebb3f40e5c8e5f7cb27337c5/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/9be574c12893dfcd4d390f4f271907c470703f8d/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/30489e4c06e3ad5db32dedf33562b8771eb5649b/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/c05854de5470292a67de47ab4e50dcb65b10f94d/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/e8213e6d13cf82fe8c8a33a7ee7f935336a69150/
>    powerpc | make: *** [/home/peko/scrat... | NOK | http://autobuild.buildroot.net/results/9bd134930274efd68b51c04f20e08566f7bc219e/

These were caused to a failure in fakeroot, itself caused by a large
number of SysV semaphores on gcc20, more than the allowed system limit.
They were created by a completely different user of gcc20 and therefore
those errors have nothing to do with Buildroot and should be ignored.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
