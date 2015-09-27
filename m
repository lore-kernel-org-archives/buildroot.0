From: Cjw X <cjwfirmware@vxmdesign.com>
Date: Sun, 27 Sep 2015 12:40:41 -0400
Subject: [Buildroot] [PATCH 1/3] Experimental addition of the newlib
	library
In-Reply-To: <20150925093028.34715322@free-electrons.com>
References: <1442127768-26447-1-git-send-email-cjwfirmware@vxmdesign.com>
 <20150913101738.238ebc06@free-electrons.com>
 <CAOudHSVcePTAq7PLON-0Zig-JkJtTNnu-RzHtkYf0f00pe8atw@mail.gmail.com>
 <20150915093523.0597731f@free-electrons.com>
 <20150915175354.GA3650@free.fr>
 <20150915213924.62547101@free-electrons.com>
 <87fv23o686.fsf@dell.be.48ers.dk>
 <20150925093028.34715322@free-electrons.com>
Message-ID: <CAOudHSX6S9gw9mSYW9T19qRat3YnF8gwKgPBsgs=MY3Gfg1Ljw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi All, Thomas,


On Fri, Sep 25, 2015 at 3:30 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Thu, 24 Sep 2015 23:30:33 +0200, Peter Korsgaard wrote:
>
>>  > Maybe we first need to get an agreement on whether we want to merge
>>  > something such a newlib toolchain support and NuttX support. On my
>>  > side, I believe I am quite favorable to that, but I was also favorable
>>  > to Luca's patch series on the mdev stuff without devtmpfs, which is why
>>  > Luca started working on this, but in the end, it got turned down.
>>
>> I wouldn't call it "getting turned down", I simply wanted to make it
>> clear that just working around old kernels in mdev wouldn't fix the
>> various other packages that haven't ever been tested on such ancient
>> kernels, and for the mdev issue a simpler fix would just be to backport
>> devtmpfs support to the kernel.
>>
>> I must say that my initial thought when seeing the newlib patches was
>> that this was really outside the scope of Buildroot, but the patches ARE
>> quite small and self contained, so if there is interest it might make
>> sense after all.
>>
>> I does require that we basically stick the entire package/ under an
>> ifndef NEWLIB (and system / fs / linux as well), and it will stay a
>> lower priority than the normal Linux stuff, but if that can be done
>> at a high enough level then that is probably ok.
>>
>> I recently bought one of those cheap arduino clones with a stm32f103
>> (m3) for tinkering, so I might even use it myself! ;)
>
> Great, thanks for the feedback. Then we'll continue to work with Chris
> to provide a proper solution.
>

That is great news!

I submitted a few patches a few days ago. How do those look? I'm
guessing that is much closer to what you want.

Thanks,
-Chris


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
