From: Arnout Vandecappelle <arnout@mind.be>
Date: Mon, 23 Nov 2015 20:50:36 +0100
Subject: [Buildroot] [PATCH 1/3] package/Makefile.in: remove
	HOSTCC_VERSION
In-Reply-To: <87fuzx676p.fsf@dell.be.48ers.dk>
References: <1448147919-5463-1-git-send-email-arnout@mind.be>
 <87fuzx676p.fsf@dell.be.48ers.dk>
Message-ID: <56536E0C.1010205@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 22-11-15 22:43, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be> writes:
>
>  > HOSTCC_VERSION is no longer used since gcc switched to the package
>  > infrastructure in e236fe481. It was in fact no longer needed since we
>  > dropped support for gcc 4.3.
>
>  > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>  > ---
>  > Note that we currently claim to support system gcc >= 2.95, but I don't
>  > think that matches reality...
>
> Ehh, no. I guess a 4.x version would make more sense. Any idea what 'x'
> should be? 3? 5? 7?

We'd need to check all the host packages (plus the packages that build a host
tool as part of the target build, like uboot) to be sure of that. The
autobuilders tell us that 4.7 at least is OK.

Regards,
Arnout

>
> Committed to next, thanks.
>


-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
