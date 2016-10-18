From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 18 Oct 2016 11:48:49 +0200
Subject: [Buildroot] any opinions on uClibc-ng test-suite?
In-Reply-To: <bf1755cb-2741-5c6b-9b35-6eac1426a81b@mind.be>
References: <20161017184120.GM21808@waldemar-brodkorb.de>
 <bf1755cb-2741-5c6b-9b35-6eac1426a81b@mind.be>
Message-ID: <20161018114849.2c1a2cd2@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 17 Oct 2016 23:08:31 +0200, Arnout Vandecappelle wrote:

>  Normally I prefer that the test suite stays with the package.

Well, I agree in general. But for C library tests, it's a bit annoying
when they are bundled with the C library source code itself. Indeed,
this prevents from building those tests in an external toolchain
scenario.

So I actually find having tests separate from the C library tarball a
nicer way, as it allows to package them very easily, and use them even
with external toolchains.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux and Kernel engineering
http://free-electrons.com
