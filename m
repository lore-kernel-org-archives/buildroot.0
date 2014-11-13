From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Thu, 13 Nov 2014 10:18:41 +0100
Subject: [Buildroot] [PATCH] xbmc: use github call
In-Reply-To: <87d28rjysb.fsf@dell.be.48ers.dk>
References: <1413138060-1146-1-git-send-email-maxime.hadjinlian@gmail.com>
 <87d28rjysb.fsf@dell.be.48ers.dk>
Message-ID: <CAGduivyWS2GGwyQuyawojxU0-Tg1O1BDtorP9ULZ_c6o7NxcUg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Peter, all

On Thu, Nov 13, 2014 at 9:21 AM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Maxime" == Maxime Hadjinlian <maxime.hadjinlian@gmail.com> writes:
>
>  > Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
>
> Yann pointed out to me on IRC last night that this was needed for
> 2014.11 as xbmc downloads were otherwise broken, but it doesn't work for
> me:
>
>>>> xbmc 13.2-Gotham Downloading
> --2014-11-13 09:16:48--  https://github.com/xbmc/xbmc/archive/13.2-Gotham/xbmc-13.2-Gotham.tar.gz
> Resolving github.com (github.com)... 192.30.252.129
> Connecting to github.com (github.com)|192.30.252.129|:443... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-11-13 09:16:50 ERROR 404: Not Found.
>
> --2014-11-13 09:16:50--  http://sources.buildroot.net/xbmc-13.2-Gotham.tar.gz
> Resolving sources.buildroot.net (sources.buildroot.net)... 176.9.16.109
> Connecting to sources.buildroot.net (sources.buildroot.net)|176.9.16.109|:80... connected.
> HTTP request sent, awaiting response... 404 Not Found
> 2014-11-13 09:16:50 ERROR 404: Not Found.
>
> package/pkg-generic.mk:73: recipe for target '/home/peko/source/buildroot/output/build/xbmc-13.2-Gotham/.stamp_downloaded' failed
>
> Whereas the old URL did work:
>
>>>> xbmc 13.2-Gotham Downloading
> --2014-11-13 09:21:12--  https://github.com/xbmc/xbmc/archive/13.2-Gotham.tar.gz
> Resolving github.com (github.com)... 192.30.252.129
> Connecting to github.com (github.com)|192.30.252.129|:443... connected.
> HTTP request sent, awaiting response... 302 Found
> Location: https://codeload.github.com/xbmc/xbmc/tar.gz/13.2-Gotham [following]
> --2014-11-13 09:21:13--  https://codeload.github.com/xbmc/xbmc/tar.gz/13.2-Gotham
> Resolving codeload.github.com (codeload.github.com)... 192.30.252.144
> Connecting to codeload.github.com (codeload.github.com)|192.30.252.144|:443... connected.
> HTTP request sent, awaiting response... 200 OK
> Length: 65900491 (63M) [application/x-gzip]
> Saving to: ?/home/peko/source/buildroot/output/build/.13.2-Gotham.tar.gz.D3JP1O/output?
>
> 100%[======================================================================>] 65,900,491  3.51MB/s   in 12s
>
> So what's going on?
As it appeared on IRC yesterday also, it seems that github changed
*again* their download schemes silently, so every package using the
github-helper are currently broken.
We need to devise a new github helper, or something to fix this urgently.
Keep this patch in the queue, if we keep the github-helper, it should
work then (or need some rework, depending on the solution we chose)
>
> --
> Bye, Peter Korsgaard
