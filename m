From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 25 Feb 2018 22:01:39 +0100
Subject: [Buildroot] [PATCH v2 1/2] pkgconf: pkg-config.in: double quote
 $@
In-Reply-To: <20180222224905.28618-1-gael.portay@savoirfairelinux.com>
References: <20180222224905.28618-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180225220139.23ce4274@windsurf.home>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hello,

On Thu, 22 Feb 2018 17:49:04 -0500, Ga?l PORTAY wrote:
> The shell expands "$@" as "$1" "$2" "$3"... while it expands $@ as $1 $2
> $3. With the second form, we loses spaces in positional parameters.
> 
> As example, the following call
> 
>         pkg-config --cflags "one two" three
> 
> is wrapped as
> 
>         pkgconf --cflags one two three
> 
> while we are expecting
> 
>         pkgconf --cflags "one two" three
> 
> "$@" is really useful when writing wrappers. It passes the positional
> arguments *as* they are given.
> 
> Double quote $@ to prevent from splitting elements.
> 
> Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
> ---

Both patches applied to next. Thanks!

Thomas
-- 
Thomas Petazzoni, CTO, Bootlin (formerly Free Electrons)
Embedded Linux and Kernel engineering
https://bootlin.com
