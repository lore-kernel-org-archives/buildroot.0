From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 30 Sep 2020 22:31:42 +0200
Subject: [Buildroot] [PATCHv2] infra: add the transient download
 mechanism
In-Reply-To: <20200930201303.GU11621@scaer>
References: <20200930173030.2461586-1-yann.morin.1998@free.fr>
 <20200930214530.6b964a45@windsurf.home>
 <20200930201303.GU11621@scaer>
Message-ID: <20200930223142.681174c0@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, 30 Sep 2020 22:13:03 +0200
"Yann E. MORIN" <yann.morin.1998@free.fr> wrote:

> I think it is important to stress that, though, because people can be
> very confused but the outcome, one way or the other.
> 
> For example, let's assume that I push my branch, that triggers a
> pipeline in the CI, the pipeline uses my branch as expected. Then I
> repush a modified branch, the new pipeline uses the new HEAD of the
> branch, and again this is as expected..
> 
> But now consider the following scenario:
> 
>   - I push my branch, a pipeline is triggered;
>   - before the pipeline has a chance to git-fetch, I do a quick change
>     and repush, a second pipeline is triggered;
>   - the first pipeline uses the code from the second push.
> 
> However, my change was intentional, and I was expecting the CI to test
> the two changes, and I wanted to have the results of both to decide
> which to keep.
> 
> This for example, is very interesting because the CI can do tests I
> can't always do locally, like reproducibility test for performance, for
> example, or test on hardware I don't have at hand (when working from
> home for example), and so on.
> 
> Thus my case is borked. Yeah, I could do two branches, but the fact is
> that if I wait "just enough" between the pushes, it works, while if I
> don't wait "just enough" it does not work.
> 
> Conversely, if I notice that I forgot to commit part of the changes, and
> amend my commit and repush, I don't care what the first pipeline gets;
> I only care about the second.
> 
> So, this is a pitfall: behaviours that may or may not match your
> expectations, depending on what your expectations are, because this
> mechanism caters to both antagonist cases where expectations are
> opposite one from the other.

I understand what you're describing here, and I understand that it
indeed should be explained. Then, it shouldn't be presented as a
"pitfall", but really as an explanation of the consequences.

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
