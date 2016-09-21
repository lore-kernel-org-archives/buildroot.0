From: =?ISO-8859-1?Q?J=F6rg?= Krause <joerg.krause@embedded.rocks>
Date: Wed, 21 Sep 2016 22:35:09 +0200
Subject: [Buildroot] [PATCH] package/libxslt: fix bfin compile
In-Reply-To: <87intpro38.fsf@dell.be.48ers.dk>
References: <20160921202107.32301-1-joerg.krause@embedded.rocks>
 <87intpro38.fsf@dell.be.48ers.dk>
Message-ID: <1474490109.2295.0.camel@embedded.rocks>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mi, 2016-09-21 at 22:32 +0200, Peter Korsgaard wrote:
> > 
> > > 
> > > > 
> > > > > 
> > > > > > 
> > > > > > "J?rg" == J?rg Krause <joerg.krause@embedded.rocks> writes:
> 
> ?> A GCC bug is triggered when the compiler is run with an
> optimization level
> ?> '-Os/-O2/-O3' for the Blackfin architecture:
> 
> ?> ```
> ?> error: unable to find a register to spill in class 'CCREGS'
> ?> ```
> 
> ?> Workaround this bug by forcing an optimization level of '-O1' when
> building
> ?> libxslt for the Blackfin architecture.
> 
> ?> See GCC bug report:
> ?> https://gcc.gnu.org/bugzilla/show_bug.cgi?id=77311
> 
> ?> Signed-off-by: J?rg Krause <joerg.krause@embedded.rocks>
> 
> Committed after adding references to the autobuilder failures,
> thanks.

Oh, I did it in v2, too. Thanks!
