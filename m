From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 5 Sep 2018 00:10:10 +0200
Subject: [Buildroot] [PATCH v3] mediastreamer: fix avcodec functions
 conflict
In-Reply-To: <87in3lapvk.fsf@dell.be.48ers.dk>
References: <20180904131251.30724-1-giulio.benetti@micronovasrl.com>
 <87va7lasjf.fsf@dell.be.48ers.dk>
 <735a4c9f-42c2-9744-6889-921bf720d167@micronovasrl.com>
 <87in3lapvk.fsf@dell.be.48ers.dk>
Message-ID: <767b037d-9ff3-9392-25ca-3656a400be30@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 04/09/2018 23:56, Peter Korsgaard wrote:
>>>>>> "Giulio" == Giulio Benetti <giulio.benetti@micronovasrl.com> writes:
> 
> Hi,
> 
>  >> Committed after extending the commit message to clarify that this is
>  >> about static linking, thanks.
> 
>  > Sorry for my ignorance, so library order during linking is an issue only
>  > with static libraries?
> 
> Yes, when statically linking ld will only pull in the object files
> containing referenced symbols, so you need to list the libraries in the
> dependency order (E.G. if you call a function in library a that in turn
> calls a function in library b then you must use -la -b).
> 
> For details, see
> E.G. https://eli.thegreenplace.net/2013/07/09/library-order-in-static-linking

 Note the explanation of --start-group/--end-group, which is sometimes the
easiest way to fix a linking order issue.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
