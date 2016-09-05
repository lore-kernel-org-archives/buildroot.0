From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 5 Sep 2016 23:40:20 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: use
	BR2_TOOLCHAIN_HAS_LIBATOMIC
In-Reply-To: <20160905232539.14f32fa1@free-electrons.com>
References: <20160905210056.24393-1-bernd.kuhls@t-online.de>
 <CAHXCMML=sFVVn4wrBaX4cv3iZn_k4_+ERWvHr6bShfftXBqa3Q@mail.gmail.com>
 <20160905232539.14f32fa1@free-electrons.com>
Message-ID: <CAHXCMMLtrNGPL3cGBAa7UyyQQ2f=903Xcfj6QU_eTj22xdb9Hw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Sep 5, 2016 at 11:25 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Mon, 5 Sep 2016 23:20:00 +0200, Samuel Martin wrote:
>
>> > +# Uses __atomic_fetch_add_4
>> > +ifeq ($(BR2_TOOLCHAIN_HAS_LIBATOMIC),y)
>> > +OPENCV3_CONF_OPTS += -DCMAKE_CXX_FLAGS="-latomic"
>> > +endif
>>
>> Since you add the dependency on BR2_TOOLCHAIN_HAS_ATOMIC in the
>> Config.in, I wonder whether nested conf. opts. update in a if-block
>> that will always be true is really necessary...
>
> You're confusing BR2_TOOLCHAIN_HAS_ATOMIC with
> BR2_TOOLCHAIN_HAS_LIBATOMIC. There's a subtle difference :)
>
gah! Right :-/

> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux and Kernel engineering
> http://free-electrons.com



-- 
Samuel
