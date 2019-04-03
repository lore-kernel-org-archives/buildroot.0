From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 03 Apr 2019 22:17:35 +0200
Subject: [Buildroot] Failed to build in a user namespace without the
 root user
In-Reply-To: <CA+gSDyT9ReuV4VxZc_3U3zspS8SeBbNzNFXqbLVrSComcgn8-w@mail.gmail.com>
 (Esben Nielsen's message of "Wed, 3 Apr 2019 17:46:45 +0200")
References: <CA+gSDyRCnG0HuJ4QVsFoROqCHBkn+MR7H39BQBmzHfHRm2B5gA@mail.gmail.com>
 <87ftr0gsgo.fsf@dell.be.48ers.dk>
 <CA+gSDyT9ReuV4VxZc_3U3zspS8SeBbNzNFXqbLVrSComcgn8-w@mail.gmail.com>
Message-ID: <87zhp6etcw.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Esben" == Esben Nielsen <nielsen.esben@gmail.com> writes:

 > Without FAKEROOTDONTTRYCHOWN it ends up in the kernel, which does a
 > lookup in the current user namespace and looks for uid 0 - which is
 > not there. Then it returns EINVAL, not EPERM.
 > When I set FAKEROOTDONTTRYCHOWN (from outside buildroot), I don't get that.

 > Hints how to reproduce:

 > bwrap --bind / / --uid 1000 --gid 1000 --dev /dev <make command>

 > bwrap 0.3.0 is compiled as user without suid bit set.

Ok, thanks. I've send a patch with a more detailed commit message doing
just that. Can you give it a try?

https://patchwork.ozlabs.org/patch/1076377/

-- 
Bye, Peter Korsgaard
