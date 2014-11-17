From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 17 Nov 2014 14:32:33 +0100
Subject: [Buildroot] [PATCH] wireshark: remove RPATH tag
In-Reply-To: <5469EDFC.3050208@zacarias.com.ar>
References: <0dae86e37516236d337e8433c63047504f1576f9.1415126141.git.baruch@tkos.co.il>
 <20141105081555.5aca83e2@free-electrons.com>
 <20141105072214.GL2358@sapphire.tkos.co.il>
 <20141105083124.57a5d559@free-electrons.com> <20141117123315.GG2196@tarshish>
 <5469EDFC.3050208@zacarias.com.ar>
Message-ID: <CAHXCMMLuH+cR36SsxsHytfg_zy_pH3d3S5zXVZWXV=88PuXa8w@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Nov 17, 2014 at 1:45 PM, Gustavo Zacarias
<gustavo@zacarias.com.ar> wrote:
> On 11/17/2014 09:33 AM, Baruch Siach wrote:
>
>> It seems that libtool decides to set rpath based on .la files we have in
>> staging. Some of them (e.g. glib provided libs, and libnl) set either
>> 'dependency_libs' (glib) or 'libdir' (libnl) to paths under output/build or
>> staging. wireshark also links its own libraries (e.g. wiretap, epan) using
>> local source tree .la files. I'm not sure how to solve this in the general
>> case. It probably requires fixing up all these .la files.

The weird thing is that not all autotools packages have a rpath... :-/
I've already try to have a look at libtool, but it requires quite a
brain at 300% and some free time to dive into this hell.

>
> Hi.
> There's a good briefing at https://wiki.debian.org/RpathIssue
> Fixing up is nice, however doing it in a good manner will require many
> autoreconfs and being proactive about it.
> Stripping RPATHs is probably a faster way out (via chrpath).

or patchelf (already in buildroot) ;-)

> In the end this could be considered as a build information leak, not
> terribly useful but doesn't look good either.
> Regards.
>
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot


Regards,

-- 
Samuel
