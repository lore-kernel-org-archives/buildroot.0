From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 19 Apr 2015 11:13:53 +0200
Subject: [Buildroot] [PATCH 1/8 v4] package/gcc: add hashes
In-Reply-To: <552C5209.7040504@mind.be>
References: <cover.1428512075.git.yann.morin.1998@free.fr>
 <f78c5a1a3e8998f0e32d08fc7c5a63dea083f4c4.1428512075.git.yann.morin.1998@free.fr>
 <552C5209.7040504@mind.be>
Message-ID: <20150419091353.GE4313@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout, All,

On 2015-04-14 01:32 +0200, Arnout Vandecappelle spake thusly:
> On 08/04/15 18:57, Yann E. MORIN wrote:
> > Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
> > cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > Cc: Gustavo Zacarias <gustavo@zacarias.com.ar>
> > Cc: Arnout Vandecappelle <arnout@mind.be>
> > ---
> >  package/gcc/gcc-final/gcc-final.hash     | 1 +
> >  package/gcc/gcc-initial/gcc-initial.hash | 1 +
> >  package/gcc/gcc.hash                     | 7 +++++++
> >  3 files changed, 9 insertions(+)
> >  create mode 120000 package/gcc/gcc-final/gcc-final.hash
> >  create mode 120000 package/gcc/gcc-initial/gcc-initial.hash
> >  create mode 100644 package/gcc/gcc.hash
> > 
> > diff --git a/package/gcc/gcc-final/gcc-final.hash b/package/gcc/gcc-final/gcc-final.hash
> > new file mode 120000
> > index 0000000..7ac9361
> > --- /dev/null
> > +++ b/package/gcc/gcc-final/gcc-final.hash
> > @@ -0,0 +1 @@
> > +../gcc.hash
> > \ No newline at end of file
> > diff --git a/package/gcc/gcc-initial/gcc-initial.hash b/package/gcc/gcc-initial/gcc-initial.hash
> > new file mode 120000
> > index 0000000..7ac9361
> > --- /dev/null
> > +++ b/package/gcc/gcc-initial/gcc-initial.hash
> > @@ -0,0 +1 @@
> > +../gcc.hash
> > \ No newline at end of file
> > diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
> > new file mode 100644
> > index 0000000..d9a04fc
> > --- /dev/null
> > +++ b/package/gcc/gcc.hash
> > @@ -0,0 +1,7 @@
> > +# Locally computed (upstream only has sigs):
> 
>  Which upstream is that?

For gcc-4.9.2, I went there: https://ftp.gnu.org/pub/gnu/gcc/gcc-4.9.2/

Similarly for other versions.

> # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.5.4/sha512.sum
> sha512	78696b287d46aacd6f150920da376ea32f58ad9f0dafd2d3b7fa6dbdd8dd7afe659108d1dfaa5807617fc5248719f50b39c37ade0173ea5b9fec2091f4656115	gcc-4.5.4.tar.bz2
> # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.7.4/sha512.sum
> sha512	dfcb737073191e628231031a3571ec77ee760a59377630f4a6e4fdfa66f9ddad39fde47e3f0f227eb43cdf90e0d34cde5abdc9ac892c1e111a911062a66c9189	gcc-4.7.4.tar.bz2
> # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.8.4/sha512.sum
> sha512	b4c84ebd754c026029d706ef52c4242df4dcadc6a22cc5669b3aa37ac9dc25bc9cd9651fda83fb24dd5d17b1710e6865a35bb6c5cd9b95d0971717453935ae8e	gcc-4.8.4.tar.bz2
> # From ftp://gcc.gnu.org/pub/gcc/releases/gcc-4.9.2/sha512.sum
> sha512	e96cba06d572dbe7f382a2b00fd9297dcf9f9219d46a9ad0bd904dc36d5e7db3335e422640b79a27fed6fde91b0731732b94a0e2fbcd47344d6779f8ba1f4f9c	gcc-4.9.2.tar.bz2

OK, I'll use the gcc.gnu.org as the source for hashes.

Ditto for binutils (your comment on my next patch).

Thanks! :-)

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
