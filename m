From: Mark Jackson <mpfj-list@mimc.co.uk>
Date: Thu, 15 Oct 2009 11:27:19 +0100
Subject: [Buildroot] Missing 'make install' option ?
In-Reply-To: <1255601357.3933.4.camel@sven>
References: <4AD6ED89.6020902@mimc.co.uk> <1255601357.3933.4.camel@sven>
Message-ID: <4AD6F907.6070106@mimc.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Sven Neumann wrote:
> On Thu, 2009-10-15 at 10:38 +0100, Mark Jackson wrote:
>> Correct me if I'm missing something here ...
>>
>> After I've run a successful build the output/target directory contains
>> a copy of the target files.  Fine.
>>
>> If I then, say, remove a package via 'make menuconfig', I have to then
>> perform a 'make dirclean; make' to generate a new set of target files.
>>
>> This, of course, causes a re-compile of *everything* !!
> 
> You can use 'make package-clean' (with package substituted by the name
> of the package) before deselecting the package. This will uninstall it
> from staging and target areas.

Okay ... but is there's no way to regenerate the output/target contents
without doing a 'make dirclean; make' ?

A sort of 'make install' which would:-

(a) delete the output/target contents
(b) copy target_skeleton to output/target
(c) run 'make install' on all selected packages (re-compiling if required)

I'd find that *most* useful !!

Mark
