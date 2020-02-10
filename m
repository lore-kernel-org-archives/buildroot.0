From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Mon, 10 Feb 2020 10:01:38 +0100
Subject: [Buildroot] [PATCH 0/3] packages/exim: fix build failures
In-Reply-To: <87tv41v758.fsf@dell.be.48ers.dk>
References: <20200207151427.12475-1-luca@lucaceresoli.net>
 <87tv41v758.fsf@dell.be.48ers.dk>
Message-ID: <91298deb-4c90-05dc-d88b-0d3aa781a2e9@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On 08/02/20 09:02, Peter Korsgaard wrote:
>>>>>> "Luca" == Luca Ceresoli <luca@lucaceresoli.net> writes:
> 
>  > exim is failing on the autobuilders since the version bump to 4.93 (commit
>  > 6038c3232acfdb: "package/exim: bump version to 4.93.0.3").
> 
>  > Commit 2c692e81a844b30b ("package/exim: fix host build") fixed one failure
>  > when building the host tools, but we still have a similar ("'for' loop
>  > initial declarations are only allowed in C99 mode") one when cross-building
>  > target files.
> 
>  > In patch 1 I applied a similar fix (add -std=c99), but more failures
>  > started appearing later in the build process.
> 
>  > I have not completely understood the new failures, yet with a couple of
>  > patches it is now building. This is done in patch 2 but I'm not sure it is
>  > a correct solution.
> 
>  > Finally another failure appeared. It is yet another
>  > for-loop-initial-declaration error, but happens later in the install
>  > step. This is fixed in patch 3 adding another -std=c99.
> 
>  > I cannot work on this issue for the next few days, so here are my patches,
>  > as-is, in case anybody wants to have a look before 2020.02.
> 
> Thanks, the patches looks sensible to me. Did you submit them upstream?
> We normally add a link to that in the patches.

I still haven't sent them to upstream because I thought there could be a
better fix. I plan to send them within a few days after having another
look into it. After that I'm also sending v2 here with the
"Upstream-status" added.

-- 
Luca
