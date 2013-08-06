From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Tue, 6 Aug 2013 17:03:05 +0200
Subject: [Buildroot] AVR32 toolchain build failure
In-Reply-To: <CAAXf6LWyHfM1BiOkWsTJw2i7xmtEYO9YifunQ43Ws1yDH6u0wg@mail.gmail.com>
References: <CAAXf6LUhgOkHgj=cRWnkR8tPhAAjT6BhXFvXTBvC5pHfTZ=vww@mail.gmail.com>
 <CAAXf6LXpML0_kexS1=sdSc8iEZzk4-DaHbx=jXkrBa8miujM1g@mail.gmail.com>
 <CAAHaz6E=FztD=1pnk8sVYj2sd98VVuiYFFg7+LYhmD9_v7gM1w@mail.gmail.com>
 <CAAXf6LWyHfM1BiOkWsTJw2i7xmtEYO9YifunQ43Ws1yDH6u0wg@mail.gmail.com>
Message-ID: <CAAXf6LXvD1w3D=CkiK9XGacaOenB=8M+9xJJopPdw-xz+nB=+w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Aug 6, 2013 at 4:40 PM, Thomas De Schampheleire
<patrickdepinguin+buildroot@gmail.com> wrote:
> Hi Alexander,
>
> On Tue, Aug 6, 2013 at 11:27 AM, Alexander Lukichev
> <alexander.lukichev@gmail.com> wrote:
>> Hello, Thomas!
>>
>> I had the same problem but was too busy at the time to articulate it here or
>> to Thomas (Petazzoni), instead asking him if I could somehow use autobuilder
>> to test out fixes :) Thanks for posting. I do not know what is the problem
>> but I have it also.
>
> Thanks for letting me know.
>
> I found some info regarding this error here:
> http://stackoverflow.com/questions/8188849/avr-linker-error-relocation-truncated-to-fit
>
> after which I tried adding -mno-short-calls to the failing xgcc call.
> This did not change a thing however.
>
> I'm wondering if it's at all possible to compile libstdc++ for avr32.
> Following project seems to suggest it is:
> https://github.com/jsnyder/avr32-toolchain/blob/master/Makefile
> I looked through some of the options, but did not notice anything out
> of the ordinary. One thing I did see is that for the avr32-toolchain
> project, -Os is used. Could this fix the relocation truncation?

Scratch that: there is an autobuild toolchain for AVR32, so it's
obviously possible to make one.
There must be some other difference.

Best regards,
Thomas
