From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 09:03:53 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Your build results for
 2018-12-01
In-Reply-To: <20181202184408.GC13145@x1.vandijck-laurijssen.be>
References: <20181202070028.CF00F20DB0@mail.bootlin.com>
 <20181202184408.GC13145@x1.vandijck-laurijssen.be>
Message-ID: <20181203090353.08b86bf2@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 2 Dec 2018 19:44:08 +0100, Kurt Van Dijck wrote:

> Correct me if I'm wrong, but the error
> 
> 	/tmp/ccVahWlI.s:135: Error: unknown mnemonic `rorw' -- `rorw $8,w3'
> 
> that pops up after a year of silence makes me suspect the toolchain
> rather than the package.

It wasn't the toolchain, but a <foo>-config script providing bogus
flags, leading to host headers being included. This has been fixed by:

  https://git.buildroot.org/buildroot/commit/?id=ba015cdf04a2ee33615f346448ac2e92aac3865a

Basically all the commits between:

  9c43f28de450adeae998d0e0d974777441510c76

and

  ba015cdf04a2ee33615f346448ac2e92aac3865a

are not worth looking at, on old build machines that do not have the
"realpath" utility installed.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
