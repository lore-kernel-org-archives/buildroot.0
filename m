From: Sven Oliver Moll <buildroot@svol.li>
Date: Sat, 14 Nov 2020 16:05:39 +0100 (CET)
Subject: [Buildroot] kernel module from BR2_EXTERNAL-layer does not
 build automatically
In-Reply-To: <87zh3k83t0.fsf@dell.be.48ers.dk>
References: <alpine.DEB.2.20.2011131229170.5784@defender.svolli.xa>
 <87zh3k83t0.fsf@dell.be.48ers.dk>
Message-ID: <alpine.DEB.2.20.2011141602231.5784@defender.svolli.xa>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sat, 14 Nov 2020, Peter Korsgaard wrote:

>>>>>> "Sven" == Sven Oliver Moll <buildroot@svol.li> writes:
>
> > Hello,
> > for a private project, I have implemented a kernel module as a package
> > in a BR2_EXTERNAL-defined layer. It's rather simple as
> > lttng-modules. When I build it using "make kernel-package", it gets
> > installed in target/... just fine, but if I make a clean build, the
> > package will not be compiled and not be installed almost like it's not
> > selected in .config at all, even though it is.
>
> > Any idea what's causing this, and how I could workaround this problem?
> > It happens on 2020.02.6 as well as 2020.08. Even a hint on what to
> > investigage would help.
>
> It sounds like the variable in your Config.in file doesn't match the
> directory/filename of the .mk file, but it is hard to tell without more
> details.

That was it! I had a typo in the .mk file, which I corrected. But I never 
took a look, if the I copy/pasted that typo from/to Config.in.


Thanks,
SvOlli
-- 
|  _______       |
| (  /\          | You're never more alone than the first time someone puts
|__)v\/lli a.k.a.| a gun to your favorite head and asks you to dance.
|Sven Oliver Moll|   -- Andromeda S3E04, "Cui Bono"
