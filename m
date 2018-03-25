From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Mar 2018 21:06:22 +0200
Subject: [Buildroot] [PATCH v2 2/3] test-pkg: test a subset of
 toolchains by default, add -a and -n options
In-Reply-To: <20180325085018.GH2620@scaer>
References: <20180323214815.19831-1-thomas.petazzoni@bootlin.com>
 <20180323214815.19831-3-thomas.petazzoni@bootlin.com>
 <20180325085018.GH2620@scaer>
Message-ID: <20180325210622.31817922@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Sun, 25 Mar 2018 10:50:18 +0200, Yann E. MORIN wrote:

> > Note that the list of toolchains (built in the "toolchains" shell
> > variable) is no longer sorted. Indeed, when the first N toolchains are
> > tested, we want them to be tested in the same order as they are listed
> > in the CSV file, as we are careful to order them in an interesting
> > order. We only sort when all toolchains are tested.  
> 
> I don't understand why you want to test them in the order they are
> listed... I understand that you want them to be _selected_ in the order
> they appear, yes. But tested? See below...

Well, the first 7 toolchains are kind of listed in the order of
importance, so it makes more sense to *test* the most important
toolchain first, so if it fails, you can abort there, investigate, and
then restart the test.

But that's not a strong opinion, so if you disagree with this, I don't
care that much if the toolchains are tested in alphabetic ordering.

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
