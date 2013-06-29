From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Sat, 29 Jun 2013 07:52:01 -0300
Subject: [Buildroot] [PATCH] dhcpcd: unavailable for bfin and fix
 another bug
In-Reply-To: <20130629104251.4697be00@skate>
References: <1372463785-29537-1-git-send-email-gustavo@zacarias.com.ar>
 <20130629104251.4697be00@skate>
Message-ID: <51CEBC51.9030601@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 06/29/2013 05:42 AM, Thomas Petazzoni wrote:

> I would prefer to see an explicit "depends on !" on the specific
> Blackfin external toolchains that are causing problems. If one day we
> get the internal backend to properly build a toolchain for Blackfin,
> then doing a "depends on !BR2_bfin" wouldn't make sense.
> 
> The Blackin external toolchain versions aren't changing that often, so
> it shouldn't cause too much hassle to update dhpcd dependencies when
> that happens.

That would be all good and well if the internal toolchain worked, snip:

checking for F_SETLKW... yes
checking if mkdir takes one argument... no
This target does not support --with-cpu.
Valid --with options are:
make[1]: *** [configure-gcc] Error 1
make[1]: Leaving directory
`/home/gustavoz/b/fin/output/toolchain/gcc-4.7.3-initial'
make: ***
[/home/gustavoz/b/fin/output/toolchain/gcc-4.7.3-initial/.compiled] Error 2

(all defaults except +IPV6 for dhcpcd).
And 2012R1-RC2 fails to download properly (2012R2-RC2 too for that
matter but i've got a local copy).
I kind of doubt that 2012R1 being older has getifaddrs enabled though.
Regards.
