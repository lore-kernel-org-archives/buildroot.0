From: Peter Korsgaard <jacmet@uclibc.org>
Date: Thu, 30 Sep 2010 21:16:15 +0200
Subject: [Buildroot] [SECURITY][PATCHv2] Bump quagga to 0.99.17
In-Reply-To: <4CA4A278.6040303@zacarias.com.ar> (Gustavo Zacarias's message of
	"Thu, 30 Sep 2010 11:45:12 -0300")
References: <4CA4A278.6040303@zacarias.com.ar>
Message-ID: <87ocbfxcsg.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Gustavo" == Gustavo Zacarias <gustavo@zacarias.com.ar> writes:

 Gustavo> Bump quagga to version 0.99.17.
 Gustavo> [SECURITY] Fixes remote crash in bgpd.
 Gustavo> Other fixes for ospfd, ospf6d, zebra and isisd.
 Gustavo> Fix conflicting options in the package, enhance help, reorder options.
 Gustavo> Should fix most breakage with randpackageconfig (Peter: ring me if you
 Gustavo> hit another one!).

With this I still have the same bug:

make[3]: *** No rule to make target `../ospfd/libospf.la', needed by `ospfclient

grep QUAGGA .config
BR2_PACKAGE_QUAGGA=y
# BR2_PACKAGE_QUAGGA_ZEBRA is not set
# BR2_PACKAGE_QUAGGA_BGPD is not set
# BR2_PACKAGE_QUAGGA_RIPD is not set
# BR2_PACKAGE_QUAGGA_OSPFD is not set
# BR2_PACKAGE_QUAGGA_WATCHQUAGGA is not set
# BR2_PACKAGE_QUAGGA_ISISD is not set
# BR2_PACKAGE_QUAGGA_BGP_ANNOUNCE is not set
# BR2_PACKAGE_QUAGGA_NETLINK is not set
# BR2_PACKAGE_QUAGGA_SNMP is not set
BR2_PACKAGE_QUAGGA_TCP_ZEBRA=y
BR2_PACKAGE_QUAGGA_OPAGUE_LSA=y

I also see that you removed the comment about snmp support being broken
with external toolchains. Is that resolved?

And finally, how do you create your patches? Could you please use git
format-patch for it, so I can apply them with git am?

-- 
Bye, Peter Korsgaard
