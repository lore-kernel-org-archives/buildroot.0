From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 5 Sep 2013 09:20:57 +0200
Subject: [Buildroot] [PATCH v2 1/1] Change package tarball compression
 to xz whenever possible
In-Reply-To: <CAAXf6LVPX7SU6RsHTN_Eg8g3hRxvRT7=dDP-FO_fFo+CfznmQw@mail.gmail.com>
References: <1375000629-19254-1-git-send-email-jerzy.grzegorek@trzebnica.net>
 <1375000629-19254-2-git-send-email-jerzy.grzegorek@trzebnica.net>
 <CAAXf6LUFnJff9asJy1JXp3dJOq8jFi78TbDpmZDWdMu3tYBq=Q@mail.gmail.com>
 <51F64468.8080902@trzebnica.net>
 <CAAXf6LVPX7SU6RsHTN_Eg8g3hRxvRT7=dDP-FO_fFo+CfznmQw@mail.gmail.com>
Message-ID: <CAAXf6LUo1hd7FdPQ-UurVAO7EAat1HcWQT5=AVF-OpSYrGX56Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

On Mon, Jul 29, 2013 at 2:13 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> On Mon, Jul 29, 2013 at 12:31 PM, Jerzy Grzegorek
> <jerzy.grzegorek@trzebnica.net> wrote:

>> You are right that if we will change the default assignment
>> of FOO_SOURCE from .tar.gz to .tar.xz it would require
>>
>> changing those packages that do not explicitly set
>> FOO_SOURCE, and removing the explicit .tar.xz
>> SOURCE lines that have been added in this and prior patches.
>> Lets assume that now we have x .tar.gz packages that do not
>> explicitly set FOO_SOURCE, and y .tar.xz packages.
>> In this case it would require changing x+y packages.
>> Lets assume that after some time z packages will have been changed from
>> .tar.gz to .tar.xz. Then it would require changing (x-z)+(y+z) = x+y
>> packages. So, IMHO it doesn't matter when we will (eventually)
>> change the default assignment. Right?
>>
>
> Well, if we assume that there will be more *new* packages in .tar.xz
> than in .tar.gz, y will increase, and the work to be done later will
> increase. The sooner .tar.xz becomes the default, the less new
> packages have to be changed afterwards.
>
> But, the difference may not be large enough, so we could also wait
> until there are much more .xz packages...
>


As far as I'm concerned, the above patch is fine for now.
I'm not sure if some rebasing is needed because some versions might
have changed, though. Maybe something you could check and resend?

Thanks,
Thomas
