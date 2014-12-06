From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 6 Dec 2014 20:26:20 +0100
Subject: [Buildroot] [PATCH 1/3 v3] package/mke2img: new package
In-Reply-To: <20141206192032.7f46d261@free-electrons.com>
References: <cover.1417868913.git.yann.morin.1998@free.fr>
 <7e35d73bbeb1b9e6d4cc1b1a3142fbfa4ab572d7.1417868913.git.yann.morin.1998@free.fr>
 <20141206192032.7f46d261@free-electrons.com>
Message-ID: <20141206192620.GE9544@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2014-12-06 19:20 +0100, Thomas Petazzoni spake thusly:
> On Sat,  6 Dec 2014 13:29:44 +0100, Yann E. MORIN wrote:
> > This new script is highly modeled from the existing genext2fs.sh, but
> > was slightly refreshed, and a new, supposedly sane set of options has
> > been choosen for the features we need (see above), and some new options
> > were added, too, rather than relying on the arguments order or
> > environment variables:
> >   -b <nb-blocks>    number of blocks in the filesystem
> >   -i <nb-inodes>    number of inodes in the filesystem
> >   -r <pc-reserved>  percentage of reserved blocks
> > * -d <root-dir>     directory containing the root of the filesystem
> > * -o <img-file>     output image file
> > * -G <ext-gen>      extfs generation: 2, 3, or 4
> > * -R <ext-rev>      ext2 revision: 0 or 1 (1 is assumed for ext3 and ext4)
> >   -l <label>        filesystem label
> >   -u <uid>          filesystem UUID; if not specified, a random one is used
> > 
> > * Mandatory options
> 
> What about putting this in a "help" of the mke2img tool, or at least in
> the comment header at the beginning of the script?

Ack.

> > +    # genext2fs does not generate a UUID, but fsck will whine if one is
> > +    # is missing, so we need to add a UUID.
> 
> duplicate "is".

Ack.

> > +    # Of course, this has to happend _before_ we run fsck.
> 
> happend -> happen

Ack.

> > +    # Also, some ext4 metadata are based on the UUID, so we must
> > +    # set it before we can convert the filesystem to ext4.
> > +    # If the user did not specify a UUID, we generate a random one.
> > +    # Although a random UUID may seem bad for reproducibility, there
> > +    # already are so many things that are not reproducible in a
> 
> s/already are/are already/

Nak. Positioning adverbs before the verb is a way emphasise the effects
of the adverb. See for instance:
    https://learnenglish.britishcouncil.org/en/english-grammar/adverbials/where-they-go-sentence

    [...]
    But if we want to emphasise an adverbial we can put it at the
    beginning of a clause
    [...]

> Tested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Thanks! I'll fix and respin later.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
