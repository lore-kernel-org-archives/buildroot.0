From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 6 Feb 2014 10:04:03 +0100
Subject: [Buildroot] [git commit] opencv: cleanup depends and comments
In-Reply-To: <20140206095954.143a94ea@skate>
References: <20140205223406.275A79C67A@busybox.osuosl.org>
 <20140206095954.143a94ea@skate>
Message-ID: <CAAXf6LWyLMeCSDot6mP2dEVCjEUqUb+Fd5qH0WxiXP2-Es6z=Q@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 6, 2014 at 9:59 AM, Thomas Petazzoni
<thomas.petazzoni@free-electrons.com> wrote:
> Dear Peter Korsgaard,
>
> On Wed, 5 Feb 2014 23:33:41 +0100, Peter Korsgaard wrote:
>> commit: http://git.buildroot.net/buildroot/commit/?id=5f7cbb264ec21f75320ad8518d27f4c605c825f8
>> branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master
>>
>> Since the opencv package globally depends on BR2_TOOLCHAIN_HAS_THREADS
>> and BR2_USE_WCHAR, then cleanup these redundant (and useless)
>> dependencies in the opencv's sub-options.
>>
>> Signed-off-by: Samuel Martin <s.martin49@gmail.com>
>> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
>> ---
>>  package/opencv/Config.in |   12 ++----------
>>  1 files changed, 2 insertions(+), 10 deletions(-)
>
> Is this really our policy? It was mentioned several times that we
> should probably keep those, so that if the OpenCV package option itself
> no longer needs wchar or threads in the future, we already have those
> dependencies needed for the packages selected by OpenCV.
>

Yes, I thought so too...
