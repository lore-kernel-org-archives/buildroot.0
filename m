From: Peter Korsgaard <jacmet@uclibc.org>
Date: Wed, 09 Dec 2009 14:21:35 +0100
Subject: [Buildroot] missing kernel headers when compiling kismet
In-Reply-To: <347DC1AA-225D-4C71-9A84-DC42FDBA068F@hsr.ch> (Marc Egli's
	message of "Wed, 9 Dec 2009 09:33:20 +0100")
References: <A208E45D-08AF-4294-ADEA-4734E3530DDC@hsr.ch>
	<87r5r5on5c.fsf@macbook.be.48ers.dk>
	<0BEC155F-0AE3-43B6-B538-9C024D89964F@hsr.ch>
	<87my1tocab.fsf@macbook.be.48ers.dk>
	<F9A30328-AECD-494A-A1BB-D28339481F10@hsr.ch>
	<873a3lnmmm.fsf@macbook.be.48ers.dk>
	<347DC1AA-225D-4C71-9A84-DC42FDBA068F@hsr.ch>
Message-ID: <871vj4mgf4.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Marc" == Marc Egli <marc.egli@hsr.ch> writes:

 Marc> i disabled all the lxde stuff and also openbox (all my own packages). and the result was the same.
 Marc> find gives me 2 packages wich need wireless.h
 Marc> find output/ -name configure* -exec grep -l wireless.h {} \;
 Marc> output/build/kismet-2009-06-R1/configure.in
 Marc> output/build/kismet-2009-06-R1/configure
 Marc> output/build/libpcap-1.0.0/configure.in
 Marc> output/build/libpcap-1.0.0/configure

 Marc> i think libpcap has some errors when searching for linux/wireless.h
 Marc> i attached my configcache and my libpcapconfiglog

You're right, I somehow missed that I had already compiled libpcap, so
it's configure step didn't rerun after I cleared the config cache.

I've added a fix to git (28ccc22ffd3) for this based on how it is fixed
in libpcap git. Could you give it a try to see if it fixes your problem?

-- 
Bye, Peter Korsgaard
