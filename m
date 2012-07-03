From: Peter Korsgaard <jacmet@uclibc.org>
Date: Tue, 03 Jul 2012 21:08:35 +0200
Subject: [Buildroot] [git commit] mii-diag: link statically if
	configured to do so
In-Reply-To: <20120703195647.078ad47c@skate> (Thomas Petazzoni's message of
 "Tue, 3 Jul 2012 19:56:47 +0200")
References: <20120627200833.E3F7C8E0E8@busybox.osuosl.org>
 <20120629121602.1b0fecd6@skate> <87txxt42up.fsf@macbook.be.48ers.dk>
 <20120630105559.7e57508a@skate> <4FEEF8D4.4080702@mind.be>
 <CA+wH294UjT4T2a7_SNziD+VLeLAvzMNZxZmbyg+hz9CW+pg=zg@mail.gmail.com>
 <20120703195647.078ad47c@skate>
Message-ID: <87ipe41x3g.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

 Thomas> Hello,
 Thomas> Le Sat, 30 Jun 2012 18:09:38 +0100,
 Thomas> Alex Bradbury <asb@asbradbury.org> a ?crit :

 >> That would be neat. Is there a list of currently tested configurations
 >> somewhere?

 Thomas> Basically, the way the autobuilds work is that Peter and I have a set
 Thomas> of base configurations, that define the architecture and the toolchain,
 Thomas> and then we do a "make randpackageconfig" to generate a random
 Thomas> selection of packages.

 Thomas> Peter has a few base configurations, and if I understand correctly, on
 Thomas> a given build machine, he always uses the same base configuration.

Indeed. I have a defconfig defining the toolchain configuration and my
script basically does:

cp defconfig .config
yes '' | make oldconfig
make randpackageconfig
make

-- 
Bye, Peter Korsgaard
