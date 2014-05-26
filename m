From: Romain Naour <romain.naour@openwide.fr>
Date: Mon, 26 May 2014 23:34:48 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-05-25
In-Reply-To: <kpnc5bxqgm.ln2@ID-313208.user.individual.net>
References: <20140526063007.A011F10158F@stock.ovh.net>
 <kpnc5bxqgm.ln2@ID-313208.user.individual.net>
Message-ID: <5383B378.9060004@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Bernd, All

Le 26/05/2014 23:20, Bernd Kuhls a ?crit :
> Thomas Petazzoni
> <thomas.petazzoni@free-electrons.com> wrote
> in news:20140526063007.A011F10158F at stock.ovh.net: 
> 
>>    powerpc |     xserver_xorg-server-1.15.1 | NOK |
>>    http://autobuild.buildroot.net/results/a952932b832ee3296d6c225c7a9df40
>>    8ca3eef9f/ 
> 
> Hi,
> 
> I am unable to reproduce the build failure.

I think it's a build error like the imagemagick one:
http://git.buildroot.net/buildroot/commit/?id=7395ee9d3b88e45798143e05a28d6d4b51409130

Here:
 /bin/mkdir -p '/data/scratch/peko/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/share/man/man1'
 /usr/bin/install -c -m 644 Xserver.1 '/data/scratch/peko/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/share/man/man1'
 /usr/bin/install -c -m 644 Xserver.1 '/data/scratch/peko/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/share/man/man1'
/usr/bin/install: cannot create regular file `/data/scratch/peko/host/usr/powerpc-buildroot-linux-uclibc/sysroot/usr/share/man/man1/Xserver.1': File exists

I haven't looked at it yet...

Best regards,
Romain Naour
