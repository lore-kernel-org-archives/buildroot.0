From: Florian Huber <florian.huber@lindoze.net>
Date: Tue, 11 Mar 2008 20:21:58 +0100
Subject: [Buildroot] $(ARCH) not set & mirrors
In-Reply-To: <87lk4py797.fsf@macbook.be.48ers.dk>
References: <1205178237.10692.178.camel@nigel-x60>	<878x0q2uyr.fsf@macbook.be.48ers.dk>	<1205216387.10692.185.camel@nigel-x60>	<871w6hznbg.fsf@macbook.be.48ers.dk>	<1205224708.10692.195.camel@nigel-x60>
	<87lk4py797.fsf@macbook.be.48ers.dk>
Message-ID: <47D6DBD6.5010105@lindoze.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
my problem with selecting the "geode" target and having no $(ARCH) is
not fixed. It could be fixed by just adding another line like  Nigel did:
 	default "i586"		if BR2_x86_geode

BUT it does not make sence anyway because the 4.2.x gcc does not support
the arch=geode or tune=geode yet. So I get errors when the gcc
./configure is executed.
Only work-around is to use a generic i586 target.

Cheers,
Florian

Peter Korsgaard wrote:
>>>>>> "Nigel" == Nigel Kukard <nkukard@lbsd.net> writes:
> 
> Hi,
> 
>  >> Thanks. Committed except for the hunk changing the fakeroot
>  >> version. Please don't mix multiple changes in the same patch.
> 
>  Nigel> Blast ... sorry. I'll be more careful.
> 
> Great ;)
> 
>  Nigel> Patch attached for fixing of ARCH not being defined when
>  Nigel> selecting some x86 target arch variants.
> 
> Thanks - Applied.
> 
