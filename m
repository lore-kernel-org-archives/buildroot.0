From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 13 Jan 2015 10:49:15 -0300
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2015-01-12
In-Reply-To: <20150113094943.18230555@free-electrons.com>
References: <20150113073016.3005C100E75@stock.ovh.net>
 <20150113094943.18230555@free-electrons.com>
Message-ID: <54B5225B.9030509@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 01/13/2015 05:49 AM, Thomas Petazzoni wrote:

Hi.

>>         bfin |                iptables-1.4.21 | NOK | http://autobuild.buildroot.net/results/66ba5f76694d0738b113463579ce6b2fa49a89d6/
> 
> /home/peko/autobuild/instance-1/output/host/opt/ext-toolchain/bfin-uclinux/bfin-uclinux/bin/ld.real: cannot find -ldl
> 
> Probably iptables should depends on !BR2_STATIC_LIBS.
> 
> Gustavo, can you have a look?

Blame libnetfilter_conntrack (connlabel module, doesn't seem to link in
statically in a correct way).
Just added a patch to disable it for static builds, i don't think we
want to kill iptables static just because of that little thing :)
Patch sent upstream as well of course.
Regards.
