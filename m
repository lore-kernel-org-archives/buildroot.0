From: Spenser Gilliland <spenser@gillilanding.com>
Date: Mon, 13 May 2013 12:43:02 -0500
Subject: [Buildroot] [PATCH v3 1/7] gstreamer1: Add gstreamer version
 1.0.7 package
In-Reply-To: <518D8507.3060909@mind.be>
References: <1368158558-6069-1-git-send-email-spenser@gillilanding.com>
 <1368158558-6069-2-git-send-email-spenser@gillilanding.com>
 <518D8507.3060909@mind.be>
Message-ID: <CAEBucnDjbCd_D4zeijdh1fq57YdyJhbGH6qnGqc68uZqLnH8Lg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Fri, May 10, 2013 at 6:38 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>  Hi Spenser,
>
>  Very quick first review...
>
>  First of all, a comment that is not so much directed at you but at the rest
> of the BR developers: the naming issue.
>
>  We have a tendency to make a copy of a package when there is a major
> version change, cfr. python3 and qt5. However, in this case, I don't think
> it's a good idea. At this time, many (most?) gstreamer downstreams have
> already moved to 1.x. Also, no more patches will be made the the 0.10 series
> (though distro's may still make patches). So we can expect the old gstreamer
> stuff to die out relatively quickly. But if we call the new thing gstreamer1
> now, we're essentially stuck with that name for all eternity.
>
>  So instead I'd try to make 0.10 or 1.0 a choice in the gstreamer package
> itself.  For me it's fine if inside the Config.in and the .mk files we
> basically have the two versions in a big ifeq() construct, but at least we
> can keep on using the BR2_PACKAGE_GST* symbols.
>
>  Obviously, there will be some packages that break down when gstreamer 1.0
> is used, but we'll have to discover that at some point anyway.
>

Per discussion will leave as gstreamer1.

>  We nowadays prefer to put sub-options inside an if...endif construct
> instead of with 'depends on'.

Will fix.

Please continue to review these patches and let me know of any
additional issues.

Regards,
Spenser

--
Spenser Gilliland
Computer Engineer
Doctoral Candidate
