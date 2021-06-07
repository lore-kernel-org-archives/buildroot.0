From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 07 Jun 2021 22:22:52 +0200
Subject: [Buildroot] [PATCH] package/netperf: move SITE so s.b.n
In-Reply-To: <8fac0332-92aa-9545-7a30-afa8194e0d56@mind.be> (Arnout
 Vandecappelle's message of "Mon, 7 Jun 2021 21:00:13 +0200")
References: <c160b9eba623c54debf9bf50d69cca4a6d6ed69e.1622119840.git.baruch@tkos.co.il>
 <7d24aa70-74c4-1166-e69f-5d8c7a5c6875@mind.be>
 <a7969129-6272-575d-0846-1874629cebc4@mind.be>
 <87v96wrw9p.fsf@tarshish> <87tumbxxu9.fsf@dell.be.48ers.dk>
 <8fac0332-92aa-9545-7a30-afa8194e0d56@mind.be>
Message-ID: <874ke9xw4j.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Arnout" == Arnout Vandecappelle <arnout@mind.be> writes:

Hi,

 >> >> We prefer buildroot.org over buildroot.net nowadays, so I changed that.
 >> 
 >> > BR2_BACKUP_SITE still defaults to "http://sources.buildroot.net". Should
 >> > we change that?
 >> 
 >> There is a fairly important difference between .net and .org, .net is
 >> though the cloudflare cache, but .org goes straight to our upstream
 >> server.
 >> 
 >> Given the extra bandwidth and availibility of Cloudflare, I would prefer
 >> we use .net.

 >  Wouldn't it be possible to route sources.buildroot.org through cloudflare as well?

It would, but there were some complications back when we set it up,
E.G. you need to use cloudflares DNS servers and we didn't originally
have control of the buildroot.org.

Only having cloudflare on one of the domains was also quite handy for
comparing behaviour when debugging in the beginning.

But yeah, we should probably use the same setup for both domains now. We
originally put Cloudflare in front because of bandwidth/latency issues
with s.b.o for some users. Given that Cloudflare is a bit controversial,
it is maybe worth checking if we should keep on using it or drop it.

According to the Cloudflare stats, ~45% of the requests are cached,
saving ~1TB traffic/month.

Thomas, I think you had performance issues in the beginning, can you
compare speed again?

-- 
Bye, Peter Korsgaard
