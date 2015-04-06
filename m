From: Johan Sagaert <sagaert.johan@proximus.be>
Date: Mon, 06 Apr 2015 11:53:19 +0200
Subject: [Buildroot] Target to create missing hashes.
In-Reply-To: <20150406085602.GA4369@free.fr>
References: <5521BE08.9020304@proximus.be> <20150406085602.GA4369@free.fr>
Message-ID: <5522578F.80507@proximus.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Yann E. MORIN schreef op 6/04/2015 om 10:56:
> Johan, All,
>
> On 2015-04-06 00:58 +0200, Johan Sagaert spake thusly:
>> Would be nice to have a convenience make target to create missing hashes.
>> (Comes in handy for custom packages not available in upstream buildroot, or
>> when bumping versions before posting the patches to the mailing list.)
>>
>>   make  <pkg>-sha256_hash
> Well, we do not want the hashes to be automatically created, because we
> want them to come from upstream if possible, and only if upstream does
> not provide hashes do we locally compute them.
>
> So, we can't offer an automatic way to create hashes. It has to be a
> manual process.
I did not mean 'automatic'  in the sense that buildroot would create the 
missing hashes
whenever its finds one during the build, but only as an aid to manually 
add / update a hash after
  for example adding a new package, or bumping to a newer version.
>> Maybe the missing hash warnings should also be redirected to a file
>> .missing_hashes, they mostly go unnoticed otherwise while building.
> Well, I have a series that makes missing hashes a hard error (when the
> .hash file exists), so that will be caught fairly easily! ;-) And a
> missing .hash file would become a warning for now, with the ultimate
> goal of making it a hard error in the future (because we do not have
> enough packages with a .hash file for now).
>
> There is the idea floatign around of creating a check-package (or
> check-patch) script that could be used to validate a new package, and
> checking a .hash file exists could be part of that script.
>
> Any taker? ;-)
>
> Regards,
> Yann E. MORIN.
>
Best Regards Johan
