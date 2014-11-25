From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Date: Tue, 25 Nov 2014 21:36:47 +0100
Subject: [Buildroot] [PATCH v4 0/9] autobuild-run improvements
In-Reply-To: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
References: <1415822317-22500-1-git-send-email-patrickdepinguin@gmail.com>
Message-ID: <CAAXf6LUt25SUGQH9cGBcr8W9xypm1=rkQPKnmT2NL06u7j5RAw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Wed, Nov 12, 2014 at 8:58 PM, Thomas De Schampheleire
<patrickdepinguin@gmail.com> wrote:
> From: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
>
> This series against the buildroot-test repo makes some improvements to the
> autobuild-run script.
>
> v4:
> - rename do_send_results into upload (Peter)
>
> v3:
> - introduce missing usage of do_send_results (and move patch backwards)
> - update TODO list
>
> v2:
> - reorder patches
> - take into account comments on boolean logic in first patch
> - place docopt directly in scripts/ instead of in a subdirectory
> - remove patch adding --git (Yann, Thomas)
> - some bug fixes in the first version of the patches
>
> As you can see, this iteration still has the docopt patches. Thomas Petazzoni
> has expressed his reservations against the introduction of docopt, because the
> benefits wouldn't weigh out against the addition of an external Python module.
> Thomas told me on IRC he would have a deeper look onto this before making a
> final decision.
>
> In case the final decision is not to introduce docopt, following improvements
> could be done to the current code:
>   - save the arguments from the command-line into a dictionary instead of plain
>     variables
>   - keep the added ini_config() method to also save the options in a dictionary,
>     and use the added merge() method to merge both arguments and config options
>     into one final configuration, without needing to handle it manually.

Have you made a decision regarding the use of docopt in autobuild-run,
and these patches in general?

Thanks,
Thomas
