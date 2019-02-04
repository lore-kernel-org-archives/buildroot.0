From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 4 Feb 2019 15:11:10 +0100
Subject: [Buildroot] [PATCH v2] docs/website: consolidate CDN's and
 enable SRI
In-Reply-To: <87lg2vvepy.fsf@dell.be.48ers.dk>
References: <1549275445-11857-1-git-send-email-angelo@amarulasolutions.com>
 <87y36vvij1.fsf@dell.be.48ers.dk>
 <CA+_SqVbAV37MoGC64N3ai--f0Wv3-nXZ2vOqwvVW0EVLC6Ysqg@mail.gmail.com>
 <87lg2vvepy.fsf@dell.be.48ers.dk>
Message-ID: <CA+_SqVZjokW23jK4j1aKqUtHFCbRAn2s8zXWvZ-2mFN3AoNTwQ@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2019 at 2:57 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > On Mon, Feb 4, 2019 at 1:35 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>  >>
>  >> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>  >>
>  >> > From: James Hilliard <james.hilliard1@gmail.com>
>  >> > Some of our cdn's are going discontinued (rawgit) and some others are
>  >> > not recommended anymore, thus we update to the recommended cdnjs.
>  >> > This patch enables also SRI protection on js to be sure the modules we
>  >> > download are not manipulated in any way.
>  >>
>  >> It would be great for people not doing web things (E.G. me) to add the
>  >>
>  >> https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
>  >>
>  >> to explain what SRI is.
>  >>
>  >> The files we get from these CDNs are not that big, E.G:
>  >>
>  >> -rw-r--r--  1 peko peko 139K May 17  2018 bootstrap.min.css
>  >> -rw-r--r--  1 peko peko  37K May 17  2018 bootstrap.min.js
>  >> -rw-r--r--  1 peko peko 2.4K May 17  2018 html5shiv.js
>  >> -rw-r--r--  1 peko peko  85K May 17  2018 jquery.min.js
>  >> -rw-r--r--  1 peko peko 4.0K May 17  2018 respond.min.js
>  >>
>  >> Does it make sense to use those CDNs that we don't have under our
>  >> control, or should we just commit these files?
>
>  > Hosting these files by themselves means serving them by our webserver,
>  > this is usually costly and bandwidth consuming.
>
> Yes, but given their small size, this is probably not a huge concern?
> E.G. news.html is ~200KB.

Yes, I know, in an optimistic world we could have that page sliced on
smaller chunks and retrieved one chunk at a time.
It could be done, but I don't know how much that page is visited.
I don't know if we have a proper network load statistics to understand
if this could be a valuable work to do.

>  > Moreover, saving a compressed javascript in git it's not recommended
>  > because their somewhat like binary files.
>
> Correct, but we already have the website images in it as well. Given
> that these things only rarely change, I don't think that is a big
> concern.

Yes I know, but unless we pay to host on a CDN ourselves, we can't do otherwise.
I think that something could be optimized from a size point of view.

I think if we can save some some bandwidth, we should go that route,
but if costs are not a main concern, we can opt to have everything on
local server.


>  > Again, updating them is quite annoying cause instead of simply
>  > updating a line in a javascript file, we should replace the compressed
>  > js file.
>
> Is is still a single commit, either changing the the version + hash.
>
> --
> Bye, Peter Korsgaard
