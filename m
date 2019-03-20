From: Esben Haabendal <esbenhaabendal@gmail.com>
Date: Wed, 20 Mar 2019 16:03:16 +0100
Subject: [Buildroot] [PATCH 0/3] Gummiboot fixup
In-Reply-To: <871s31ehot.fsf@dell.be.48ers.dk>
References: <20190319112852.9592-1-esben.haabendal@gmail.com>
 <875zseitgs.fsf@dell.be.48ers.dk>
 <CAOR3GqXSxZw3m+OD3FLCFOR0Gi-v3zNJGe2+3Bhy7R6av7LVhQ@mail.gmail.com>
 <875zsdek04.fsf@dell.be.48ers.dk>
 <CAOR3GqU17TUskOwG_8DfwrcEt_AJcqzgD8=5j1c2Wa+LVveeSg@mail.gmail.com>
 <871s31ehot.fsf@dell.be.48ers.dk>
Message-ID: <CAOR3GqV69iT1+1Qh3=j8MQygZGJApomnqB_xi1Hue3NrTRVTDA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Mar 20, 2019 at 3:36 PM Peter Korsgaard <peter@korsgaard.com> wrote:

> >>>>> "Esben" == Esben Haabendal <esbenhaabendal@gmail.com> writes:
>
>   >> Ok. Out of interest, what is gummiboot adding over just directly
> booting
>  >> a Linux kernel with CONFIG_EFI_STUB?
>
>  > With gummiboot, I can point to a separate initramfs file. I haven't
> figured
>  > out
>  > how to do that with CONFIG_EFI_STUB, as the CONFIG_CMDLINE args
>  > are not processed by the EFI stub.
>
> I have never tried, but it looks as if you can just set
> initrd=<path/to/initramfs/in/esp>
>
> https://www.kernel.org/doc/Documentation/efi-stub.txt
>

Yes, you can use initrd=... if you provide the cmdline to the EFI stub.
But if you compile in the cmdline using CONFIG_CMDLINE, it will
not work, as it will only be available for Linux kernel, and not for
EFI stub.

/Esben
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20190320/64a132a5/attachment.html>
