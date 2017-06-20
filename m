From: Heiko Thiery <heiko.thiery@gmail.com>
Date: Tue, 20 Jun 2017 19:37:11 +0200
Subject: [Buildroot] CCACHE accross multiple buildroot projects
In-Reply-To: <20170620202159.GB27508@momiji.helsinki.igalia.com>
References: <CAEyMn7arQ1cEb6Yy2Gkc+FCMPJYbnpKdANQzXWQaCrKzePSfgw@mail.gmail.com>
 <20170620160412.GC2892@scaer>
 <20170620202159.GB27508@momiji.helsinki.igalia.com>
Message-ID: <CAEyMn7aEQS52jWMpBc3Pv8LaorQoxrKOYLRW1JFqG-o2dh8nyA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Meanwhile I figured out a stange issue. I have 4 different buildroot
projects with different workspaces but all of them use the same ccache
directory. These workspaces are cleaned in a scheduled interval. Then
it can happen that a new build will fail because of some pathes in
dependency files are pointing to files in other a cleaned workspace.

2017-06-20 19:21 GMT+02:00 Adrian Perez de Castro <aperez@igalia.com>:
> On Tue, 20 Jun 2017 18:04:12 +0200, "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
>> Heiko, All,
>>
>> On 2017-06-19 15:57 +0200, Heiko Thiery spake thusly:
>> > is it allowed to use CCACHE accross several projects (all the same
>> > architecture)?
>>
>> Normally, ccache hashes a few things to ensure that it does not re-use
>> incompatible obkects. It should be safe.
>
> It is, I routinely find myself having 3-4 different Buildroot work trees, all
> pointing ccache to the same directory in the file system. If you target the
> same architecture in more than one work tree, builds can sometimes be faster
> when the same versions of the same files are used by different work trees.
>
> Cheers,
>
> --
>  Adri?n ?
