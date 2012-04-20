From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri, 20 Apr 2012 07:22:28 -0300
Subject: [Buildroot] Samba breakage on arm
In-Reply-To: <87r4viiutw.fsf@macbook.be.48ers.dk>
References: <4F9118BB.2010300@free-electrons.com>
 <87r4viiutw.fsf@macbook.be.48ers.dk>
Message-ID: <ca7f66dfcd487e0887c409c3ccb7e443@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2012-04-20 07:03, Peter Korsgaard wrote:

> It built with the internal toolchain on gcc10 recently without 
> problems:
>
> 
> http://autobuild.buildroot.org/results/ce801288dbf24fc394116636d0562effc6b4eace/defconfig
>
> That's pretty much the problem with these binary toolchains. There's 
> not
> much we can do about this compiler bug (besides removing the older
> versions)

I've gave it some testing runs here on real targets.
As Peter did, i've tested with an internal toolchain since there's not 
much we can do to fix internal compiler errors with external ones (other 
than doing ugly kludges in the packages themselves).
The only crazy option to fix this would be to roll back to samba 3.5.12 
and just apply the security patch, but again, 3.5.13 fixes various 
crashing bugs over 3.5.12 
(http://www.samba.org/samba/history/security.html for patches/details).
I wouldn't mainstream that though, just a possible local workaround if 
someone is interested.
Regards.
