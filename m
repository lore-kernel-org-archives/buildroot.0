From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jul 2017 15:18:34 +0200
Subject: [Buildroot] [PATCH] package/Makefile.in: export O= to
 post-build/image scripts for out-of-tree builds
In-Reply-To: <87wp757vz6.fsf@dell.be.48ers.dk>
References: <20170714130417.18857-1-peter@korsgaard.com>
 <7d2448b0-800c-cb14-657b-907d380787f8@mind.be>
 <871spe92ci.fsf@dell.be.48ers.dk>
 <dca9fa93-e6f8-10d9-f166-02f981b4f0a3@mind.be>
 <87wp757vz6.fsf@dell.be.48ers.dk>
Message-ID: <5b6d2690-6abf-9ae3-5571-77153a1af6eb@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18-07-17 14:47, Peter Korsgaard wrote:
>>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:
> 
> Hi,
> 
>  >> Yes, that can also work - Even though it is less obvious that you should
>  >> run make O=${BASE_DIR} inside the post build/image scripts, instead of
>  >> make O=$O
> 
>  >  OK, but having both exported seems a bit silly...
> 
> Correct. I would argue that O is somewhat nicer than BASE_DIR, as the
> user is already using O= (and if they don't use O=, then they also don't
> need to pass it in post-build/post-image scripts), but we have exported
> and documented BASE_DIR for some time now, so we cannot really get rid
> of it.
> 
>  >> >  O has the problem that it's too risky to lead to conflicts IMO.
>  >> 
>  >> Even for post build/image scripts? What use cases do you have in mind
>  >> where there could be conflicts?
> 
>  >  True, in EXTRA_ENV the risk is minimal - especially since Kbuild and
>  > derivatives (like Buildroot) ignore an O passed through the environment.
> 
> Indeed.
> 
> I don't feel strongly pro/con, what do others say?

 Since it's already committed, leave it in. It's no biggy.

 Regards,
 Arnout

-- 
Arnout Vandecappelle                          arnout at mind be
Senior Embedded Software Architect            +32-16-286500
Essensium/Mind                                http://www.mind.be
G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
