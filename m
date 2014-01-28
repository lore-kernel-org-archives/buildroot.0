From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 28 Jan 2014 22:28:10 +0100
Subject: [Buildroot] [git commit] minidlna: fix static linking
In-Reply-To: <87sis72476.fsf@dell.be.48ers.dk>
References: <20140108082945.20CF58DE52@busybox.osuosl.org>
 <20140128221653.6fc8974b@skate> <87sis72476.fsf@dell.be.48ers.dk>
Message-ID: <20140128222810.301bb174@skate>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter Korsgaard,

On Tue, 28 Jan 2014 22:21:01 +0100, Peter Korsgaard wrote:

>  >> -# static build is broken w.r.t libgcc_s
>  >> +ifeq ($(BR2_PREFER_STATIC_LIB),y)
>  >> +# the configure script / Makefile forgets to link with some of the dependent
>  >> +# libraries breaking static linking, so help it along
>  >> +MINIDLNA_CONF_ENV = \
>  >> +	LIBS='-lavformat -lavcodec -lavutil -logg -lz -lpthread -lm'
>  >> +else
> 
>  > I know we're doing this in a bunch of cases, but I believe we should
>  > rather fix the package itself, rather than encoding into the
>  > Buildroot .mk file the list of libraries to link with. Because if
>  > libogg or libavutil becomes unnecessary in a future version of
>  > minidlna, we may not notice, and still link needlessly against them.
> 
> True. Patches are welcome ;)

Well. When the static linking requires such weirdness to fix upstream
breakage, and nobody cares about linking statically the package, then
marking it as depends on !BR2_PREFER_STATIC_LIB is probably a better
solution.

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
