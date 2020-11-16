From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 16 Nov 2020 09:16:33 +0100
Subject: [Buildroot] [PATCH 1/2] package/python3: uClibc-ng doesn't set
 errno when encryption method is not available
In-Reply-To: <b432cd28-e33b-5d9e-d0c2-1b23e4ba2e06@gmail.com>
References: <20201111233429.2245255-1-romain.naour@gmail.com>
 <87lff6i7nu.fsf@dell.be.48ers.dk>
 <b432cd28-e33b-5d9e-d0c2-1b23e4ba2e06@gmail.com>
Message-ID: <20201116081633.GB21431@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
Romain Naour wrote,

> Hello,
> 
> Le 12/11/2020 ? 22:31, Peter Korsgaard a ?crit?:
> >>>>>> "Romain" == Romain Naour <romain.naour@gmail.com> writes:
> > 
> >  > Since commit [1] in cpython, an exception is raised when an encryption method
> >  > is not available. This eception is handled only if errno is set to EINVAL by
> >  > crypt() but uClibc-ng doesn't set errno in crypt() [2].
> > 
> >  > Fixes:
> >  > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981961
> >  > https://gitlab.com/buildroot.org/buildroot/-/jobs/830981979
> > 
> >  > [1] https://github.com/python/cpython/commit/0d3fe8ae4961bf551e7d5e42559e2ede1a08fd7c
> >  > [2] https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libcrypt/crypt.c?h=v1.0.36#n29
> > 
> >  > Signed-off-by: Romain Naour <romain.naour@gmail.com>
> > 
> > I've applied this for master to fix the issue for 2020.11, but it would
> > really be good if uClibc-ng could be fixed to set errno to something
> > sensible.
> 
> Waldemar, maybe we can just uncomment __set_errno(EINVAL); ?
> 
> https://cgit.uclibc-ng.org/cgi/cgit/uclibc-ng.git/tree/libcrypt/crypt.c?h=v1.0.36#n29

Okay,

best regards
 Waldemar
