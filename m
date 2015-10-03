From: Arnout Vandecappelle <arnout@mind.be>
Date: Sat, 3 Oct 2015 22:06:38 +0100
Subject: [Buildroot] [PATCHv2 1/1] board/wandboard: fix perl related
 linux compilation error
In-Reply-To: <87fv1r1xwh.fsf@dell.be.48ers.dk>
References: <1442889921-6713-1-git-send-email-imrehg@gmail.com>
 <20150922154716.0c3fec44@free-electrons.com>
 <87r3lb22jp.fsf@dell.be.48ers.dk> <87fv1r1xwh.fsf@dell.be.48ers.dk>
Message-ID: <5610435E.9030303@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03-10-15 21:48, Peter Korsgaard wrote:
>>>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
> 
> Hi,
> 
>  >> If the problem is serious, I don't really see another option than
>  >> having some logic in linux.mk to detect if the kernel is affected by
>  >> the problem, and replacing the perl script by a bc script.
> 
>  > Step 1 must be to understand what the issue is exactly and what version
>  > of perl/make triggers it.
> 
>  > Imreh, can you clarify?
> 
> Could it be that your system perl enables strict mode by default? What
> distribution and perl version are you using?
> 
> I just built wandboard_defconfig without any problems here (perl 5.20.2
> / Debian).
> 

 It's with perl 5.22. Should at least be mentioned in the commit log.

 This also means that whenever host-perl is built before the kernel, you'll bump
into this issue (because host-perl is in the PATH passed to the kernel build).

 But so indeed, this is going to be an issue for all kernels, so I'm with Imreh
that the solution is to have a simple sed-patch that can be applied to all kernels.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
