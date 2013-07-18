From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 18 Jul 2013 23:32:56 +0200
Subject: [Buildroot] [PATCH 4/4] toolchain: instrument external
 toolchain wrapper
In-Reply-To: <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
References: <cover.1374182572.git.yann.morin.1998@free.fr>
 <574ef0eb7e941dcc6c9dba3540f4aa1c213472bc.1374182572.git.yann.morin.1998@free.fr>
Message-ID: <20130718233256.39fc8342@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Yann E. MORIN,

I like the feature, but it would be nice if the coding was more
consistent with the rest of the code, see below:

On Thu, 18 Jul 2013 23:24:15 +0200, Yann E. MORIN wrote:

> +	if( getenv("BR_DEBUG_WRAPPER") ) {

No space after ( and before ).

> +		fprintf( stderr, "path='%s'\n", path );

Dirro.

> +		int i;

Variable declaration in the middle of the code. I know it's C99 ok, but
I'd prefer not to have that (just like the kernel).

> +		for( i=0; args[i]; i++ ) {

		for (i = 0; args[i]; i++)

> +			fprintf(stderr, "argv[%d]='%s'\n", i, args[i] );

Ditto space before ).

Thomas
-- 
Thomas Petazzoni, Free Electrons
Kernel, drivers, real-time and embedded Linux
development, consulting, training and support.
http://free-electrons.com
