From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 19 May 2016 10:26:47 -0300
Subject: [Buildroot] Analysis of build results for 2016-05-16
In-Reply-To: <20160517153611.2a3b4199@free-electrons.com>
References: <20160517063022.7001A10142D@stock.ovh.net>
 <20160517153611.2a3b4199@free-electrons.com>
Message-ID: <573DBF17.3070406@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 17/05/16 10:36, Thomas Petazzoni wrote:

>>           arm |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/80a75aaebd55fca1220048d1d4dfb434ce4d9804/
>>        x86_64 |                 collectd-5.5.1 | NOK | http://autobuild.buildroot.net/results/ae1e3a33a1c2b7433ca7a04659467e2017756b00/
>
> Gustavo, any solution in sight for this collectd problem?

Hi.
This is the same problem that was fixed for connman in 0dece985, fixed 
in linux via 4a91cb61.
The problem is that the connman fix breaks the proper fix in the kernel, 
and now that 4.5.5 and 4.6 are out i think the best approach is to bump 
the 4.5.x series for the release and drop the connman patch.
This has the side-effect of making connman/collectd with iptables and 
possibly some other netfilter-wielding code to be effectively broken for 
4.5.0 -> 4.5.4 headers though, but as long as we don't ship these in a 
release i think we should genrally be fine.
Regarding external toolchains time will tell, but any package patches we 
make about this will likely fall on silent ears upstream.
http://patchwork.ozlabs.org/patch/624067/ and 
http://patchwork.ozlabs.org/patch/624068/ address this.
Regards.
