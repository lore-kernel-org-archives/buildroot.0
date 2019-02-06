From: Arnout Vandecappelle <arnout@mind.be>
Date: Wed, 6 Feb 2019 18:01:27 +0100
Subject: [Buildroot] [PATCH 1/2] package/opengl/libgbm: new virtual
 package
In-Reply-To: <CABhNV20mHtyqjiPfq_c_nWjZfmZ8DB38dzsyhNovoxQratAiMw@mail.gmail.com>
References: <20180913194410.24077-1-bernd.kuhls@t-online.de>
 <20181030221420.65c7aed3@windsurf> <20181105124735.3qbms4ymnrgpw3op@flea>
 <CABhNV23smKagYKYME1Na=Cyz0+hn2BPOEpKumruu3OyAmLt1fw@mail.gmail.com>
 <20181105164347.4bd8d103@windsurf>
 <CABhNV20QpHnRCEi=Ky-AKCVByGkNLRxOXfMHK5H9PCr3eBeAXA@mail.gmail.com>
 <CABhNV207WB2Jt11iFeWroxn7K3EDKYSiz12mhr-2+wF2hM3yJQ@mail.gmail.com>
 <20181130114648.439ceb94@windsurf>
 <CABhNV20mHtyqjiPfq_c_nWjZfmZ8DB38dzsyhNovoxQratAiMw@mail.gmail.com>
Message-ID: <88568126-5814-c59e-990f-3580baa1cc9d@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

 Hi Einar, Bernd,

On 30/11/2018 13:02, Einar J?n wrote:
> On Fri, 30 Nov 2018 at 11:46, Thomas Petazzoni
> <thomas.petazzoni@bootlin.com> wrote:
>>
>> Hello Einar,
>>
>> On Fri, 30 Nov 2018 11:05:11 +0100, Einar J?n wrote:
>>
>>> I finally had time to play with the gbm branch on
>>> https://git.bootlin.com/users/thomas-petazzoni/buildroot/log/
>>> I made 5 commits that add QT with EGLFS-GBM for all 2 setups.
>>
>> Cool! What are the results ? Can you build Qt with all eglfs/gbm
>> implementations (mesa3d, ti and mali) ?
> 
> Build: Yes
> Run: ????
> 
> I don't have the hardware to test any of the setups (Maybe I can test
> ti-sgx in December,
>  but since "tomorrow" took me over 3 weeks, I'm not going to promise anything).
> But I do have QT with EGLFS on all 3 platforms. I disabled kmscube on
> the 2 that are not MESA.

 I think the conclusion from that series is that it does not make sense to make
a virtual package of libgbm: kmscube only works with mesa, and even qt5 requires
some provider-specific fixups to make it work.

 So the proposal would be to (for now) drop the virtual package, and instead
keep them as separate packages (which are mutually exclusive, of course).

 All these patches are marked as Changes Requested in patchwork.

 Regards,
 Arnout

> 
>> You can either push your branch somewhere (on Github or elsewhere) or
>> otherwise post the patches on the mailing list, making it clear in the
>> cover letter that they depend on another set of patches.
> 
> I'll just push them to the mailing list. See cover letter for details
> 
