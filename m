From: Arnout Vandecappelle <arnout@mind.be>
Date: Fri, 18 Apr 2014 18:27:47 +0200
Subject: [Buildroot] [autobuild.buildroot.net] Build results for
	2014-04-10
In-Reply-To: <87r4543r0z.fsf@dell.be.48ers.dk>
References: <20140411063008.70B85100F1F@stock.ovh.net>
 <87d2go5oz3.fsf@dell.be.48ers.dk> <20140411093044.07729d79@skate>
 <87y4zc47il.fsf@dell.be.48ers.dk>
 <20140411065158.0a9308de@core2quad.morethan.org>
 <20140411141346.49e1251a@skate> <20140411123931.GZ4096@tarshish>
 <20140411145923.21a38b08@skate> <87r4543r0z.fsf@dell.be.48ers.dk>
Message-ID: <53515283.5060106@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 11/04/14 16:00, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Aah, exactly! Except that the download was not interrupt by doing a
>  > Ctrl+C, and it's actually wget which retried the download. And:
> 
>  > 2014-04-08 04:27:12 (3.70 MB/s) - Connection closed at byte 1057288. Retrying.
> 
>  > The size at which the download was interrupted matches exactly my
>  > findings.
> 
>  > Is it a bug in wget? Some option we forgot to pass to wget?
> 
> Seems like a bug to me. I don't see how this could ever be valid
> behaviour.

 Could also be a bug in the server: if it claims to support the Range:
option, then wget will try to use it. But if the server then returns the
start of the file instead of the request offset, you'll end up with this
corrupted file.

 Regards,
 Arnout


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7CB5 E4CC 6C2E EFD4 6E3D A754 F963 ECAB 2450 2F1F
