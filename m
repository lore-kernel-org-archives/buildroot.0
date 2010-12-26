From: Heiko Zuerker <heiko@zuerker.org>
Date: Sun, 26 Dec 2010 08:08:47 -0600
Subject: [Buildroot] busybox, hardcoded config
In-Reply-To: <87ipyhpl2b.fsf@macbook.be.48ers.dk>
References: <20101223073318.154656bz82tuap44@www.home.zuerker.org>
	<20101224085246.0a2d8640@surf>
	<20101224072947.17101by6ka661utc@www.home.zuerker.org>
	<87ipyhpl2b.fsf@macbook.be.48ers.dk>
Message-ID: <20101226080847.93616g8dqnq63ew4@www.home.zuerker.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hey,

Quoting Peter Korsgaard <jacmet@uclibc.org>:
>>>>>> "Heiko" == Heiko Zuerker <heiko@zuerker.org> writes:
>  >> Could you detail why that specific behaviour on NFS is causing
>  >> problems ?
>
>  Heiko> (A rather lengthy explanation)
>
>  Heiko> My situation is a bit different than most people using buildroot.
>  Heiko> I'm trying to use buildroot for a full blown, security  
> focused distribution.
>  Heiko> Since Devil-Linux is already well established, I have to  
> reproduce the
>  Heiko> current features.
>
>  Heiko> Busybox is only used as a static binary in the initramfs to  
> initialize
>  Heiko> the system, find the configuration and the distribution media.
>
>  Heiko> We're using the full blown glibc and busybox can't be statically
>  Heiko> compiled if nfs support is on, since it needs it for dns resolution.
>
> So your problem is basically that you're trying to do static linking
> with glibc, which is known to not work very well, and is considered
> deprecated by the glibc developers
> (http://www.akkadia.org/drepper/no_static_linking.html). Wouldn't it
> make more sense to use uclibc for the initramfs, or alternatively use
> dynamic linking?

It wouldn't be possible too just compile busybox with uclibc and the  
rest of the apps with glibc, correct?
I could rewrite the initramfs support to work with shared libs. All it  
takes is a little routine to find all the required libraries and copy  
them over. I'll take a look at this later today.

>  Heiko> This may cause other people more issues. I'm sure not everybody can
>  Heiko> used the provided config files and has to do some minor adjustments,
>  Heiko> but still relies on some of the auto-config features.
>
> Yes, I don't like extra (inconsistent) magic.

:-)

-- 

Regards
   Heiko Zuerker
   http://www.devil-linux.org


----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.
