From: Chris Packham <judge.packham@gmail.com>
Date: Mon, 7 Mar 2016 20:40:35 +1300
Subject: [Buildroot] [RFC PATCH 1/1] scripts: Add gen-package.py
In-Reply-To: <20160306232248.4d37bcd2@free-electrons.com>
References: <1443426394-13595-1-git-send-email-judge.packham@gmail.com>
 <1443426394-13595-2-git-send-email-judge.packham@gmail.com>
 <20160306232248.4d37bcd2@free-electrons.com>
Message-ID: <CAFOYHZDX9Ap8XSPuqKg8k-9+KA5qKB+DmhRH1FstXxMfkBG_7g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Mar 7, 2016 at 11:22 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Chris Packham,
>
> On Mon, 28 Sep 2015 20:46:34 +1300, Chris Packham wrote:
>> gen-package.py can be used to generate the initial skeleton Config.in
>> and <package>.mk for a package based on its download URL.
>>
>> Signed-off-by: Chris Packham <judge.packham@gmail.com>
>> ---
>>  support/scripts/gen-package.py | 266 +++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 266 insertions(+)
>>  create mode 100755 support/scripts/gen-package.py
>
> Sorry for the very very slow feedback. To be honest, my opinion on this
> is that a script that just generates the skeleton of a package is not
> very useful.
>
> What I find useful however are scripts to generate working packages
> like we already have for CPAN Perl modules (scancpan script), and like
> we will probably have for Python (see
> http://patchwork.ozlabs.org/patch/501204/).

Yes now that those exist there is certainly no need for the
python/perl package support. cpan & pypi do a much better job of
providing the metadata needed than we can by guessing based on a
random URL.

Some of the gaps in my RFC could be filled in by actually downloading
the package and guessing the build system and license. Which would
turn it from a skeleton generator to an actual complete package
generator.

>
> Another thing that would be useful is a "checkpackage" script, that
> runs a bunch of verifications on a package (proper indentation, license
> information filled in, etc.). But it is not trivial to do if you want
> to check useful things.

Such a script would have helped me with some of my submissions.
