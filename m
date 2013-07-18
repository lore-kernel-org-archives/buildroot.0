From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 18 Jul 2013 23:39:45 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain: instrument external
 toolchain wrapper
In-Reply-To: <20130718233256.39fc8342@skate>
References: <cover.1374182572.git.yann.morin.1998@free.fr>
 <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
 <20130718233256.39fc8342@skate>
Message-ID: <20130718213945.GD3417@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas, All,

On 2013-07-18 23:32 +0200, Thomas Petazzoni spake thusly:
> I like the feature, but it would be nice if the coding was more
> consistent with the rest of the code, see below:

Sure! :-)

It initially was a quick'n'dirty hack, and I eventually thought it might
be useful upstream too. I'll re-read my code better next time... :-/

> On Thu, 18 Jul 2013 23:24:15 +0200, Yann E. MORIN wrote:
> > +	if( getenv("BR_DEBUG_WRAPPER") ) {
> No space after ( and before ).

Ack.

> > +		fprintf( stderr, "path='%s'\n", path );
> Dirro.

Ditto?
Ditto! ;-)

> > +		int i;
> Variable declaration in the middle of the code. I know it's C99 ok, but
> I'd prefer not to have that (just like the kernel).

Doh. Right.

gcc also whines about this (which was my original code):
	for( int i=0; args[i]; i++ ) {

> > +		for( i=0; args[i]; i++ ) {
> 		for (i = 0; args[i]; i++)

Ack.

> > +			fprintf(stderr, "argv[%d]='%s'\n", i, args[i] );
> Ditto space before ).

Atta! I'll fix and respin. Thanks! :-)

Regsards,
Yann E. MORIN.

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 223 225 172 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
