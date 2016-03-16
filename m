From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 16 Mar 2016 09:21:03 +0100
Subject: [Buildroot] [PATCH] quagga: security bump to version
	1.0.20160309
In-Reply-To: <46743f76247ed0f41bf1b3a77bbd967736b6765e.1458058320.git.baruch@tkos.co.il>
 (Baruch Siach's message of "Tue, 15 Mar 2016 18:12:00 +0200")
References: <46743f76247ed0f41bf1b3a77bbd967736b6765e.1458058320.git.baruch@tkos.co.il>
Message-ID: <87mvpy6dg0.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Baruch" == Baruch Siach <baruch@tkos.co.il> writes:

 > Fixes CVE-2016-2342 (AKA VU#270232): Quagga bgpd with BGP peers enabled for
 > VPNv4 contains a buffer overflow vulnerability.

 > Remove the --enable-babeld and --enable-opaque-lsa configure options that were
 > removed in this release.

 > See the release announcement at
 > https://lists.quagga.net/pipermail/quagga-dev/2016-March/014938.html.

This unfortunately causes some new build errors:

http://autobuild.buildroot.net/?reason=quagga-1.0.20160309

make[3]: *** No rule to make target `../ospfd/libospf.la', needed by `libospfapiclient.la'.  Stop.

Perhaps a parallel build issue? Care to take a look?

-- 
Bye, Peter Korsgaard
