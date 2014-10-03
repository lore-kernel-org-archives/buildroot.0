From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Fri, 3 Oct 2014 14:57:21 +0200
Subject: [Buildroot] [PATCH 3/3] support/script/scancpan: add option test
In-Reply-To: <20141001213402.553f2999@free-electrons.com>
References: <1412188619-3981-1-git-send-email-francois.perrad@gadz.org>
 <1412188619-3981-3-git-send-email-francois.perrad@gadz.org>
 <20141001213402.553f2999@free-electrons.com>
Message-ID: <CAB0FRst6dN48SqBR8UTn3WzOrZi1oMrtgijgqDO74E=X7xLh-Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

2014-10-01 21:34 GMT+02:00 Thomas Petazzoni
<thomas.petazzoni@free-electrons.com>:
> Dear Francois Perrad,
>
> On Wed,  1 Oct 2014 20:36:59 +0200, Francois Perrad wrote:
>> test modules are usually useless on BR
>>
>> Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
>
> Sorry for asking only now, but can we have a real commit message that
> explains what's going on?
>
> Something like:
>
> """
> This commit adds a new -test option to the scancpan script, which
> allows to ...
> """
>
> With your current message "test modules are usually useless on BR", I
> don't understand what this option does: does it disables test modules?
> does it enables it? what does it change compared to the previous
> situation?
>
> Best regards,
>

find below an improved message for this patch

"""
Between Perl modules, there are 3 kinds of dependency:
 - configure/build time dependency which becomes host dependency
 - runtime dependency which becomes target dependency
 - test time dependency which is useless in a cross-compiling context like BR

Before this patch, test time dependencies are handled like runtime dependencies.

After this patch, test time dependencies are ignored by default.
The new option -test allows to add them anyway.
"""

Fran?ois.


> Thomas
> --
> Thomas Petazzoni, CTO, Free Electrons
> Embedded Linux, Kernel and Android engineering
> http://free-electrons.com
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
