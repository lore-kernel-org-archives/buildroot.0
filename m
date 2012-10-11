From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu, 11 Oct 2012 10:53:56 -0300
Subject: [Buildroot] util-linux version update 2.22.1
In-Reply-To: <1349963445.28555.4.camel@localhost>
References: <1349961942.28555.1.camel@localhost>
 <5076CD9E.9000307@zacarias.com.ar> <1349963445.28555.4.camel@localhost>
Message-ID: <5076CF74.4000302@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 10/11/12 10:50, Alexander Khryukin wrote:
> I can comile util-linux 2.22.1 with
> 
>         $(if $(BR2_PACKAGE_UTIL_LINUX_LOGIN),,--disable-login) \
>         $(if $(BR2_PACKAGE_UTIL_LINUX_SU),,--disable-su)

Yes, but you're not accounting for it in your patch.
Maybe someone wants util-linux loginutils instead of busybox, and when
selected if they don't enable PAM the build breaks.
And removing options isn't that nice either.
Regards.
