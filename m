From: =?ISO-8859-1?Q?Thiago_A=2E_Corr=EAa?= <thiago.correa@gmail.com>
Date: Fri, 6 Mar 2009 14:56:38 -0300
Subject: [Buildroot] svn commit: trunk/buildroot/toolchain/binutils
In-Reply-To: <20090303220951.E40FB7626F@busybox.osuosl.org>
References: <20090303220951.E40FB7626F@busybox.osuosl.org>
Message-ID: <d6cda7730903060956r6a3c5fe8ra2ee09251ce81d61@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter,

On Tue, Mar 3, 2009 at 7:09 PM,  <jacmet@uclibc.org> wrote:
> Changeset:
> Modified: trunk/buildroot/toolchain/binutils/Config.in
> ===================================================================
> --- trunk/buildroot/toolchain/binutils/Config.in ? ? ? ?2009-03-03 21:23:34 UTC (rev 25512)
> +++ trunk/buildroot/toolchain/binutils/Config.in ? ? ? ?2009-03-03 22:09:50 UTC (rev 25513)
> @@ -20,6 +20,7 @@
>
> ? ? ? ?config BR2_BINUTILS_VERSION_2_18
> ? ? ? ? ? ? ? ?depends on !BR2_nios2
> + ? ? ? ? ? ? ? depends on BR2_DEPRECATED
> ? ? ? ? ? ? ? ?depends on BR2_EXT_BINUTILS_VERSION_2_18
> ? ? ? ? ? ? ? ?bool "binutils 2.18"
>

This breaks AVR32 external toolchain thing. I tried to make it:
depends on BR2_DEPRECATED if !BR2_avr32

but it didn't work, looks like kconfig doesn't accept ! logic with depends

Is there a way around? Right now I've removed that line from my local
repository to keep things working.

Kind Regards,
   Thiago A. Correa
