From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 16 Jun 2016 11:52:29 +0200
Subject: [Buildroot] Patchwork cleanup week #24
In-Reply-To: <20160616093209.739fbc03@free-electrons.com>
References: <20160615220634.67eb8fa9@free-electrons.com>
 <CAAXf6LVu1+p1mQrWvrUFyPzbDJeZGyFZLNeTCYQ-XrQR1SsjCw@mail.gmail.com>
 <20160616093209.739fbc03@free-electrons.com>
Message-ID: <CAAXf6LWhMinzCm-oBqROt1ddxtdawHO+fLz61Bhwkqdy4mXkzA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,

On Thu, Jun 16, 2016 at 9:32 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Thomas,
>
> Thanks for giving some feedback!
>
> On Thu, 16 Jun 2016 09:18:37 +0200, Thomas De Schampheleire wrote:
>
>> [..]
>> >  6. wget download: 'scheme missing' results in empty output file
>> >     http://patchwork.ozlabs.org/patch/599387/
>> >
>>
>> The mail thread where this patch originated from is at:
>> http://lists.busybox.net/pipermail/buildroot/2016-February/153953.html
>>
>> There was no further response on this patch, but as far as I'm
>> concerned the issue is still present and could use a fix.
>>
>> What do you think about the proposed solution?
>
> I am not sure what is the best solution between:
>
>  - Defining <foo>_SITE to undefined when no value is specified by the
>    package (which is your proposal)
>
>  - Do not add to <pkg>_ALL_DOWNLOADS the files for which there is
>    no :// in the URL, and <pkg>_SITE is empty. This was the proposal
>    made by Yann in
>    http://lists.busybox.net/pipermail/buildroot/2016-February/153999.html.

This does not give the intended result. It was in the thread but in
March, so mailman fails to link it (meh...)
http://lists.busybox.net/pipermail/buildroot/2016-March/156416.html

>
>  - Error out when both <pkg>_SITE is empty and <pkg>_SOURCE is
>    non-empty.

I guess this could also work. If you prefer this I can cook up a real patch.
Input from others is welcome too, of course.

Thanks,
Thomas
