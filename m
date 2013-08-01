From: Thomas De Schampheleire <patrickdepinguin+buildroot@gmail.com>
Date: Thu, 1 Aug 2013 14:51:32 +0200
Subject: [Buildroot] ccache dependency issues
In-Reply-To: <20130801140706.1ec7edbc@skate>
References: <CAAXf6LWo29hYTDoGfmoQRV4krkhy_vCy7-irvB1qas6RuGbJsw@mail.gmail.com>
 <20130801113514.495c3b0d@skate>
 <CAAXf6LVwctGqfMYiG_fLGccTS0+yubt678k1bC95H_hmkQQ3QA@mail.gmail.com>
 <20130801135731.2ba53f36@skate>
 <CAAXf6LWJPwOwVbP4VOfe2cLRLHC1Ezgk=kx2vYEpEsaMcG7bVA@mail.gmail.com>
 <20130801140706.1ec7edbc@skate>
Message-ID: <CAAXf6LXXukE6yzOEC-U7vVEXq9mnkmjrG8M22=Ou00oVZ2VNJw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Aug 1, 2013 at 2:07 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Thomas De Schampheleire,
>
> On Thu, 1 Aug 2013 14:03:12 +0200, Thomas De Schampheleire wrote:
>
>> > So the dependencies such as host-tar and host-xzcat are always pulled
>> > before host-sstrip and host-ccache, so we should be all set. For sure,
>> > this is the case because we don't do top-level parallel build, but
>> > there are already many places in Buildroot that rely on ordering of
>> > dependencies.
>> >
>>
>> You're right, this order is fine.
>>
>> But the solution of moving host-ccache to dependencies seems so
>> surprisingly simple... I wonder why no-one thought of it before,
>> surely we are missing something?
>
> I think a lot of the things with those "main" targets in the main
> Makefile and the BASE_TARGETS, TARGETS variables and so on is just a
> big mess that no one ever cleaned up and clarified with good rules
> about what each variable is.
>
> That's why I've NAKed additional 'hacks' such as
> http://patchwork.ozlabs.org/patch/257372/ in the past. BTW, I think
> moving ccache into the dependencies will avoid the need for this patch
> 257372, and then we can apply http://patchwork.ozlabs.org/patch/257374/
> and http://patchwork.ozlabs.org/patch/257375/.

Ok, sounds good.
I'll try to create a patch soon, or if you want to do it that's fine
by me as well.

Best regards,
Thomas
