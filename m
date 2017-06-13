From: Christian Stewart <christian@paral.in>
Date: Tue, 13 Jun 2017 09:42:53 -0700
Subject: [Buildroot] [PATCH 2/2] docker-engine: add dependency on
	docker-proxy
In-Reply-To: <e9ba9168-f443-cdcb-e4f1-b33e99dca301@mind.be>
References: <20170607225628.31423-1-christian@paral.in>
 <20170607225628.31423-2-christian@paral.in>
 <e9ba9168-f443-cdcb-e4f1-b33e99dca301@mind.be>
Message-ID: <CA+h8R2qYkRwFNvPO4=giKW4QrC2XCyV92sNH5Npwon9KGFXoWg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Arnout,

On Tue, Jun 13, 2017 at 9:37 AM, Arnout Vandecappelle <arnout@mind.be>
>  In fact, the same consideration goes for the other runtime dependencies of
> docker-engine. containerd is probably pretty much unavoidable, but are iptables
> and sqlite always needed, or only for certain features?


Please see this patch series and review it first, in light of what
you're suggesting here:

 - https://patchwork.ozlabs.org/patch/760397/
 - https://patchwork.ozlabs.org/patch/760394/
 - https://patchwork.ozlabs.org/patch/760395/

Sqlite is not required at all, afaik, and I will run some tests today
to see if disabling it breaks Docker (it probably won't).

iptables is definitely required, I wouldn't make that optional, just
because Docker does a lot of network abstraction internally with it,
and would very likely break completely without it.

Best,
Christian
