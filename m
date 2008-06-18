From: Bernhard Fischer <rep.dot.nop@gmail.com>
Date: Wed, 18 Jun 2008 20:29:46 +0200
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/gcc
In-Reply-To: <871w2uy675.fsf@macbook.be.48ers.dk>
References: <20080618154253.7A97E3C744@busybox.net>
	<d6cda7730806180933n1407f717s4c2596bcc5f28bcf@mail.gmail.com>
	<871w2uy675.fsf@macbook.be.48ers.dk>
Message-ID: <20080618182946.GR10734@mx.loc>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Jun 18, 2008 at 07:59:58PM +0200, Peter Korsgaard wrote:
>>>>>> "Thiago" == Thiago A Corr?a <thiago.correa@gmail.com> writes:
>
> >> config BR2_GCC_VERSION_4_0_4
> >> -               depends !BR2_avr32 && !BR2_nios2
> >> -               depends BR2_DEPRECATED
> >> +               depends on !BR2_avr32 && !BR2_nios2
> >> +               depends on BR2_DEPRECATED
> >> bool "gcc 4.0.4"
>
> Thiago> Hi Peter,
>
> Thiago>     I'm not familiar with the kconfig details. Is there a
> Thiago> difference between depends and depends on? Or is it just
> Thiago> syntax sugar?
>
>According to Documentation/kbuild/kconfig-language.txt in the kernel
>sources, the correct syntax is 'depends on', we were just lucky that
>the Kconfig parser was forgiving on this.

ACK. If you guys ever update to visualise "selects" et al better then
all of them need fixing. Needless to say that the git repo
( http://repo.or.cz/w/buildroot ) already has all this..
