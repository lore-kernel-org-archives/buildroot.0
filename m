From: Ralph Siemsen <ralphs@netwinder.org>
Date: Sun, 15 Sep 2013 09:37:09 -0400
Subject: [Buildroot] [PATCH v2] apply-patches.sh: detect missing patches
In-Reply-To: <20130913182702.GB3301@free.fr>
References: <CAAXf6LXBHm7nG__780PqUaO+v9+4j2KON7UO0dw4Ej2qC3=XGg@mail.gmail.com>
 <CAAXf6LV9HPWdzqV_F5zQ+aABtVxZGRRkhDszF2Qx8vyXMb+PhA@mail.gmail.com>
 <20130905100459.13173009@skate> <5228425A.7090502@lucaceresoli.net>
 <20130905140135.GC3136@free.fr>
 <CAAXf6LWWnb5xQUtZA8p3kgoU2et-kD6x9TzyzXykgNbxdsuv+Q@mail.gmail.com>
 <20130911120630.GA14745@harvey.netwinder.org>
 <CAAXf6LX7o9P1tXv3Egk8By-VbzarRYe5JRyTh5+3wYNBz9Z6aQ@mail.gmail.com>
 <20130913181527.GA11933@harvey.netwinder.org>
 <20130913182702.GB3301@free.fr>
Message-ID: <20130915133709.GA16826@harvey.netwinder.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, Sep 13, 2013 at 08:27:02PM +0200, Yann E. MORIN wrote:
> > 
> > diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
> > index 7d5856c..d6e8983 100755
> > --- a/support/scripts/apply-patches.sh
> > +++ b/support/scripts/apply-patches.sh
> > @@ -70,13 +70,17 @@ function apply_patch {
> >  	*.patch*)
> >  	type="patch"; uncomp="cat"; ;;
> >  	*)
> > -	echo "Unsupported format file for ${patch}, skip it";
> > -	return 0;
> > +	echo "Unsupported format file for ${path}/${patch}";
> > +	return 1;
> 
> I was a bit surprised to read that you used "return 1" here, rather than
> a more explicit "exit 1".

As you mentioned, both "return" and "exit" work here, so I opted for the
lesser change, figuring it would be less controversial ;)

> This is not really straightforward. Just remove the "|| exit 1" and
> change all the "return 1" into "exit 1", so the script really errors out
> right away.

I'll submit v3 with that fixed.

-R
