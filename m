From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 12 Aug 2015 10:30:16 +0200
Subject: [Buildroot] [PATCH 3/9] toolchain-external: add support for gcc
 version dependency
In-Reply-To: <979955045.8284402.1439295583830.JavaMail.zimbra@datacom.ind.br>
References: <1438711241-31792-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1438711241-31792-4-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150804194948.GV3647@free.fr>
 <20150805121441.13c3a165@free-electrons.com>
 <1439036584.12501.5.camel@embedded.rocks>
 <20150808143313.2a5d6fff@free-electrons.com>
 <1485266737.8272514.1439293774884.JavaMail.zimbra@datacom.ind.br>
 <979955045.8284402.1439295583830.JavaMail.zimbra@datacom.ind.br>
Message-ID: <20150812103016.6f8ec2fd@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Carlos Santos,

On Tue, 11 Aug 2015 09:19:43 -0300 (BRT), Carlos Santos wrote:

> The problem goes away if I add BR2_TOOLCHAIN_EXTERNAL_GCC_4_8=y to my
> custom defconfig. It was missing in the original file but the absence
> was harmless.
> 
> Anyone using an external toolchain will face the same problem, so I
> think it's important to emphasize the consequences of the change in
> the release notes.

There is no need for that, the error message tells you that the
selection of the gcc version is incorrect. It is exactly the same sort
of checks that is used to validate the selected C library, etc.

The mechanism to specify the gcc version has been added very recently,
so that's why you're seeing the problem now.

If you hand-edit your defconfig, you're supposed to know what you're
doing. Otherwise, 'make menuconfig' will show an option to select the
gcc version used in your external toolchain.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
