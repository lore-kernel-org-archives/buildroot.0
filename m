From: Willy Lambert <lambert.willy@gmail.com>
Date: Tue, 18 Dec 2012 16:19:47 +0100
Subject: [Buildroot] Using a precompiled busybox toolchain as an
	external toolchain
In-Reply-To: <20121218135336.2e24d6bc@skate>
References: <CAKvQZ_0sLwXqmGeTdeC6EBqqZ_FN4s6cVcnM3OwVrSHHYHfWDA@mail.gmail.com>
 <20121218135336.2e24d6bc@skate>
Message-ID: <CAKvQZ_3-v9ArCy0b6Q9VmzNToDaigk1=USPJsgUKpEptzeP1yA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2012/12/18 Thomas Petazzoni <thomas.petazzoni@free-electrons.com>:
> Dear Willy Lambert,
>
> On Tue, 18 Dec 2012 13:42:07 +0100, Willy Lambert wrote:
>
>> _ copy ouptut/host/usr in ${MY_TOOLCHAIN_PATH}
>
> No, this will not work. The toolchain produced by Buildroot is not
> relocatable.

aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaah. To be honest an entry
in the manual to state this would be nice.


>
> Instead, set BR2_HOST_DIR to ${MY_TOOLCHAIN_PATH}, and then do your
> toolchain build. The toolchain will be installed in
> ${MY_TOOLCHAIN_PATH}, and you can use it as an external toolchain for
> other Buildroot builds.
>

thanks, should I understand that I can't publish the buildroot
toolchain on another  PC without installing it at the __same__ place ?

> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, Free Electrons
> Kernel, drivers, real-time and embedded Linux
> development, consulting, training and support.
> http://free-electrons.com
