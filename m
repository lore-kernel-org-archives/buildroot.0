From: Grant Edwards <grant.b.edwards@gmail.com>
Date: Wed, 9 Dec 2009 22:54:24 +0000 (UTC)
Subject: [Buildroot] Documentation question
References: <hfp1uh$6fk$1@ger.gmane.org>
	<200912091632.06109.minimod@morethan.org>
Message-ID: <hfp9qv$2so$1@ger.gmane.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2009-12-09, Michael S. Zick <minimod@morethan.org> wrote:
> On Wed December 9 2009, Grant Edwards wrote:

>> I've been reading the "buildroot usage and documentation"
>> document over the past couple days, and in order to not be a
>> complete leech, I'm fixing various minor problems (typos,
>> spelling, punctuation, usage, grammar, etc.) and will submmit
>> a patch when I've finished.
>> 
>> However, I've run across one paragraph where I think the
>> actual content could use a tweak, and I thought I should ask
>> about it before making a change.  In the section "Using
>> Buildroot" there's a paragraph that describes what the
>> top-level "make" does:
>> 
>>    $ make
>> 
>>      This command will download, configure and compile all the
>>      selected tools, and finally generate a toolchain, a root
>>      filesystem image and a kernel image (or only one of these
>>      elements, depending on the configuration). 
>> 
>> Doesn't the toolchain have to be generated _before_ the
>> selected tools are configured and compiled?
>
> Just needs some clarification.
>
> "Generate toolchain" in the sentence seems to mean a native
> toolchain

Ah, it hadn't occurred to me that what was meant was the native
toolchain.

> (which Buildroot can do - similar to any other package).

Of course.

> What you are referring too seems to be an cross-compile
> toolchain.

Indeed. I was assuming that the toolchain mentioned was the
cross toolchain since the target-native toolchain is treated
like any other target package.

> Which does not seem to be mentioned (or maybe the native
> toolchain isn't mentioned).
>
> *) Downloads (either as required, or pre-downloads all (make source))
> *) Configures cross-compile toolchain
> *) Builds cross-compile toolchain
> *) Builds selected packages (optional)
> *) Builds a native toolchain (optional, like any other "package")
> *) Builds a kernel image (optional)
> *) Creates a root filesystem in selectable forms (filesystem, archive, ...)
>
> Or something close to that - notice two (2) "toolchains"

Right.  I'll re-write that paragraph to use that list of steps.

Just for the sake of curiosity, how often do people generate a
target-native toolchain with buildroot?  [I don't think any of
the platforms I work with would have the resources available to
use one.]

-- 
Grant
