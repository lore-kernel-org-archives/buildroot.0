From: Peter Korsgaard <jacmet@uclibc.org>
Date: Fri, 05 Aug 2011 09:44:12 +0200
Subject: [Buildroot] [RFC] Using AsciiDoc for the Buildroot manual
In-Reply-To: <20110805083926.257f81bc@skate> (Thomas Petazzoni's message of
 "Fri, 5 Aug 2011 08:39:26 +0200")
References: <cover.1312492948.git.thomas.petazzoni@free-electrons.com>
 <CAAXf6LV1MwAqHAYWPC3-W5-FN6MwgWwQmsUjmzLFUWV-mkwXmA@mail.gmail.com>
 <20110805083926.257f81bc@skate>
Message-ID: <87ipqcmhf7.fsf@macbook.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> writes:

Hi,

 >> One comment though: how will you ship buildroot? Will the generated
 >> manuals be included in the official tarballs?
 >> I think it should. Otherwise, a new user will have nothing but the
 >> individual txt files, which are not convenient to read directly
 >> because of the number of files. In order to get 'real' documentation,
 >> he'd already have to know that there are make targets for it, he'd
 >> need at least asciidoc to get a full manual.txt and possibly docbook
 >> to get pdf or html output.

 Thomas> This is a question, of course. Peter has raised the same
 Thomas> comment on IRC when I quickly presented the proposal, some days
 Thomas> ago.

 Thomas> I agree that somehow a generated version of the documentation
 Thomas> should be part of the release tarballs. The generated
 Thomas> documentation should also be on the website, for every
 Thomas> Buildroot release.

 Thomas> For the first part, I guess the "make release" target can be
 Thomas> extended to generate the documentation and then include it into
 Thomas> the tarball, but I think this is something to be discussed with
 Thomas> Peter.

Indeed. For releases I think atleast the text and single-html version
should get included in the tarball. We also need to setup something with
a git hook to regenerate (some of) the documentation on the server
whenever any of the source files changes. Currently the website is
simply a git checkout managed from cron on the server, and there's no
asciidoc on the server, but presumably that's just a question about
asking the osuosl.org guys for it.

 Thomas> What would be great is at least to reach to a decision on
 Thomas> whether or not converting the documentation to AsciiDoc is
 Thomas> desirable or not. If it is, then I can start collecting patches
 Thomas> to fix issues related to the conversion or improvements to the
 Thomas> documentation in AsciiDoc format, waiting for the next release
 Thomas> cycle to start to get this new documentation format merged.

Well, so far I've only heard positive feedback, so I would say: Go for
it!

-- 
Bye, Peter Korsgaard
