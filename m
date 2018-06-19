From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Tue, 19 Jun 2018 12:27:27 +0000
Subject: [Buildroot] Fwd: [PATCH] arm: ensure symbol is a thumb symbol
 in new binutils
In-Reply-To: <062a421f-a669-fc1c-91e0-88cf73794414@redhat.com>
References: <20171121172751.29545-1-Jason@zx2c4.com>
 <CAHmME9qBxgDV-HGeqj75ohr=4Bf+TD73PcC0DUqTRh5PTOKyhQ@mail.gmail.com>
 <20171123140228.GP31757@n2100.armlinux.org.uk>
 <CAKv+Gu8TJi8qSWAkL231WhQkWxK+vSQm2tnQn_qN-2wdFaNaEA@mail.gmail.com>
 <765227b5-981d-0cea-c831-73cfe2f58721@redhat.com>
 <aaf57bb5-13e6-852c-0f67-f72aedef0e79@gmail.com>
 <254af731-459b-1f1d-2d93-27c5a91e7bfb@redhat.com>
 <1e9b8ffd-cc1d-2c39-e34a-d1e33f49a645@gmail.com>
 <aca33630-3c36-4ba9-0237-b971cb7ffee7@st.com>
 <2a8151c1-644e-a6b0-9a21-2c570ac7000b@redhat.com>
 <9495e928-0ea5-8b47-84b6-5609078950b2@st.com>
 <ec2b0134-6c4a-53ff-4ae2-69c3f0646ded@redhat.com>
 <93bd3c78-3884-40be-76f5-f7946f7e03a8@st.com>
 <1d8f302b-5ece-9921-b930-8c4bca61743e@redhat. com>
 <CAJA7tRbsNa7oTS-1sLs0WpA74RZr0R-v=sCyQxbDam5Gb7fYHA@mail.gmail.com>
 <be2db8d4-7c12-2706-5084-322aa659c3bc@redhat.com>
 <a42868bb-f33a-c9ef-1e5b-31e37282b03d@st.com>
 <81b78bb2-d7a0-8514-1bf6-4d26062756c8@gmail.com>
 <062a421f-a669-fc1c-91e0-88cf73794414@redhat.com>
Message-ID: <0a6d5bc7-f7e9-225e-9901-8b10c0677d94@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

HI Nick,
On 06/19/2018 02:01 PM, Nick Clifton wrote:
> Hi Romain,
>
>>>>     Does my suggestion of making the assembler's interpretation of
>>>>     the ADR and ADRL pseudo-ops depend upon the -mthumb-interwork
>>>>     switch seem like a good idea ?
>>> I think it's a good trigger but I'm not an expert on this domain.
>> Same here...
>> I'm not sure how many project enable -mthumb-interwork option.
> Well actually that is the point.  By making the ADR/ADRL pseudo-ops
> only set the bottom bit if the -mthumb-interwork option is used, we
> will effectively be restoring the old behaviour of the assembler to
> any project that does not use it.  So the ARM kernel in particular
> will get the old behaviour back, which is what I think is wanted.
>
> So - any objections to the change ?  Anyone ?
>
> Cheers
>    Nick
>
>
>
>
I'm ok with this approach, and I'm available for possible patches to test.

Regards
Christophe

-- 

Best regards / Cordialement,

Christophe Priouzeau | Tel: +33 244027320
STMicroelectronics
ST online: www.st.com<http://www.st.com/>
