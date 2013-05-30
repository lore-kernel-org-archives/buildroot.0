From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 30 May 2013 16:25:55 +0200
Subject: [Buildroot] [PATCH] Makefile: defconfig: use BR2_DEFCONFIG only
 when the file exists
In-Reply-To: <20130530160109.7c07ecf1@skate>
References: <1369922260-8237-1-git-send-email-fabio.porcedda@gmail.com>
 <20130530160109.7c07ecf1@skate>
Message-ID: <CAHkwnC8m5zDM-Q1UDg7kNR+orzvnhr8q1+Mxn3OEbB1hp+Xkgw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, May 30, 2013 at 4:01 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Thu, 30 May 2013 15:57:40 +0200, Fabio Porcedda wrote:
>> This is to be able to use "make defconfig" even when BR2_DEFCONFIG has
>> a filename that does not exist or use the default value that
>> does not exists.
>>
>> Example on a clean installation, without a "./defconfig":
>>    make defconfig
>>    make defconfig
>
> I'm not sure to understand the example here. Could you detail a little
> bit?

Without this patch the first "make defconfig" works, but the second
"make defconfig" fails.
With this patch the second "make defconfig" works like the first one.

This is because when the first "make defconfig" is issued the
BR2_DEFCONFIG is empty, instead when the second "make defconfig" is
issued the BR2_DEFCONFIG has the default value
"$(CONFIG_DIR)/defconfig" that usually does not exists and so fails.

I fixed this failure ignoring the BR2_DEFCONFIG when the default value
does not exist.

Best regards
--
Fabio Porcedda
