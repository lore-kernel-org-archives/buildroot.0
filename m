From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Tue, 28 Jul 2015 09:31:32 +0200
Subject: [Buildroot] [PATCH v3] rtl8188eu: new package
In-Reply-To: <20150727234308.77aff941@free-electrons.com>
References: <1437991580-31649-1-git-send-email-luca@lucaceresoli.net>
 <20150727234308.77aff941@free-electrons.com>
Message-ID: <55B72FD4.1030704@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Thomas,

thanks for the cleanups. I have a question, see below.

Thomas Petazzoni wrote:
> Dear Luca Ceresoli,
>
> On Mon, 27 Jul 2015 12:06:20 +0200, Luca Ceresoli wrote:
>> Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
>> Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
>>
>> ---
>
> I've applied, but there were still numerous improvements that could be
> made after the conversion to the kernel-module infra:
>
>      [Thomas:
>        - remove patches 0001 and 0002, they are not needed since when using
>          the kernel-module infrastructure, we directly call the kernel
>          build system and bypass the one provided by the external module
>        - install the firmware directly in the Buildroot .mk file, which
>          allows to also remove patch 0003.

I'm OK with this change: better avoiding patches when possible.

But should patch 3 be merged upstream at some point, I think it would
be better to revert to my original RTL8188EU_INSTALL_FIRMWARE hook.
It should continue working of the firmware were moved around the
package directory hierarchy, and it's even one line shorter (!).

Do you agree?

-- 
Luca
