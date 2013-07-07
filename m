From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 7 Jul 2013 21:08:25 +0200
Subject: [Buildroot] [PATCH 1/3] qt{4,
 5}: add an explicit choice to express Buildroot does not support
 their coexistence
In-Reply-To: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
References: <1373222695-9148-1-git-send-email-s.martin49@gmail.com>
Message-ID: <CAHXCMMKx-vf9ZFRgzhj_bvYwbb2vHz3qQkC6ebgKqts_-v6-bA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2013/7/7 Samuel Martin <s.martin49@gmail.com>:
> Qt4 and Qt5 does not provide the same APIs; they can usually coexist on the
> same system.
> However, Buildroot does not alllow this coexistence because of some host-tools
> (qmake, etc) troubles when building qmake-based packages or projects (inside
> or outside Buildroot).
>
> So, since it is not possible to consider making a virtual package because of
> the APIs' differences, add an explicit choice.

I forgot to mention that using an explicit choice allow to get rid of
the dependency between the
Qt4 and Qt5 packages.
So, for packages supporting both Qt4 and Qt5 (like OpenCV), it makes
possible to handle the
right dependency with no circular/recursive dependency in the Config.in files.

Regards,

-- 
Samuel
