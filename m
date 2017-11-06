From: Philippe Proulx <eeppeliteloop@gmail.com>
Date: Mon, 6 Nov 2017 16:06:10 -0500
Subject: [Buildroot] [PATCH 1/1] Fix build of lttng-libust
In-Reply-To: <70c7ad00-5286-b254-fe7e-9d7e7d25eb70@mind.be>
References: <20171030163121.939-1-norbert.lange@andritz.com>
 <20171030204054.723cdc99@windsurf>
 <CADYdroP3-gaXzRy61r7FraPq+g6MeB5CUGN_nFLyFy3MxxfVvw@mail.gmail.com>
 <cf2f5ee6-d0e2-fcfa-f2af-5ff722d3388c@mind.be>
 <CADYdroNJAbhAJb3=cghUYj1807k02PGs--nN258J8AKRsN4U8w@mail.gmail.com>
 <70c7ad00-5286-b254-fe7e-9d7e7d25eb70@mind.be>
Message-ID: <CAB4xu_1N3NV_Z7cDYJ4DbKB=0476-axmCZUSaY4_CCA39T-i3A@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Nov 5, 2017 at 5:02 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>>>  Since this is anyway just an example, wouldn't it be better to just disable the
>>> documentation entirely? I.e. teach configure.ac to understand --disable-doc and
>>> teach Makefile.am to not recurse into doc if docs are disabled?
>>
>> No problem with that, for the upstream package this might be more of an issue.
>
>  Philippe (one of the upstream developers) already said that he'd look into it.
>

It's in master now, hope it helps:
<https://github.com/lttng/lttng-ust/commit/08aa9a26779d4ede3de7857fafd03bd6331ba948>.

Phil

>> I am certainly curious where this issue comes from, and what other problems
>> could be showing up. Whether this is a lttng, CMake, gcc or binutils issue...
>  For upstream it's obviously interesting to find the underlying issue, but for
> Buildroot it's not relevant since it's only an example. It gets installed in
> /usr/share/doc and that directory is removed in target-finalize.
>
>  Regards,
>  Arnout
>
> --
> Arnout Vandecappelle                          arnout at mind be
> Senior Embedded Software Architect            +32-16-286500
> Essensium/Mind                                http://www.mind.be
> G.Geenslaan 9, 3001 Leuven, Belgium           BE 872 984 063 RPR Leuven
> LinkedIn profile: http://www.linkedin.com/in/arnoutvandecappelle
> GPG fingerprint:  7493 020B C7E3 8618 8DEC 222C 82EB F404 F9AC 0DDF
