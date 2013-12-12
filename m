From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Thu, 12 Dec 2013 10:32:53 -0500
Subject: [Buildroot] [PATCH] erlang: add option to enable SMP support
In-Reply-To: <20131212144519.GM1217@tarshish>
References: <1386856902-23162-1-git-send-email-fhunleth@troodon-software.com>
 <20131212144519.GM1217@tarshish>
Message-ID: <CA+-urNSMeTNszXRYU8PAszAzjQrwnOTFMh5SajToiEOV=08AqQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Baruch,

On Thu, Dec 12, 2013 at 9:45 AM, Baruch Siach <baruch@tkos.co.il> wrote:
> Hi Frank,
>
> On Thu, Dec 12, 2013 at 09:01:42AM -0500, Frank Hunleth wrote:
>> Erlang builds two emulators depending on whether SMP is supported or
>> not. If it is known that the target does not support SMP, turning off
>> the SMP emulator saves compile time and reduces the size of the
>> installation.
>
> Missing sign-off.

Thanks for catching. Fixed in v2.

> Is there an option on only build (or at least install) the SMP version?

It doesn't appear that there's an option to only build the SMP
version. It looks like if you manually delete the UP version, Erlang
still works fine on an SMP system. I must admit, though, that I don't
know if this will always work and I'm a little uneasy about doing it
without more testing.

Frank
