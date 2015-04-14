From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 14 Apr 2015 14:05:19 +0200
Subject: [Buildroot] [PATCHv2 08/21] Makefile: use the package infra
 based external-deps
In-Reply-To: <552CF861.50004@mind.be>
References: <1428856685-4403-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1428856685-4403-9-git-send-email-thomas.petazzoni@free-electrons.com>
 <552C5ADB.6020509@mind.be>
 <20150414095202.7850ba00@free-electrons.com>
 <552CF861.50004@mind.be>
Message-ID: <20150414140519.03a3bdd6@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, 14 Apr 2015 13:22:09 +0200, Arnout Vandecappelle wrote:

>  Ah yes, silly me. I just _assumed_ that external deps would have been 
> implemented like:
> 
> $(1)-external-deps: $$(foreach p,$$($(2)_FINAL_DEPENDENCIES),$$(p)-external-deps)
> 
> instead of passing through -all-external-deps. I just tested that the
> above gives exactly the same result as the -all-external-deps version.

I might be missing something here, but I don't see why your version
would be any different than the -all-external-deps version I've
proposed. Except that $(1)-external-deps would not behave as I would
expect it to behave: give only the list of external deps for $(1), not
recursively for all dependencies of $(1). But except that I don't
really see the difference.

>  The other reason why there are duplicates is because host packages and
> target packages (usually) have the same sources, so they will be listed
> twice. That's more difficult to get around.

I believe this is more likely to be the reason: if you look back at my
examples, I never got more than twice the same package. So we're
probably hitting the target vs. host package thing.

Is there anything that we can do about it besides keeping this | sort
-u ?

Thanks,

Thomas
-- 
Thomas Petazzoni, CTO, Free Electrons
Embedded Linux, Kernel and Android engineering
http://free-electrons.com
