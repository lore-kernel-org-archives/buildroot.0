From: Matthew Weber <matthew.weber@rockwellcollins.com>
Date: Tue, 18 Jul 2017 06:46:33 -0500
Subject: [Buildroot] [PATCH] autobuild-run: add --repo option
In-Reply-To: <e5c26b25-ae7b-137f-6ce5-bb4791129e4b@mind.be>
References: <20170717212859.12581-1-arnout@mind.be>
 <20170718095702.56523c1f@windsurf>
 <d958d5e4-3a8e-886d-5cc0-b632b15bd748@mind.be>
 <20170718101948.2d81c105@windsurf>
 <e5c26b25-ae7b-137f-6ce5-bb4791129e4b@mind.be>
Message-ID: <CANQCQpYvajZhX8LMt0GzbeFMucmHanKrjsYGRT0aQy-pzG-cag@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All,

On Tue, Jul 18, 2017 at 3:25 AM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
> On 18-07-17 10:19, Thomas Petazzoni wrote:
> [snip]
>> Or I could add a server-side check that the git commit being reported
>> exists in the upstream Buildroot, and is not more than 1 or 2 days old.
>> It probably makes more sense to do this server-side.
>
>  Probably yes, because indeed, something like Matt's problem could occur for
> other reasons as well.
>
>> Which means I could merge your --repo option (even if I still find its use cases
>> very, very dubious).
>
>  Well, my own use case was to be able to test the autobuild-run script with the
> in-tree config generator. When that happens, it does make a lot of sense to be
> able to test any change to the config generator with autobuild-run. Currently
> you can test the change by just running the modified autobuild-run, but when the
> config generator comes from the Buildroot tree that's not possible anymore.
>
>  I was going to post all those changes together, but since Matt was mentioning
> he had local changes to use a different mirror, I thought I'd post this one
> individually already.
>

I'm fine carrying a local change for a different repo/branch so that I
can do offline testing or use a mirror if needed for upstream.
However, your comments are fair about safe guarding results server
side.

Matt
