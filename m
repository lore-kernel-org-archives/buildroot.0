From: =?UTF-8?Q?Andr=c3=a9_Hentschel?= <nerv@dawncrow.de>
Date: Mon, 19 Sep 2016 23:22:23 +0200
Subject: [Buildroot] Hint on switching between targets
In-Reply-To: <CAOMZO5BMOLDEq-xnwLBvX80biZ+-HJKVE1-U6xGx8CWXS-hBGg@mail.gmail.com>
References: <CAOMZO5BRPzX=cOpPJyH2ZmyxNhB6wu_EBFBm_DpcRz+Hd7MtKw@mail.gmail.com>
 <87h99b630z.fsf@dell.be.48ers.dk>
 <CAOMZO5BMOLDEq-xnwLBvX80biZ+-HJKVE1-U6xGx8CWXS-hBGg@mail.gmail.com>
Message-ID: <ab1512c2-916c-4724-ecdf-2c0770fa1acd@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 19.09.2016 um 23:01 schrieb Fabio Estevam:
> On Mon, Sep 19, 2016 at 5:35 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
> 
>> Do you mean that you would like to keep some of the already built
>> components when changing configuration? That isn't generally supported.
> 
> Yes, that's correct.
> 
>> If you know what you are doing and the two configurations are
>> sufficiently similar (same arch/toolchain config) then it will work, but
>> Buildroot will not warn you if you do something that doesn't make sense.
>>
>> If you just want to keep your warp7 output around while you build for
>> wandboard you can use out-of-tree builds - E.G.
>>
>> make O=output-wandboard wandboard_defconfig
>> cd output-wandboard && make
> 
> That helps, thanks.


Isn't it easier to just do:

mv output output-warp7
make wandboard_defconfig
