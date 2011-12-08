From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 8 Dec 2011 10:56:19 +0100
Subject: [Buildroot] [PATCH 1 of 3 v2] dependencies: add function
	suitable-host-package
In-Reply-To: <201112061812.30282.arnout@mind.be>
References: <patchbomb.1322053783@devws108>
 <03cbc212567081a0d7bc.1322053784@devws108>
 <201112061812.30282.arnout@mind.be>
Message-ID: <CAAXf6LVasKstYa410=-7pGL45G4rRAUbYcA8RyrgtMMOaZDtmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout,

On Tue, Dec 6, 2011 at 6:12 PM, Arnout Vandecappelle <arnout@mind.be> wrote:
> On Wednesday 23 November 2011 14:59:50 Thomas De Schampheleire wrote:
>
>> +# suitable-host-pkg: calls check-host-$(1).sh shell script, which
>
>> +# should return the path to the suitable host tool, or nothing if no
>
>> +# suitable tool was found.
>
>> +define suitable-host-package
>
>> +$(shell toolchain/dependencies/check-host-$(1).sh)
>
>> +endef
>
>
> I should have noticed this in the first review, but: If the function is
>
> this simple, it becomes pointless. Especially because other check-host-*
>
> mk files may want to implement the checking in a different way, e.g.
>
> $(eval $(shell ...)).

I'm not sure if it's pointless. It provides a uniform way of checking
for host packages, and in that sense becomes a sort of
'infrastructure'. Moreover, the syntax is simpler and does not require
knowing the path to the correct check-host file. If anything changes,
it only needs to change in one place.

Compare:
$(if $(call suitable-host-package,foo),,host-foo)
with
$(if $(shell toolchain/dependencies/check-host-foo.sh),,host-foo)

>
>
>> +include toolchain/dependencies/check-host-*.mk
>
>
> And if this is the only thing remaining, perhaps it's better to merge
>
> this patch with the next one :-)
>
>
>

Best regards,
Thomas
