From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 26 Sep 2013 10:27:34 -0500
Subject: [Buildroot] libssh2 dependencies
In-Reply-To: <CANxTyt7r0O5Vtr4EGU+JGi71W-ZJHD4tahLnHi6PQFDxmOK_6A@mail.gmail.com>
References: <CANxTyt7r0O5Vtr4EGU+JGi71W-ZJHD4tahLnHi6PQFDxmOK_6A@mail.gmail.com>
Message-ID: <OFF08FCE3E.A977079F-ON86257BF2.00547F6C-86257BF2.0054EBE3@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Danomi,

Danomi Manchego <danomimanchego123@gmail.com> wrote on 09/26/2013 10:20:36 
AM:

> Ryan, Peter,
> 
> I was just looking at the select in libssh2/Config.in:
> 
>   select BR2_PACKAGE_LIBGCRYPT if !BR2_PACKAGE_OPENSSL
> 
> If you don't already have either openssl or libgcrypt, then when you
> enable libssh2, libgcrypt and libgpg-error get selected as if they are
> unconditional dependencies - but then unselect themselves if you
> enable openssl.  But it's not clear from menuconfig that this is an
> option.  Would it be better to do:

libgcrypt is the preferred crypto package since it much smaller than
openssl. Please see further information about why this was done from
this mailing list:

http://lists.busybox.net/pipermail/buildroot/2013-August/077150.html

However, you can always submit a patch if you would prefer to change
the way it appears. This will open it up for discussion on the mailing
list.

>   depends on BR2_PACKAGE_LIBGCRYPT || BR2_PACKAGE_OPENSSL
> 
> and then comment:
> 
>   comment "libssh2 requires libgcrypt or openssl"
>     depends on (!BR2_PACKAGE_LIBGCRYPT && !BR2_PACKAGE_OPENSSL)
> 
> Just a thought ....
> 
> Danomi -

Thanks,
-Ryan


------------------------------------------------------------------------------------------
Ryan J Barnett / Software Engineer / Platform SW
MS 137-157, 855 35th St NE, Cedar Rapids, IA, 52498-3161, US
rjbarnet at rockwellcollins.com
www.rockwellcollins.com

-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20130926/7a1d7497/attachment.html>
