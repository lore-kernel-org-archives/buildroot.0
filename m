From: =?ISO-8859-1?Q?Stefan_Fr=F6berg?= <stefan.froberg@petroprogram.com>
Date: Wed, 25 Apr 2012 20:41:54 +0300
Subject: [Buildroot] Buildroot SKIPS PATCHES ???
In-Reply-To: <CAAXf6LX3sUmETGmOcpMh=av4n3jkc18gHBFO3zkfwW=andjjmg@mail.gmail.com>
References: <4F9341C9.8000508@petroprogram.com>
 <CAAXf6LX+De-fWuqb-nZBGyMkoqBdeqYz+qp=hDkUybCE_a-G4Q@mail.gmail.com>
 <4F9586EE.9090600@petroprogram.com>
 <CAAXf6LX3sUmETGmOcpMh=av4n3jkc18gHBFO3zkfwW=andjjmg@mail.gmail.com>
Message-ID: <4F983762.2090008@petroprogram.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

25.4.2012 8:39, Thomas De Schampheleire kirjoitti:
> Hi Stefan,
>
> [Please keep the buildroot list in copy, and don't top-post]
>
> On Mon, Apr 23, 2012 at 6:44 PM, Stefan Fr?berg
> <stefan.froberg@petroprogram.com> wrote:
>> Hi Thomas
>>
>> Thank You very much of investigating this.
>>
>> Yes,  everytime the patching failed I first deleted the whole wvstreams
>> source directory from output/build and tried rebuilding it again but no joy.
>>
>> What version of Buildroot are you using ?
>>
> I had tested this with revision 5ee4614c4e72dfab4e8f36186fc8ef4ab05fb9a9.
>
>> I have included here the screenshots of my version of Buildroot and the
>> very beginning of wvstreams building process.
>> It just skips all the files in patching process, even tought the
>> xplc-package has no problem at all of applying that single patch it has.
>>
>> So should I get a latest version of Buildroot and try it there ?
> I guess that you are not subscribed to the mailing list, and thus have
> not seen Ludovic's response:
> http://lists.busybox.net/pipermail/buildroot/2012-April/052921.html

Yes, Im very sorry for that.
I just now subscribed to mailing list.

> He refers to this patch:
> http://git.buildroot.net/buildroot/commit/?id=7c717bbfffea0c55d348435e9b98e492b11b9177
>
> If this is indeed the problem in your case, I see three ways forward:
> - check if you have any .patch file in the root of the buildroot
> directory. If I understood the problem that Ludovic fixed correctly,
> it is only triggered if there is a .patch file in there. If you have
> such a file, move it elsewhere.
>
> - Use a snapshot of a recent buildroot tree, see
> http://buildroot.org/downloads/snapshots/
>
> - Keep the version you are currently using, but apply the mentioned
> patch manually.
>
> If your problem is not solved by any of these steps, I suggest you add
> some traces in the package/Makefile.package.in Makefile around the
> patch code, and in the apply-patches.sh script.
>
> Best regards,
> Thomas
>

You are right. There was indeed wvstreams patch files also in the root
of the buildroot directory.
But to be sure, I grapped the freshest copy of buildroot, just in case,
and now wvstreams compiles nicely
 :-)

Thank you!

By the way, what is the normal process of offering new packages to
buildroot ?
I tried looking from buildroot pages for that info but could not find it.

In addition to this wvstreams package I have wvdial, firefox (not really
an embedded system browser, but I can't live without it), slim and Linux
Pam packages under work.

Should I just offer them on buildroot mailing list for reviewing or where ?

Best regards
Stefan
