From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Mon, 7 Jan 2013 15:52:29 +0100
Subject: [Buildroot] [PATCH 2/2] barebox: needs host-lzop
In-Reply-To: <20130107133653.6e132264@skate>
References: <1355396382-14652-1-git-send-email-fabio.porcedda@gmail.com>
 <1355396382-14652-2-git-send-email-fabio.porcedda@gmail.com>
 <20130107133653.6e132264@skate>
Message-ID: <CAHkwnC-fRwT54OkgqhQtnsCzbc8CNpGd_rSZ7n5Ekkc+mZiF6g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas,
thanks for the review.

On Mon, Jan 7, 2013 at 1:36 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Thu, 13 Dec 2012 11:59:42 +0100, Fabio Porcedda wrote:
>> Add host-lzop dependency.
>> Use $(TARGET_MAKE_ENV) when calling $(MAKE)
>> to able to use binaries built for host.
>
> Does Barebox always need lzop? If not, under what conditions does it
> need lzop?

Barebox doesn't always need lzop.
I think the dependency is determined by the barebox configuration
(barebox/.config),
so I think it's impractical/impossible to know beforehand.

We can check the dependency only after the barebox configuration phase
it's done.
IMHO it's too late.

Best regards
--
Fabio Porcedda
