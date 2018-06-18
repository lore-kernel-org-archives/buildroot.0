From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 18 Jun 2018 08:53:30 +0200
Subject: [Buildroot] [PATCHv2 proposal/next 2/3] build: replace
 host-mkpasswd with host-busybox
In-Reply-To: <87k1qwllsa.fsf@dell.be.48ers.dk>
References: <20180601125900.26400-1-chemobejk@gmail.com>
 <20180601133053.27552-1-chemobejk@gmail.com>
 <20180601133053.27552-3-chemobejk@gmail.com>
 <48945091-d169-18ba-31d0-a51c64e9a918@mind.be>
 <20180605160827.GD2503@scaer> <87k1qwllsa.fsf@dell.be.48ers.dk>
Message-ID: <20180618085330.4ba65fef@windsurf>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Mon, 18 Jun 2018 07:13:25 +0200, Peter Korsgaard wrote:

>  >> Just to be clear: does everybody agree that it is a good idea to use
>  >> weakly-random numbers as salt, rather than real random numbers like whois does?  
> 
>  > Not really, no. That is definitely no good. I was not aware of how bad
>  > the busybox salt generator was.. Sigh....  
> 
> If that is the only problem then we could still use it and pass our own
> salt, but that leaves the problem of coming up with a sufficiently
> random salt. I guess we could do something with reading /dev/urandom and
> base64 encoding it.
> 
> But yeah, just going for the python implementation may be the easiest.

Once again, what is the problem with the current solution we have ?

We have been happy with it for several years, and the only thing that
prompted this discussion is that it failed to build on Fedora 28, which
was fixed by a 3 lines change. Is it really worth it changing this
stuff ?

Best regards,

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
