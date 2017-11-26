From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 26 Nov 2017 22:14:40 +0100
Subject: [Buildroot] [PATCH] go-bootstrap: add
 BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
In-Reply-To: <20171107221059.25796-1-thomas.petazzoni@free-electrons.com>
 (Thomas Petazzoni's message of "Tue, 7 Nov 2017 23:10:59 +0100")
References: <20171107221059.25796-1-thomas.petazzoni@free-electrons.com>
Message-ID: <87d144g2tb.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 > go-bootstrap is a host package that builds a first stage Go compiler,
 > later used to build the final Go compiler. However, this first stage
 > compiler only supports building on x86, x86-64 and arm as host
 > architectures, so we need to add the relevant architecture
 > dependencies to avoid having go-bootstrap built on other unsupported
 > platforms.

 > We do this by introducing BR2_PACKAGE_HOST_GO_BOOTSTRAP_ARCH_SUPPORTS
 > in a new package/go-bootstrap/Config.in.host file. This option is then
 > used by BR2_PACKAGE_HOST_GO_ARCH_SUPPORTS to make sure we can't enable
 > Go packages when the host architecture doesn't allow building the Go
 > compiler.

 > Fixes:

 >   http://autobuild.buildroot.net/results/cbd419c6ab6fa8a6d18dc137c91f895867e53b8a/

 > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Committed to 2017.08.x, thanks.

-- 
Bye, Peter Korsgaard
