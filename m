From: Fabio Porcedda <fabio.porcedda@gmail.com>
Date: Thu, 17 Jul 2014 19:40:46 +0200
Subject: [Buildroot] [PATCH 1/2] apply-patches.sh: don't print anything
 when "-s" option is used
In-Reply-To: <20140715212814.1dfcce43@free-electrons.com>
References: <1404906414-15197-1-git-send-email-fabio.porcedda@gmail.com>
 <20140715212814.1dfcce43@free-electrons.com>
Message-ID: <CAHkwnC_1+=SR88eS3hHDOFMvzFFF_dE5LuRdKhKfi9pFm1RL4Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Tue, Jul 15, 2014 at 9:28 PM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Fabio Porcedda,
>
> On Wed,  9 Jul 2014 13:46:53 +0200, Fabio Porcedda wrote:
>> The make "-s" option is used to enable the "Silent operation" so if
>> that option is used don't print anything as far as there isn't any
>> error.
>> Add the "-s" option to "apply-patches.sh" to enable silent operation.
>> Because "apply-patches.sh" is called in many places add a
>> "APPLY_PATCHES" variable to permit adding the "-s" easily.
>>
>> Signed-off-by: Fabio Porcedda <fabio.porcedda@gmail.com>
>
> Hum, yes, but why? The entire build process is anyway very noisy, so is
> there really a point in silencing specifically this part? What is the
> ultimate goal you're trying to achieve here?

My ultimate goal is to be able using the "-s" flags to silence all
parts, because sometimes i just want to build and view only ">>> *"
messages, errors, warning without anything else.

As example the "toolchain-external" target already do that when the
"-s" option is used.

I've silenced only this part because it was easy and it's anyway an improvement.

Maybe i can work on silencing other parts too if the feature is desired.

Best regards
-- 
Fabio Porcedda
