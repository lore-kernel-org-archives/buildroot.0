From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 24 Apr 2017 22:59:34 +0200
Subject: [Buildroot] [PATCH 1/1] busybox: preserve ncurses progs/tools
In-Reply-To: <87o9vlvc3k.fsf@dell.be.48ers.dk>
References: <1492140047-60102-1-git-send-email-matthew.weber@rockwellcollins.com>
 <4e5df153-6f58-8b65-faf4-f87fb91324cd@mind.be>
 <20170420092015.3b2f7fbd@free-electrons.com>
 <87pog3ypb1.fsf@dell.be.48ers.dk>
 <8b127902-0268-8307-70da-065362773da9@mind.be>
 <87o9vlvc3k.fsf@dell.be.48ers.dk>
Message-ID: <62a64c3e-7080-ee9c-cd96-33ad8012c779@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 24-04-17 21:29, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >  Of course, we can also choose to apply solution 3 only to the situation where 1
>  > doesn't work because of circular dependencies.
> 
>  >  I can't say which solution is the best. I therefore tend to say: stick to what
>  > we have, and find a workaround if needed. In other words, apply this patch, but
>  > don't do it for other packages until required.
> 
> I'm in the same boat - So agreed!

 Well, as Danomi indicated, the current situation is in fact choice 2 (busybox
doesn't overwrite the apps so the order doesn't matter) and not choice 1. So in
fact we can simply remove all the dependencies on busybox.

 Anyone feel up to it?

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
