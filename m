From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 15 Sep 2013 20:18:07 +0200
Subject: [Buildroot] [PATCH 1/3] knock: new package
In-Reply-To: <522F880D.1090904@mind.be>
References: <1378071216-19697-1-git-send-email-rommel@layer-7.net>
 <CAAXf6LXW8GfZzPAHkFjP_coASZ8CPNPNNc6=KjWrek94Ndn_cw@mail.gmail.com>
 <E9670545-EE12-445D-A15C-C0C3E4A4116A@layer-7.net>
 <1DD66D3B-6E8F-41C4-859E-A36677BA0A6B@layer-7.net>
 <CAAXf6LWfhUhQ2pRwaFh6szZ=51WfPPJNB2AVwzoodV0w4XT4DQ@mail.gmail.com>
 <522F880D.1090904@mind.be>
Message-ID: <20130915201807.4453878c@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Tue, 10 Sep 2013 22:58:53 +0200, Arnout Vandecappelle wrote:

>   And you can also use the toolchains used by the autobuilders, to test 
> with uClibc-based toolchains.

Correct. As a reminder, I put all the toolchain defconfigs tested by
the autobuilders in
http://autobuild.buildroot.org/toolchains/configs/free-electrons/. Some
of them point to well-known external toolchains (Linaro, Sourcery
CodeBench, Blackfin, etc.), and some other point to external toolchains
that I have built specifically for the autobuilders, but the defconfig
contains an URL that is available for everyone.

Whenever I need to test some package, I often start with:

wget -O .config http://autobuild.buildroot.org/toolchains/configs/free-electrons/br-arm-basic.config

which will create me a minimal .config file that points to a very
simple uClibc toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
