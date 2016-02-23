From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 23 Feb 2016 20:39:25 +0100
Subject: [Buildroot] [PATCH v1] qt: add font license information
In-Reply-To: <20160223135110.064721b6@free-electrons.com>
References: <1434140535-13792-1-git-send-email-ps.report@gmx.net>
 <56CB9524.3090704@mind.be> <20160223135110.064721b6@free-electrons.com>
Message-ID: <56CCB56D.2000802@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 02/23/16 13:51, Thomas Petazzoni wrote:
> Arnout,
> 
> Thanks a lot for having reviewed this patch, which is not very simple
> in terms of licensing details.
> 
> On Tue, 23 Feb 2016 00:09:24 +0100, Arnout Vandecappelle wrote:
> 
>>  The problem with the way that it's done now is that the different licenses will
>> not be comma-separated while they usually are. But adding commas is difficult in
>> this case, so OK.
> 
> I thought we could do something such as:
> 
> QT_LICENSE += Foo (bar),
> QT_LICENSE += Bar (foo),
> QT_LICENSE += Baz (boz),
> QT_LICENSE := $(patsubst %$(comma),%,$(QT_LICENSE))
> 
> But it unfortunately seems to remove all commas. We could then do:
> 
> QT_FINAL_LICENSE = $(shell echo "$(QT_LICENSE)" | sed 's:\(.*\),:\1:')
> 
> Not super pretty, but it's just one line of crap.

 Actually, that last bit could be moved to the legal-info infra itself, e.g. in
the legal-manifest function.

 But that's for another patch :-)

 Regards,
 Arnout

> 
> Thomas
> 

-- 
Arnout Vandecappelle      arnout dot vandecappelle at essensium dot com
Senior Embedded Software Architect . . . . . . +32-478-010353 (mobile)
Essensium, Mind division . . . . . . . . . . . . . . http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium . . . . . BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
