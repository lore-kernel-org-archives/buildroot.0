From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 20 Feb 2016 18:09:20 -0500
Subject: [Buildroot] [PATCH v2 10/18] erlang-p1_stun: bump to version
	0.9.0
In-Reply-To: <20160220233043.2be4fa0c@free-electrons.com>
References: <1454443064-14269-1-git-send-email-fhunleth@troodon-software.com>
 <1454443064-14269-11-git-send-email-fhunleth@troodon-software.com>
 <20160220233043.2be4fa0c@free-electrons.com>
Message-ID: <CA+-urNRQdWeYMt4RxONJFMDTBV9EtcD_+TBV3G-PismHVUhhOA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Sat, Feb 20, 2016 at 5:30 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Frank Hunleth,
>
> On Tue,  2 Feb 2016 14:57:36 -0500, Frank Hunleth wrote:
>> As part of the version change, the package name changed to use an
>> underscore rather than a hyphen. Fortunately, the name change doesn't
>> affect the Config.in option, so no legacy handling is needed.
>>
>> Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
>
> As suggested by Romain in his review, I've dropped the rename.
> Generally speaking, when things aren't clear between _ and -, I very
> much prefer to see - used in package name (though I admit this is a
> personal preference).

Yes, I generally have the same preference. In the Erlang world, the
style is to use underscores since module names can be represented as
atoms. In theory, you can quote atoms if you want them to have
hyphens, but it doesn't look pretty. In the end, I don't think that it
bothers me either way, so I'm happy to leave it as is.

>
>
>>  config BR2_PACKAGE_ERLANG_P1_STUN
>> -     bool "erlang-p1-stun"
>> -     select BR2_PACKAGE_ERLANG_P1_TLS
>> +     bool "erlang-p1_stun"
>> +     select BR2_PACKAGE_ERLANG_FAST_TLS
>
> Build testing has shown that BR2_PACKAGE_ERLANG_FAST_TLS was not the
> proper dependency, and instead keeping BR2_PACKAGE_ERLANG_P1_TLS was
> the right solution. Could you double check why you switched to
> fast_tls ?

This was a mistake on my part. I fixed it in a patch that I hadn't
sent to the list, so thanks for fixing that for me.

Frank

>
> So, I've applied to next, with the following changes:
>
>     [Thomas:
>      - do only the version bump, not the package rename, as suggested by
>        Romain Naour
>      - erlang-p1-stun continues to depend on erlang-p1-tls, not
>        erlang-fast_tls.]
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com



-- 
Frank Hunleth
Troodon Software LLC
Embedded Software Development
http://troodon-software.com/
