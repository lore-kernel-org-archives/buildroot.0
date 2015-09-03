From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 3 Sep 2015 12:43:26 +0200
Subject: [Buildroot] [PATCHv5 4/4] docs/manual: add section about size
 graphing
In-Reply-To: <20150903103700.GD3689@free.fr>
References: <1441228505-23235-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1441228505-23235-5-git-send-email-thomas.petazzoni@free-electrons.com>
 <20150903103700.GD3689@free.fr>
Message-ID: <20150903104326.GE3689@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2015-09-03 12:37 +0200, Yann E. MORIN spake thusly:
> Thomas, All,
> 
> On 2015-09-02 23:15 +0200, Thomas Petazzoni spake thusly:
> > Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
> > ---
> >  docs/manual/common-usage.txt | 40 ++++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 40 insertions(+)
> > 
> > diff --git a/docs/manual/common-usage.txt b/docs/manual/common-usage.txt
> > index 5b27b1f..24f1d0b 100644
> > --- a/docs/manual/common-usage.txt
> > +++ b/docs/manual/common-usage.txt
> > @@ -273,6 +273,46 @@ only other format supported is PNG:
> >  BR2_GRAPH_OUT=png make graph-build
> >  ----------------
> >  
> > +=== Graphing the filesystem size contribution of packages
> > +
> > +When your target system grows, it is sometimes useful to understand
> > +how much each Buildroot package is contributing to the overall root
> > +filesystem size. To help with such an analysis, Buildroot collects
> > +data about the files each package install and generate graphs and CSVs
> 
> generates
> 
> > +files detailing the size contribution of each package.
> > +
> > +To generate these data after a build, run:
> > +
> > +----------------
> > +make size-stats
> 
> If you change the name of the target in the previous patch, do not
> forget to update the manual accordingly.
> 
> > +----------------
> > +
> > +This will generate:
> > +
> > +* +output/graphs/graph-size+, a pie chart of the contribution of each
> > +  package to the overall root filesystem size
> 
> Nope, it did not generate that file. I guess you meant 'graph-size.pdf'.
> 
> > +* +output/build/package-size-stats.csv+, a CSV file giving the size
> > +  contribution of each package to the overall root filesystem size
> 
> Ditto, that was not generated.

Sorry, ditch that comment. It *was* generated.

It's just that I only looked at the base filename, and expected it in
the graphs/ sub-dir, not in build/ . That's by looking at patch 3 that I
noticed they were put in there.

I think it makes more sense to put those .csv files in the graphs/
sub-dir.

> > +* +output/build/file-size-stats.csv+, a CSV file giving the size
> > +  contribution of each installed file to the package it belongs, and
> > +  to the overall filesystem size.
> 
> Ditto, that file was not generated.

Ditto.

Regards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
