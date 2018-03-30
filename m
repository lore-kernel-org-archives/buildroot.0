From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 30 Mar 2018 21:25:36 +0200
Subject: [Buildroot] [PATCH v2 1/2] pkgconf: pkg-config.in: double quote
 $@
In-Reply-To: <20180222224905.28618-1-gael.portay@savoirfairelinux.com>
 (=?utf-8?Q?=22Ga=C3=ABl?=
 PORTAY"'s message of "Thu, 22 Feb 2018 17:49:04 -0500")
References: <20180222224905.28618-1-gael.portay@savoirfairelinux.com>
Message-ID: <87r2o14b7z.fsf@dell.be.48ers.dk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

>>>>> "Ga?l" == Ga?l PORTAY <gael.portay@savoirfairelinux.com> writes:

 > The shell expands "$@" as "$1" "$2" "$3"... while it expands $@ as $1 $2
 > $3. With the second form, we loses spaces in positional parameters.

 > As example, the following call

 >         pkg-config --cflags "one two" three

 > is wrapped as

 >         pkgconf --cflags one two three

 > while we are expecting

 >         pkgconf --cflags "one two" three

 > "$@" is really useful when writing wrappers. It passes the positional
 > arguments *as* they are given.

 > Double quote $@ to prevent from splitting elements.

 > Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>

Committed to 2018.02.x, thanks.

-- 
Bye, Peter Korsgaard
