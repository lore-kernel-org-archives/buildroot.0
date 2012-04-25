From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Wed, 25 Apr 2012 07:39:55 +0200
Subject: [Buildroot] Buildroot SKIPS PATCHES ???
In-Reply-To: <4F9586EE.9090600@petroprogram.com>
References: <4F9341C9.8000508@petroprogram.com>
 <CAAXf6LX+De-fWuqb-nZBGyMkoqBdeqYz+qp=hDkUybCE_a-G4Q@mail.gmail.com>
 <4F9586EE.9090600@petroprogram.com>
Message-ID: <CAAXf6LX3sUmETGmOcpMh=av4n3jkc18gHBFO3zkfwW=andjjmg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Stefan,

[Please keep the buildroot list in copy, and don't top-post]

On Mon, Apr 23, 2012 at 6:44 PM, Stefan Fr?berg
<stefan.froberg@petroprogram.com> wrote:
> Hi Thomas
>
> Thank You very much of investigating this.
>
> Yes, ?everytime the patching failed I first deleted the whole wvstreams
> source directory from output/build and tried rebuilding it again but no joy.
>
> What version of Buildroot are you using ?
>

I had tested this with revision 5ee4614c4e72dfab4e8f36186fc8ef4ab05fb9a9.

> I have included here the screenshots of my version of Buildroot and the
> very beginning of wvstreams building process.
> It just skips all the files in patching process, even tought the
> xplc-package has no problem at all of applying that single patch it has.
>
> So should I get a latest version of Buildroot and try it there ?

I guess that you are not subscribed to the mailing list, and thus have
not seen Ludovic's response:
http://lists.busybox.net/pipermail/buildroot/2012-April/052921.html

He refers to this patch:
http://git.buildroot.net/buildroot/commit/?id=7c717bbfffea0c55d348435e9b98e492b11b9177

If this is indeed the problem in your case, I see three ways forward:
- check if you have any .patch file in the root of the buildroot
directory. If I understood the problem that Ludovic fixed correctly,
it is only triggered if there is a .patch file in there. If you have
such a file, move it elsewhere.

- Use a snapshot of a recent buildroot tree, see
http://buildroot.org/downloads/snapshots/

- Keep the version you are currently using, but apply the mentioned
patch manually.

If your problem is not solved by any of these steps, I suggest you add
some traces in the package/Makefile.package.in Makefile around the
patch code, and in the apply-patches.sh script.

Best regards,
Thomas



> 23.4.2012 15:33, Thomas De Schampheleire kirjoitti:
>> Hi Stefan,
>>
>> On Sun, Apr 22, 2012 at 1:24 AM, Stefan Fr?berg
>> <stefan.froberg@petroprogram.com> wrote:
>>> Good day
>>>
>>>
>>> I have tried adding two new packages to my local copy of buildroot,
>>> first one is xplc-package (version 0.3.13) and the second one is
>>> wvstreams (version 4.2.2) which needs xplc.
>>>
>>> The first one, xplc, builds nicely.
>>>
>>>
>>> But for some reason, for wvstreams package the Buildroot does not apply
>>> the patches at all.
>>> Buildroot just skips all the nine wvstreams patch-files and continues
>>> configuring ...
>>> :-(
>>>
>>> I have included all files (Config.in, .mk-files and patches) for both
>>> packages here.
>>> I would be very gratefull if somebody could help to solve this mystery.
>>>
>>> Please contact me at:
>>> stefan.froberg at petroprogram.com
>>>
>> Have you solved this problem already?
>>
>> I have copied your wvstreams .mk file and one of the patches, and did
>> not have problems applying the patches.
>> Which version of buildroot are you using?
>> Have you tried deleting the entire output/build/wvstreams* directory
>> (thus removing the stamp files) ?
>> What is the output of the wvstreams build? It should print a message
>> about each phase (download, extract, patch, configure, ...).
>>
>> Do you have other patches or directories inside package/wvstreams ?
>> The current rules for patching are somewhat complicated and can depend
>> on such other files. The rules are in package/Makefile.package.in.
>>
>> Best regards,
>> Thomas
>
