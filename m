From: Christian Stewart <christian@paral.in>
Date: Tue, 19 Dec 2017 22:34:55 -0800
Subject: [Buildroot] systemd: blkid support requested but libraries not
 found
In-Reply-To: <87zi6e0wbi.fsf@paral.in>
References: <874lom2fy5.fsf@paral.in>
 <20171220053213.cmceyta4gjxryugi@sapphire.tkos.co.il>
 <87zi6e0wbi.fsf@paral.in>
Message-ID: <87wp1h29gw.fsf@paral.in>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch, all,

Christian Stewart <christian@paral.in> writes:
> Baruch Siach <baruch@tkos.co.il> writes:
>> It looks like you selected BR2_INIT_SYSTEMD when util-linux has already been 
>> built. Buildroot will not rebuild util-linux in this case. You need to start 
>> the build from scratch.
>
> Yes, I have been doing the following sequence to reproduce:
>
>  make clean
>  make defconfig BR2_DEFCONFIG=$(pwd)/defconfig
>  make systemd

It seems that systemd does not select the following automatically:

BR2_PACKAGE_UTIL_LINUX=y
BR2_PACKAGE_UTIL_LINUX_LIBBLKID=y

This results, with the defconfig in my previous mail, in util-linux not
being built and systemd build failing.

I don't think this is the intended behavior?...

Best,
Christian
