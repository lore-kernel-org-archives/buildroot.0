From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 09:37:29 +0200
Subject: [Buildroot] [PATCH] host-mkpasswd: fix crash on Fedora 28 build
 host
In-Reply-To: <20180509202254.GA9837@scaer> (Yann E. MORIN's message of "Wed, 9
 May 2018 22:22:54 +0200")
References: <20180502090508.12893-1-chemobejk@gmail.com>
 <20180503215631.6f62e406@windsurf> <20180503200415.GC2453@scaer>
 <CAOJ2eMeJQhQUrZoqXnXy_NwwUo6O5c6nzdmJttC+T4wE_NSE=Q@mail.gmail.com>
 <CAF7Xa=2FFzbnC8O7JRWCQrQN3ZA3ffNR=3v8c=nXFe+4Uzmc+w@mail.gmail.com>
 <1fdbacbd-e80f-8735-89c8-2ca92224ee9a@mind.be>
 <20180509202254.GA9837@scaer>
Message-ID: <871sdu9akm.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

Hi,

 >> Would you like to prepare a patch introducing the python-based approach? It
 >> should be two patches: the first one introducing the python script in mkusers,
 >> the second one removing the mkpasswd package.

 > Sorry, I am not too convinced that writing our own tool is good...

Me neither. Another alternative is to build host-busybox and use the
mkpasswd applet with the built in crypt routines (ENABLE_USE_BB_CRYPT).

-- 
Bye, Peter Korsgaard
