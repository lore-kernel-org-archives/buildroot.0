From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Mon, 10 Oct 2011 17:19:34 +0200
Subject: [Buildroot] [RFC] Build time graph generation
In-Reply-To: <20111010162016.55214e4e@skate>
References: <cover.1318176666.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LUGVEGBy2hGA8g0_NdqSb72+rOKbnU9x7+rWOoTmV8hvg@mail.gmail.com>
 <20111010162016.55214e4e@skate>
Message-ID: <CAAXf6LW_7QrfG5VSrwELHhh3+2-KK==n4_Hs-sMGLPzzic2vsw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Oct 10, 2011 at 4:20 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thomas,
>
> Le Mon, 10 Oct 2011 15:55:49 +0200,
> Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com> a ?crit :
>
>> > I don't think the modification to the package infrastructure is ready
>> > for merging (there are many cases not handled, like when the timing
>> > data should be cleaned up, the case of overriden packages not being
>> > handled, etc.) and I am not even sure it is useful to complicate the
>> > package infrastructure with such a not-so-useful feature.
>>
>> I like the idea of having such information, so I'm in favor of these patches.
>
> Thanks :-)
>
> Though I'm still not sure of how they can be useful.

Although I may not use it every day, I can think of the following use cases:
* compare compilation speeds between different machines
* identify disk-versus-cpu bottlenecks (e.g. if the extract takes much
longer on machine A than on B, it could be the slow harddisk of A.
This can be a trigger to use another machine or faster harddisk, or an
input to the IT department)
* better visualize the impact of enabling additional packages.
* identify sudden changes in build times, e.g. after bump from one
version to another, the build time is much bigger. If you never create
the statistics, you'll never know.

>
>> (The graphs also painfully show the time lost in all ./configure
>> steps, while many of the checks are identical...)
>
> In the past, we did try to improve that situation by using the
> "configure cache" mechanism, thanks to which configure checks done by
> past configure script executions are used to speed up the execution of
> future configure scripts (since as you say, they all do mostly the same
> checks). Unfortunately, the configure scripts aren't that standardized
> and they store the result of different checks in variables of the same
> name, resulting to many strange problems. We had this feature enabled
> by default in Buildroot for a while (even in stable releases if I'm
> correct), but in the end, we dropped it because it was very complicated
> to stabilized (we already had to patch multiple configure.{in,ac}
> files).

Ok, wasn't aware of this. Thanks for the background info.

>
>> As I mentioned as comment on your patch, I think we can make this an
>> optional feature for those who want it.
>
> Yes, sure.
>
>> Is it possible to have html output as an alternative to pdf? I can
>> also imagine that some people simply want image files, like png or
>> even svg, so the graphs can easily be embedded in other web pages.
>
> Generating PNG or SVG with matplotlib is definitely possible. I'm not
> sure about HTML though, do you mean a webpage that simply includes the
> four graphs?

Some basic page with a heading for each graph, yes. It can be as fancy
as we like, but the main advantage of such a page is that you only
have to open one thing, not four individual files...

>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
>
