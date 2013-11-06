From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Wed, 6 Nov 2013 12:54:00 +0100
Subject: [Buildroot] [PATCH] libevas: disable on avr32
In-Reply-To: <CAHt8ZCM6t1qPEOCaTpDOe1ESTF1ZdvNU1CrEkZC5hABzpKf+fg@mail.gmail.com>
References: <1383735243-18910-1-git-send-email-spdawson@gmail.com>
 <CAAXf6LV6GFk27s8fpEbcDVKmrkipiKA_FGFEt-wcdXMutkwBoA@mail.gmail.com>
 <CAHt8ZCM6t1qPEOCaTpDOe1ESTF1ZdvNU1CrEkZC5hABzpKf+fg@mail.gmail.com>
Message-ID: <CAAXf6LWSZa6hNgqqYgM07ER4t_iF3b26e6O1-jMivBeRnu4RXg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Simon,

On Wed, Nov 6, 2013 at 12:09 PM, Simon Dawson <spdawson@gmail.com> wrote:
> Hi Thomas, thanks for the feedback.
>
> On 6 November 2013 11:05, Thomas De Schampheleire
> <patrickdepinguin@gmail.com> wrote:
>> In all these places, the new 'depends on' should be repeated on the
>> comment that is shown when one of the toolchain options is missing.
>
> Okay. I thought the policy was not to mention architecture
> dependencies on the comments...
>

This is still correct, the comment should not mention the architecture
dependency.
But, the comment should only be _visible_ when it is relevant. Since
the package itself is not relevant on avr32, it makes no sense to show
the comment. Hence, the comment should get an extra 'depends on
!avr32'.

Best regards,
Thomas
