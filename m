From: Simon Dawson <spdawson@gmail.com>
Date: Sat, 21 Jul 2012 10:07:38 +0100
Subject: [Buildroot] [PATCH] Bump gpsd from version 2.95 to version 3.7
In-Reply-To: <20120720201626.707f66a2@skate>
References: <1342779078-2927-1-git-send-email-spdawson@gmail.com>
 <20120720201626.707f66a2@skate>
Message-ID: <CAHt8ZCN-KYmfjbp4R3zwhLnRKrPUnrS1TziaECh8zvcEWZYddg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Thomas, thanks for the feedback.

On 20 July 2012 19:16, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
>> ++/* Ugly hack to prevent undefined reference to acs_map */
>> ++unsigned long acs_map[128];
>
> Is there a non-ugly variant of this in the works?

Not at present, I'm afraid. What would you suggest? Obviously, I can
kick off the process of trying to get a fix into gpsd upstream. That
could be a slow process; so, in the meantime, is it acceptable to have
this (ugly, but small) patch in Buildroot?

>> +GPSD_DEPENDENCIES = host-scons host-python
>
> Do we really need a host-python here?

You're quite right: there is no need for the Python version to be the
same on host and target. I'll remove this spurious dependency in the
next iteration of the patch.

Simon.
