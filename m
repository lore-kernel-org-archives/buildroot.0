From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 15 Jul 2015 11:05:38 +0200
Subject: [Buildroot] [PATCH 1/1] toolchain: create symlink to 'lib' from
 ARCH_LIB_DIR iso fixed lib32/lib64
In-Reply-To: <20150715105950.42ac4b53@free-electrons.com>
References: <1436949545-12487-1-git-send-email-patrickdepinguin@gmail.com>
 <20150715105526.19c500e8@free-electrons.com>
 <CAAXf6LXzu+j-xV7nPx200Tj8NAt6x_yrOoOjiEJpZGrCUmkB9g@mail.gmail.com>
 <20150715105950.42ac4b53@free-electrons.com>
Message-ID: <55A62262.1090304@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 07/15/15 10:59, Thomas Petazzoni wrote:
> Hello,
> 
> On Wed, 15 Jul 2015 10:57:52 +0200, Thomas De Schampheleire wrote:
> 
>> Well that is part of the discussion: conceptually I believe that the
>> symlink creation is part of the toolchain as a whole. It needs to be
>> done before libc, but actually all remaining toolchain components will
>> probably rely on it, and also the packages.
>> By placing it in gcc-initial I believe it is pretty hidden.
> 
> It is also pretty hidden to put the hook for a given package outside of
> this package .mk file.
> 
>> Moreover, suppose we add support for the llvm/clang compiler. For such
>> toolchains, we'd also need the symbolic links, so that code would have
>> to be duplicated...
> 
> I don't think trying to take llvm/clang into account really makes sense
> here. It's probably going to be so much different than what we have
> today that lots of things would have to be reworked anyway.

 Just to be clear: for me this is a bikeshedding discussion. Neither is right,
so just go for one.

 BTW, yesterday I did ask everyone in Toulouse if it would be OK have add to the
gcc-final hook from toolchain-buildroot.mk, and nobody really opposed (though I
don't think you really said anything, ThomasP).

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
