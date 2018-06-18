From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 18 Jun 2018 07:13:25 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <20180605160827.GD2503@scaer> (Yann E. MORIN's message of "Tue, 5
 Jun 2018 18:08:27 +0200")
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
 <20180605160827.GD2503@scaer>
Message-ID: <87k1qwllsa.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:

 > Arnout, All,
 > On 2018-06-05 00:21 +0200, Arnout Vandecappelle spake thusly:
 >> On 01-06-18 15:30, Stefan Becker wrote:
 >> > host-mkpasswd was a fork from whois to provide a host version of
 >> > mkpasswd for the build. This has caused a maintenance headache.
 >> > 
 >> > Replace it with host-busybox which can provide "mkpasswd" functionality
 >> > from own source code. That causes less hassle for different build
 >> > platforms.
 >> 
 >> Just to be clear: does everybody agree that it is a good idea to use
 >> weakly-random numbers as salt, rather than real random numbers like whois does?

 > Not really, no. That is definitely no good. I was not aware of how bad
 > the busybox salt generator was.. Sigh....

If that is the only problem then we could still use it and pass our own
salt, but that leaves the problem of coming up with a sufficiently
random salt. I guess we could do something with reading /dev/urandom and
base64 encoding it.

But yeah, just going for the python implementation may be the easiest.

-- 
Bye, Peter Korsgaard
