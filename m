From: Przemyslaw Wrzos <przemyslaw.wrzos@calyptech.com>
Date: Fri, 15 Mar 2013 11:18:44 +1100
Subject: [Buildroot] Crosstool-NG unnecessary rebuilds [BUG]
References: <EE5E77B503DE9A478B63A89AAD2585EDB66A60@vpane.excalyptech.com><20130313083725.4605312e@skate><201303131910.06613.yann.morin.1998@free.fr>
 <20130314084816.00d23bd7@skate>
Message-ID: <EE5E77B503DE9A478B63A89AAD2585EDB66A63@vpane.excalyptech.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello Thomas,

On Thu, 14 Mar 2013 at 18:48:16, Thomas Petazzoni wrote:

> I'm not sure to agree here. The Buildroot policy is: we don't even try
> to rebuild whatever would be needed when there are configuration
> changes. For example, when there is a change of toolchain
> configuration, you will with your code maybe rebuild the toolchain,
but
> not the entire userspace.
> 
> So either we do it completely, and correctly, or we don't do it. And
as
> far I as remember, the Buildroot project position on this has always
> been: it is too complex to achieve entirely correctly, so we just
don't
> do it.

So just a question about the effect of that. If we remove that
dependency then won't this be inconsistent with how the internal
buildroot toolchain build works? Or does it not matter because the
internal toolchain is going to be deprecated eventually anyway.

Cheers,
Przemyslaw Wrzos
