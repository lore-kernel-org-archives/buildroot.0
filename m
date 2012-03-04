From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 4 Mar 2012 11:11:58 +0100
Subject: [Buildroot] Kconfig: "selects" vs. "depends on"
In-Reply-To: <20120304071855.3e6c03b5@gmail.com>
References: <20120304071855.3e6c03b5@gmail.com>
Message-ID: <CAHXCMMKQjy0Z1Ozn0wu4r14_XQQMWyZTpq3B9kkzJNpj-iUgcw@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,

2012/3/4 Ismael Luceno <ismael.luceno@gmail.com>:
> Which should I use?
Afaik, "depends on" is transitive, whereas "select" is not, see [1] as ref.
So, whenever one wants to ensure the dependencies will be enabled as
well, one should use "depends on", otherwise "select" is possible.

>
> Perhaps "selects" for for simple (i.e. non-configurable) dependencies,
> and "depends on" otherwise...?
Imho, it depends on the non-configurable symbol.
I mean if the non-configurable symbol depends on something else, then
i would prefer "depends on"

Perhaps, this is point could be added to the doc.


Regards,
Sam

[1] http://lxr.free-electrons.com/source/Documentation/kbuild/kconfig-language.txt
