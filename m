From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 5 Jul 2014 00:15:22 +0200
Subject: [Buildroot] [PATCH 1/4] pkg-infra: don't use DL_DIR as
 scratchpad for temporary downloads
In-Reply-To: <87ionc4xkl.fsf@dell.be.48ers.dk>
References: <cover.1404416102.git.yann.morin.1998@free.fr>
 <b8b52d0b281975ef0005ff0fe7c2313dbb42e540.1404416102.git.yann.morin.1998@free.fr>
 <87ionc4xkl.fsf@dell.be.48ers.dk>
Message-ID: <20140704221522.GB18673@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, All,

On 2014-07-04 23:35 +0200, Peter Korsgaard spake thusly:
> >>>>> "Yann" == Yann E MORIN <yann.morin.1998@free.fr> writes:
> 
>  > DL_DIR can be a very precious place for some users: they use it to store
>  > all the downloaded archives to share across all their Buildroot (and
>  > maybe non-Buildroot) builds.
> 
>  > We do not want to trash this location with our temporary downloads (e.g.
>  > git, Hg, svn, cvs repository clones/checkouts, or wget, bzr tep tarballs).
> 
>  > Turns out that we already have some kind of scratchpad, the BUILD_DIR.
>  > Although it is not really a disposable location, that's the best we have
>  > so far.
> 
>  > Also, we create the temporary tarballs with mktemp using the final tarrball,
> 
> s/tarrball/tarball/
> 
>  > ---
>  > Change v7 -> v8:
>  >   - use a cleaner and saner code path to detect errors
>  >   - convert the cp and scp helpers, too  (Thomas DS)
> 
> Committed, thanks.
> 
> I think it would be good to either delay the creation of tmp_output
> until just before it it used and/or cleanup on errors to not end up with
> a bunch of odd named temporary files in DL_DIR, but that can be added
> later.

As discussed on IRC: "yeah, probably, yes."
I'll cook up a patch.

Thanks.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
