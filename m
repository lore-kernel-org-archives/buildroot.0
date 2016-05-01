From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 1 May 2016 09:38:36 +0200
Subject: [Buildroot] [PATCH v2 2/4] python: align the target finalize
	hooks with python3
In-Reply-To: <20160501093621.38e0d60d@free-electrons.com>
References: <1462020471-29986-1-git-send-email-thomas.petazzoni@free-electrons.com>
 <1462020471-29986-3-git-send-email-thomas.petazzoni@free-electrons.com>
 <CAHXCMMKHp7PcbRxaCCqyd3A=qTKsCCxToZfG=UcKZ7CAP4Wpgw@mail.gmail.com>
 <20160501093621.38e0d60d@free-electrons.com>
Message-ID: <CAHXCMMKzWEQmZsKXQTEaVgupRWNLztjiaztm2YRu=r-PCiVPmA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas,

On Sun, May 1, 2016 at 9:36 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Hello,
>
> On Sat, 30 Apr 2016 22:56:56 +0200, Samuel Martin wrote:
>
>> However, some packages call compile_all by themselves, so this can
>> lead to have some remaining *.pyo in
>> $(TARGET_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR) (e.g. [1] with
>> this defconfig [2]).
>
> Hum, correct. So like I'm unconditionally removing *.opt-<X>.pyc for
> Python 3, I should remove unconditionally *.pyo for the Python case.
> Would this be OK for you?
Yes.

Thanks,

-- 
Samuel
