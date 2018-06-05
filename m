From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Tue, 5 Jun 2018 08:52:48 +0000
Subject: [Buildroot] Fwd: [PATCH] arm: ensure symbol is a thumb symbol
 in new binutils
In-Reply-To: <2a8151c1-644e-a6b0-9a21-2c570ac7000b@redhat.com>
References: <20171121172751.29545-1-Jason@zx2c4.com>
 <20171121173857.GJ31757@n2100.armlinux.org.uk>
 <CAHmME9quDFbdOR9hKRz-Px=Mh3FvYEyhVrs4V_+JT+GjDajMrA@mail.gmail.com>
 <20171121174942.GK31757@n2100.armlinux.org.uk>
 <CAHmME9oMTNJFnOwfhu26QSRSP92Axbc-+v9cCPsTKxekZvGvxg@mail.gmail.com>
 <20171123103518.GL31757@n2100.armlinux.org.uk>
 <CAHmME9qBxgDV-HGeqj75ohr=4Bf+TD73PcC0DUqTRh5PTOKyhQ@mail.gmail.com>
 <20171123140228.GP31757@n2100.armlinux.org.uk>
 <CAKv+Gu8TJi8qSWAkL231WhQkWxK+vSQm2tnQn_qN-2wdFaNaEA@mail.gmail.com>
 <765227b5-981d-0cea-c831-73cfe2f58721@redhat.com>
 <aaf57bb5-13e6-852c-0f67-f72aedef0e79@gmail.com>
 <254af731-459b-1f1d-2d93-27c5a91e7bfb@redhat.com>
 <1e9b8ffd-cc1d-2c39-e34a-d1e33f49a645@gmail.com>
 <aca33630-3c36-4ba9-0237-b971cb7ffee7@st.com>
 <2a8151c1-644e-a6b0-9a21-2c570ac7000b@redhat.com>
Message-ID: <9495e928-0ea5-8b47-84b6-5609078950b2@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Nick,

On 06/04/2018 04:13 PM, Nick Clifton wrote:
> Hi Christophe,
>
>> I have made the test on buildroot 2018.05-rc3 with bintutils 2.29.1 and
>> 2.30,
>> for the two test my boot failed. The proposition of correction doesn't work.
> Ho hum.  OK, please could you try out this attached patch instead.  It is part
> of a larger patch to allow the behaviour of the assembler to be controlled by
> a command line option, whose default is set at configure time.  I just want to
> be sure that the "ADR-does-NOT-set-interworking" default option actually does
> work before I complete the rest of the patch.
>
> Cheers
>    Nick
>
>
I have made several test, with or without the define 
"DEFAULT_THUMB_ADR_SETS_INTERWORKING",
but my test are always fails (no boot of my kernel).
The only thing I seen it's working are to made a modification on the 
kernel following the tread: https://patchwork.kernel.org/patch/10072631/.
For binutils, actually I have some doubt I have made a basic test to 
comment the part of code on do_adr and do_adrl for thumb part and I always
generate the same code which doesn't boot.

Thanks
Regards
Christophe
