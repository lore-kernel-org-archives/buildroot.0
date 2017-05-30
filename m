From: Martin Kepplinger <martin.kepplinger@ginzinger.com>
Date: Tue, 30 May 2017 13:58:01 +0200
Subject: [Buildroot] genimage maintainers
In-Reply-To: <1496138688562-165972.post@n4.nabble.com>
References: <1496138688562-165972.post@n4.nabble.com>
Message-ID: <79e53714-c9c9-361a-02d3-d8c23db5cfe9@ginzinger.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 2017-05-30 12:04, hkengblom wrote:
> Hi,
>
> This post may not be related to Buildroot but rather to genimage, but I've
> not been able to find any maintainer for genimage, so I'm posting here since
> I found an issue with genimage when using Buildroot.
>
> My problem is that there seem to be a bug in genimage making it impossible
> to have a mountpoint specified like this:
>
> image dummy.ext4 {
>   ext4 {}
>   mountpoint = "/mnt/subdirectory"
>   size = 128M
> }
>
> however this works fine:
>
> image dummy.ext4 {
>   ext4 {}
>   mountpoint = "/mnt"
>   size = 128M
> }
>
> When looking at the code it looks like genimage cannot handle mountpoints
> that is not a directory directly under /
>
> I've made a patch for it, but I don't know where to send it, or make a
> pull-request. Further, I'm not that familiar with genimage, so it would be
> good if someone with more insight in genimage could take a look at it.
>
> Can anyone point me to someone that might be the "receiver" of such a patch?
>
> br H?kan
>

haven't you tried to just look for it? It seems like it's developed on
github, and an issue with the problem you describe is already open there:
https://github.com/vivien/genimage/issues/2

I guess that would be the place this should go. Tell them it's a simple
and important issue to you, make a pull request and they will help you.

                        martin



________________________________

Ginzinger electronic systems GmbH
Gewerbegebiet Pirath 16
4952 Weng im Innkreis
www.ginzinger.com

Firmenbuchnummer: FN 364958d
Firmenbuchgericht: Ried im Innkreis
UID-Nr.: ATU66521089
