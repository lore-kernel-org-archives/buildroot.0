From: Cyril HAENEL <chaenel@free.fr>
Date: Mon, 04 May 2009 15:19:36 +0200
Subject: [Buildroot] Problem with LZO package in ARM configuration,
 need help to solve the problem
In-Reply-To: <87y6td59d7.fsf@macbook.be.48ers.dk>
References: <49FEC5F7.9070808@free.fr>
	<877i0x6r8l.fsf@macbook.be.48ers.dk>	<49FED95C.5040802@free.fr>
	<87y6td59d7.fsf@macbook.be.48ers.dk>
Message-ID: <49FEEB68.30800@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


> Hi,
>
>  Cyril> In fact when we activate jffs2 filesystem output, lzo must be compiled
>  Cyril> for the host, thus why does it first try to use arm-linux-g++ !? It's
>  Cyril> why I am the only one to have this problem since some week, because I
>  Cyril> am the only one to have a arm toolchain installed on my computer !!
>
>  Cyril> There is surely a bug to fix somewhere, but I don't know where !?
>
> Hmm, are you sure this is lzo-host compilation, and not lzo for the
> target?
>
>   
I think lzo is compiled in the 2 configuration, for the host and for the 
target.
Because when we activate the jffs2 filesystem output, I think buildroot 
need mkfs.jffs2 and I think mkfs.jffs2 needs lzo.
But because mtd-utils (and also mkfs.jffs2) is provided in the target, I 
think lzo is also compiled for the target.


-- 

Cyril Haenel
Registered Linux User #332632
