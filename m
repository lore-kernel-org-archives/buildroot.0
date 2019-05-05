From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 05 May 2019 21:07:02 +0200
Subject: [Buildroot] Buildroot multi-arch build
In-Reply-To: <20190505154209.c2zjo36l6wgam5ul@falbala.home.lespocky.de>
 (Alexander Dahl's message of "Sun, 5 May 2019 17:42:10 +0200")
References: <BL0PR0102MB341237052A8B224C63E58B9FF3350@BL0PR0102MB3412.prod.exchangelabs.com>
 <20190505154209.c2zjo36l6wgam5ul@falbala.home.lespocky.de>
Message-ID: <87ftpsbu09.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Alexander" == Alexander Dahl <post@lespocky.de> writes:

 > Hei hei,
 > On Fri, May 03, 2019 at 08:21:41PM +0000, Gervais, Francois wrote:
 >> We use the same buildroot environment for x86_64, armhf and arm64.
 >> 
 >> For each architecture, everything is the same except for the architecture definition.

 > What you won't be able to avoid is building everything three times.
 > Those architectures all need different toolchains. You probably
 > already know this? ;-)

 >> Is there a way to achieve this without maintaining 3 config files?

 > Maybe you can somehow work with some kind of config template you
 > maintain, and generate those three buildroot configs from it?

This can simply be done with "cat", E.G. have a config snippet for each
of the 3 architectures and one for the package selection, and then
simply concatenate 1 arch + packages to a defconfig file.

-- 
Bye, Peter Korsgaard
