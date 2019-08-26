From: =?UTF-8?Q?Alejandro_Gonz=c3=a1lez?= <alejandro.gonzalez.correo@gmail.com>
Date: Mon, 26 Aug 2019 21:35:02 +0200
Subject: [Buildroot] [PATCH v2] package/iputils: add configs to select
 which binaries are built
In-Reply-To: <20190826192116.GB12246@x230>
References: <20190826180719.3270-1-alejandro.gonzalez.correo@gmail.com>
 <c6bb6178-d468-a95f-804c-b7958abb6f90@gmail.com>
 <20190826192116.GB12246@x230>
Message-ID: <5ef020ff-f4da-27a9-fa94-77bd30ead735@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

El 26/8/19 a las 21:21, Petr Vorel escribi?:
> Hi Alejandro,
> 
>> El 26/8/19 a las 20:07, Alejandro Gonz?lez escribi?:
>>> By default, the iputils build script might build binaries which are
>>> useless for certain applications, like tftpd. Those binaries will bloat
>>> the target filesystem unless a post-build script removes them manually,
>>> which is cumbersome and doesn't shorten build times.
> 
>>> These changes add Kconfig options which let the user select what
>>> binaries are built with ease.
> 
>>> Signed-off-by: Alejandro Gonz?lez <alejandro.gonzalez.correo@gmail.com>
> Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
> 
> I understand the concern, but not sure if this is a buildroot policy.
> IMHO there is a concern not to put too many options in Kconfig.
> Thomas, Petr, am I right?
> 
> Kind regards,
> Petr
> 
Thank you for your prompt review.

I understand that too many options might be confusing and/or ugly.
However, in this case, these options are only shown in the menuconfig
when the iputils package is selected. If it is not, then they won't
show up, and they won't clutter the view. There are other packages that
offer similar options, like ntp or iptables, but I don't know if they
precisely are examples to follow for new development.

Regards.
