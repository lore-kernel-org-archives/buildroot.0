From: Marc Egli <marc.egli@hsr.ch>
Date: Wed, 9 Dec 2009 09:33:20 +0100
Subject: [Buildroot] missing kernel headers when compiling kismet
In-Reply-To: <873a3lnmmm.fsf@macbook.be.48ers.dk>
References: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch>
	<87r5r5on5c.fsf@macbook.be.48ers.dk>
	<0BEC155F-0AE3-43B6-B538-9C024D89964F@hsr.ch>
	<87my1tocab.fsf@macbook.be.48ers.dk>
	<F9A30328-AECD-494A-A1BB-D28339481F10@hsr.ch>
	<873a3lnmmm.fsf@macbook.be.48ers.dk>
Message-ID: <347DC1AA-225D-4C71-9A84-DC42FDBA068F@hsr.ch>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

i disabled all the lxde stuff and also openbox (all my own packages). and the result was the same.
find gives me 2 packages wich need wireless.h
find output/ -name configure* -exec grep -l wireless.h {} \;
output/build/kismet-2009-06-R1/configure.in
output/build/kismet-2009-06-R1/configure
output/build/libpcap-1.0.0/configure.in
output/build/libpcap-1.0.0/configure

i think libpcap has some errors when searching for linux/wireless.h
i attached my configcache and my libpcapconfiglog
-------------- next part --------------
A non-text attachment was scrubbed...
Name: tgt-config.cache
Type: application/octet-stream
Size: 67821 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091209/0b2c0c2e/attachment-0002.obj>
-------------- next part --------------
A non-text attachment was scrubbed...
Name: config.log
Type: application/octet-stream
Size: 107519 bytes
Desc: not available
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20091209/0b2c0c2e/attachment-0003.obj>
-------------- next part --------------


Am 08.12.2009 um 23:09 schrieb Peter Korsgaard:

>>>>>> "Marc" == Marc Egli <marc.egli@hsr.ch> writes:
> 
> Marc> make clean and make did result in the same error i got before:
> Marc> checking for linux/wireless.h... (cached) no
> Marc> find ./ -name wireless.h gave me:
> Marc> ./output/toolchain/linux-2.6.31.6/include/linux/wireless.h
> Marc> ./output/toolchain/uClibc_dev/usr/include/linux/wireless.h
> Marc> ./output/toolchain/linux/include/linux/wireless.h
> Marc> ./output/build/staging_dir/usr/include/linux/wireless.h
> Marc> ./output/build/linux-2.6.31.6/include/config/wireless.h
> Marc> ./output/build/linux-2.6.31.6/include/linux/wireless.h
> Marc> ./output/build/ifplugd-0.28/src/wireless.h
> 
> Marc> and my config is attached
> 
> Hmm, I don't see any issues here with building the network packages you
> had enabled (the most obvious ones to check for linux/wireless.h). I see
> you have some local lxde packages enabled, maybe one of those checks for
> wireless? Could you try temporarily disabling them and doing a clean
> rebuild?
> 
> -- 
> Bye, Peter Korsgaard
