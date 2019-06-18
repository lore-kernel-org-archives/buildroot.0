From: Arnout Vandecappelle <arnout@mind.be>
Date: Tue, 18 Jun 2019 09:34:54 +0200
Subject: [Buildroot] [PATCH v5 1/4] autobuild-run: move creation of
 result directory to run_instance()
In-Reply-To: <20190618091403.582cd799@windsurf>
References: <20190617093456.6110-1-itsatharva@gmail.com>
 <20190617200609.4276a61a@windsurf> <20190618091403.582cd799@windsurf>
Message-ID: <7971482d-2efd-4bb0-d105-56746c5039d4@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net



On 18/06/2019 09:14, Thomas Petazzoni wrote:
> Hello Atharva,
> 
> On Mon, 17 Jun 2019 20:06:09 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
> 
>> I have applied the series to buildroot-test, thanks!
> 
> So, the first results in the autobuilders with this applied have
> appeared:
> 
>   http://autobuild.buildroot.net/results/0f3/0f35347a0d4b29fa7b657f42eb3d4d176ad75410/
>   http://autobuild.buildroot.net/results/128/128675664dbce8f35e5a710e85791708263a92f8/
> 
> I see two problems:
> 
>  - The output in build-end.log does not show any indication that the
>    overall build failure is caused by the build being non-reproducible.
>    What build-end.log shows is just a "make legal-info" that ends up
>    successfully, which is very confusing since the build status is
>    "failure", but the log doesn't show any sort of failure.
> 
>    I think the check_reproducibility() function should at least show
>    something in the build log.

 You can see it through the existence of the "reproducible_results" file.

 But it would indeed be a good idea to use that file as the build log instead of
the normal log.

 Atharva?


>  - The reason of the failures, visible at
>    http://autobuild.buildroot.net/?submitter=Thomas+Petazzoni+(Bootlin+server)&status=NOK
>    are just "unknown". We really want to have a better "reason". I
>    guess the easiest here would be to move the calculation of the
>    "reason" into autobuild-run instead of having it server-side, as
>    Arnout has suggested in a separate discussion yesterday.

 Ack, that was the plan. The "unkown" is exactly what we expected. I think it's
OK for a few weeks.

 Regards,
 Arnout
