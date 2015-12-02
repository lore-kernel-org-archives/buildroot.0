From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 2 Dec 2015 23:03:20 +0100
Subject: [Buildroot] [PATCH 1/4] dhrystone: add a hash file
In-Reply-To: <87poyofulj.fsf@dell.be.48ers.dk>
References: <1449059383-62131-1-git-send-email-Vincent.Riera@imgtec.com>
 <87poyofulj.fsf@dell.be.48ers.dk>
Message-ID: <20151202220320.GJ5773@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter, Vicente, All,

On 2015-12-02 21:45 +0100, Peter Korsgaard spake thusly:
> >>>>> "Vicente" == Vicente Olivert Riera <Vincent.Riera@imgtec.com> writes:
> 
>  > Signed-off-by: Vicente Olivert Riera <Vincent.Riera@imgtec.com>
>  > ---
>  >  package/dhrystone/dhrystone.hash | 2 ++
>  >  1 file changed, 2 insertions(+)
>  >  create mode 100644 package/dhrystone/dhrystone.hash
> 
>  > diff --git a/package/dhrystone/dhrystone.hash b/package/dhrystone/dhrystone.hash
>  > new file mode 100644
>  > index 0000000..9ea22a3
>  > --- /dev/null
>  > +++ b/package/dhrystone/dhrystone.hash
>  > @@ -0,0 +1,2 @@
>  > +# Locally calculated
>  > +sha256 038a7e9169787125c3451a6c941f3aca5db2d2f3863871afcdce154ef17f4e3e  dhry-c
> 
> Hmm, what are we going to do if this file ever changes?

That's a good question...

Since ultimately I'd like we get hash files for the packages, and make
it an error when the hash file is missing, we'd have to handle those
cases in a consistent way.

There are two options here:

  - add a real hash, and break older releases when the file is updated
    upstream,

  - add a 'none' hash, but loose the detection tht upstream has changed
    (but the autobuilders would tell us if that change breaks the
    build).

I'm afraid the only possible solution if we want to have a hash is the
second solution (but with a comment explaning why it is so).

But until we make the .hash files mandatory, we can just not add it for
non-versioned upstreams. So I'd say we drop that one.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
