From: Patrick Doyle <wpdster@gmail.com>
Date: Wed, 24 Feb 2016 14:50:42 -0500
Subject: [Buildroot] Why not perform a shallow clone?
In-Reply-To: <CAHXCMMKHZ0usTWkgfJUbM6P4zLV2ZkAxQB9H9KrTVPar=fMEuA@mail.gmail.com>
References: <CAF_dkJA0tBn_6x-sBwqF6Hb4x4+Pp3vM+e+rndm24kJe_y6pVg@mail.gmail.com>
 <CAHXCMMKHZ0usTWkgfJUbM6P4zLV2ZkAxQB9H9KrTVPar=fMEuA@mail.gmail.com>
Message-ID: <CAF_dkJCZ3SzR3u7RASj-9ABxd8D70p6V1BGdVKZNnPKtFay0Gg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Feb 24, 2016 at 2:41 PM, Samuel Martin <s.martin49@gmail.com> wrote:
> Hi,
>
> On Wed, Feb 24, 2016 at 8:30 PM, Patrick Doyle <wpdster@gmail.com> wrote:
>> So I'm sitting here watching my buildroot make do a complete clone of
>> the Linux kernel, where I have told it that I want a specific sha1
>> commit and I started wondering...
>>
>> Why not do a shallow clone?
> It tries, but cannot (see
> https://git.buildroot.org/buildroot/tree/support/download/git#n34)
>
Oh bummer...

I wonder why git-clone -b doesn't accept a sha1sum.  Oh well.


So how do you folks handle pinning a revision of, for example, the
kernel?  I naively assumed that I would specify
BR2_LINUX_KERNEL_CUSTOM_REPO_URL and
BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION, which appears to do what I want,
but it seems wasteful to have to clone the whole Linux repo just to
get that one clone.

I suppose I could tell menuconfig that the (Atmel) kernel I am cloning
is available on github somehow and have the magic "fetch a sha1sum
from github" work.  I'll go think about that for a bit.

--wpd
