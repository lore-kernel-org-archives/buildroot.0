From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 7 Dec 2016 00:48:48 +0100
Subject: [Buildroot] [PATCH] kexec: fix build when BR2_STRIP_none=y
In-Reply-To: <87inqy57jy.fsf@dell.be.48ers.dk>
References: <1480679517-551-1-git-send-email-marcin.nowakowski@imgtec.com>
 <87a8ce8g6c.fsf@dell.be.48ers.dk>
 <20161202213857.673e4b97@free-electrons.com>
 <877f7i6nry.fsf@dell.be.48ers.dk>
 <20161202223427.7b411a05@free-electrons.com>
 <87inqy57jy.fsf@dell.be.48ers.dk>
Message-ID: <789c403c-6dd0-4b7a-e718-9ccfac82be66@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 05-12-16 23:34, Peter Korsgaard wrote:
>>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:
> 
>  > Hello,
>  > On Fri, 02 Dec 2016 22:09:53 +0100, Peter Korsgaard wrote:
> 
>  >> Hi,
>  >> 
>  >> > My other thought is that I believe it's not the first time (see commit
>  >> > fc174b7057495ebb31393ae27f3ceeefdc490022), so perhaps our idea of
>  >> > having STRIP=true when BR2_STRIP_none=y is a bad idea, and we should
>  >> > handle this in a different way.  
>  >> 
>  >> The question is how? Create a dummy shell script to better emulate the
>  >> command line options / behaviour of strip?
> 
>  > I'm not sure. Yet another wrapper kind of sucks. Is it possible to pass
>  > enough options to strip to have it not strip anything? :-)
> 
> Not that I'm aware of at least. Anyone?

 Why do we have to set TARGET_STRIP to something different when
BR2_STRIP_none=y? BR2_STRIP_none is supposed to mean that we don't strip all
binaries, it doesn't mean that an individual package isn't allowed to strip its
binaries...

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
