From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 10 Mar 2014 14:23:50 +0100
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-03-07
In-Reply-To: <87y50is15m.fsf@dell.be.48ers.dk>
References: <20140308073007.50AAF1016F2@stock.ovh.net>	<20140308110454.GA3254@free.fr>
 <20140308150515.467d5568@skate>	<531D5F01.8080106@mind.be>
 <87y50is15m.fsf@dell.be.48ers.dk>
Message-ID: <531DBCE6.9030007@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/03/14 13:12, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >  Maybe the timeout can be made to depend on the number of packages
>  > selected in the .config? Like 5 minutes per package (and a minimum of
>  > 1 hour)?
> 
>  >  Or you could add an hour to the timeout if Webkit is selected...
> 
> Does the build often get stuck? I don't recall seing it more than a few
> times on "my" builders. In my (simplistic) autobuilder script I simply
> do:
> 
> # ensure machine isn't DOS'ed
> ulimit -S -t 4000 -v 2000000
> 
> E.G. limit memory and cpu time
> 

 The build doesn't really get stuck (at least, as far as we can see). It
just times out before it finishes. The cases I've looked at all end in
the middle of a Webkit build, and the webkit package is started something
like half an hour before the build is killed. Half an hour for webkit is
not exaggerated for a not-too-fast machine.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
