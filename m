From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Sun, 8 Mar 2015 08:54:52 +0100
Subject: [Buildroot] [PATCH 4/5] package/efl/libevas: Switch to giflib
In-Reply-To: <20150308084636.06f56bb6@free-electrons.com>
References: <1422300260-5361-1-git-send-email-bernd.kuhls@t-online.de>
 <1422300260-5361-4-git-send-email-bernd.kuhls@t-online.de>
 <CAHkwnC-cVh1fKVKyR=RhWv+tQgRVeQomt0dL1Z0TW_cbnyQ_+w@mail.gmail.com>
 <20150307173234.57c8bf4f@free-electrons.com>
 <CAHkwnC_PjANbN1MN7uXUq2wBjaR-Z62KuWeE3bMFrJ-7oWXBww@mail.gmail.com>
 <20150308081520.1a6e9fc7@free-electrons.com>
 <CAHkwnC9VfqeHc8SGqwJJu777npQ7brMi=B=Ck6rv6CQUyTHB2Q@mail.gmail.com>
 <20150308084636.06f56bb6@free-electrons.com>
Message-ID: <CAHkwnC93TA=SbbTwARp7KTqoG1xkUtL8epky9PA8-HnJS7a75w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Sun, Mar 8, 2015 at 8:46 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Sun, 8 Mar 2015 08:28:44 +0100, Fabio Porcedda wrote:
>
>> I understand that is a legacy repository but because you talked about
>> to send a patch upstream i was trying to understand if there is any
>> chance that the patch will be accepted.
>>
>> So when you have talked about to send the patch upstream didn't know
>> about the legacy status of this repository?
>
> Well, when you want to send a patch upstream, then obviously you have
> to send the patch based on the latest upstream version. Which generally
> involves bumping the Buildroot package to use the latest stable version
> from upstream.
>
> In the case of EFL, it indeed involves quite a bit of work, because all
> the libraries that used to be split in separate tarballs are now
> provided as one single tarball by upstream.
>
> See https://phab.enlightenment.org/phame/live/3/post/efl_1_8/ :
>
> """
> We have merged Ecore, Edje, Eet, Eeze, Efreet, Eina, Eio, Embryo,
> Emotion, Ethumb, Evas and Evil into a single EFL package (as you can
> see above these are no longer there, but inside the EFL distribution).
> We also added in Eldbus, EPhysics, and Escape.
> """

In the efl project where the evas library was merged, they have
already added support for giflib 5:
https://git.enlightenment.org/core/efl.git/commit/?id=096ae0e86fe306d40d744c8c11960dd9e736c4b4

So maybe we can just back port that commit.

BR
-- 
Fabio Porcedda
