From: Ismael Luceno <ismael@iodev.co.uk>
Date: Sat, 27 Mar 2021 23:23:16 +0100
Subject: [Buildroot] [PATCH] package/libressl: security bump to 3.2.5
In-Reply-To: <87pmzlilco.fsf@dell.be.48ers.dk>
References: <20210320230337.1841-1-ismael@iodev.co.uk>
 <87pmzlilco.fsf@dell.be.48ers.dk>
Message-ID: <20210327222316.GA11394@pirotess>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 26/Mar/2021 23:47, Peter Korsgaard wrote:
> >>>>> "Ismael" == Ismael Luceno <ismael@iodev.co.uk> writes:
> 
>  > It includes the following bug fix:
>  >  * A TLS client using session resumption may cause a use-after-free.
> 
>  > https://ftp.openbsd.org/pub/OpenBSD/LibreSSL/libressl-3.2.5-relnotes.txt
> 
>  > Signed-off-by: Ismael Luceno <ismael@iodev.co.uk>
> 
> Committed to 2020.11.x and 2021.02.x, thanks.
> 
> It it not really clear to me if this is only an issue in 3.2.x /
> TLSv1.3?

AFAICT, it's covered; 3.1 branch is unaffected, the field causing the issue
was introduced in the 3.2 branch. BTW, 3.3.1 also seems to be affected.
