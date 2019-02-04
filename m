From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 4 Feb 2019 13:39:44 +0100
Subject: [Buildroot] [PATCH v2] docs/website: consolidate CDN's and
 enable SRI
In-Reply-To: <87y36vvij1.fsf@dell.be.48ers.dk>
References: <1549275445-11857-1-git-send-email-angelo@amarulasolutions.com>
 <87y36vvij1.fsf@dell.be.48ers.dk>
Message-ID: <CA+_SqVbAV37MoGC64N3ai--f0Wv3-nXZ2vOqwvVW0EVLC6Ysqg@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Mon, Feb 4, 2019 at 1:35 PM Peter Korsgaard <peter@korsgaard.com> wrote:
>
> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > From: James Hilliard <james.hilliard1@gmail.com>
>  > Some of our cdn's are going discontinued (rawgit) and some others are
>  > not recommended anymore, thus we update to the recommended cdnjs.
>  > This patch enables also SRI protection on js to be sure the modules we
>  > download are not manipulated in any way.
>
> It would be great for people not doing web things (E.G. me) to add the
>
> https://developer.mozilla.org/en-US/docs/Web/Security/Subresource_Integrity
>
> to explain what SRI is.
>
> The files we get from these CDNs are not that big, E.G:
>
> -rw-r--r--  1 peko peko 139K May 17  2018 bootstrap.min.css
> -rw-r--r--  1 peko peko  37K May 17  2018 bootstrap.min.js
> -rw-r--r--  1 peko peko 2.4K May 17  2018 html5shiv.js
> -rw-r--r--  1 peko peko  85K May 17  2018 jquery.min.js
> -rw-r--r--  1 peko peko 4.0K May 17  2018 respond.min.js
>
> Does it make sense to use those CDNs that we don't have under our
> control, or should we just commit these files?

Hosting these files by themselves means serving them by our webserver,
this is usually costly and bandwidth consuming.

Moreover, saving a compressed javascript in git it's not recommended
because their somewhat like binary files.

Again, updating them is quite annoying cause instead of simply
updating a line in a javascript file, we should replace the compressed
js file.

>
> --
> Bye, Peter Korsgaard
