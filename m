From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 01 Dec 2014 23:05:47 +0100
Subject: [Buildroot] [PATCHv3 24/74] openvpn: use
	<pkg>_INSTALL_INIT_SYSV mechanism
In-Reply-To: <20141130154505.GC4124@free.fr> (Yann E. MORIN's message of "Sun, 
 30 Nov 2014 16:45:05 +0100")
References: <1417357142-14307-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1417357142-14307-25-git-send-email-thomas.petazzoni@free-electrons.com>
 <20141130154505.GC4124@free.fr>
Message-ID: <87sigzauv8.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 > Suddenly, I realise that some packages use 755 while others use 0755.

 > I don't care which we use (even though I have a slight preference for
 > 0755), but we should have some coherence across all packages.

I also prefer 0755, and that's what we mostly do:

git grep -l '\-m 755' **/*.mk|wc -l
55

git grep -l '\-m 0755' **/*.mk|wc -l
158

-- 
Bye, Peter Korsgaard
