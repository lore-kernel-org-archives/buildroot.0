From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 20 Feb 2016 16:54:50 +0100
Subject: [Buildroot] [PATCH v5 20/20] python-crossbar: new package
In-Reply-To: <CAGm1_ktxUzHSBiOak_XKjNAXquQu2KK431n5wH1b02BLJw+P9Q@mail.gmail.com>
References: <1455188328-7595-1-git-send-email-mc5686@mclink.it>
 <1455188328-7595-3-git-send-email-mc5686@mclink.it>
 <20160220153848.0a8c45fd@free-electrons.com>
 <CAGm1_ktxUzHSBiOak_XKjNAXquQu2KK431n5wH1b02BLJw+P9Q@mail.gmail.com>
Message-ID: <20160220165450.6cdfe844@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sat, 20 Feb 2016 16:46:28 +0100, Yegor Yefremov wrote:

> Have you tried this example with PYC only version?
> 
> http://crossbar.io/docs/Getting-started-with-Python/
> 
> crossbar init --template hello:python --appdir $HOME/hello
> crossbar start --cbdir /home/oberstet/hello/.crossbar
> 
> See my attempt to find a solution for this issue:
> https://github.com/crossbario/crossbar/pull/638

No, I only tried "crossbar version". Since the commit log did not
give any details about the failing scenario, I couldn't know how to
reproduce the issue.

I added a comment in your pull request, to support your claim. However,
I believe it is indeed a bit horrible to add all this code. Why is the
code looking for process.py in the first place rather than using the
normal Python import logic, which properly works with .pyc files only?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
