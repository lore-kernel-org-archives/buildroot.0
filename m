From: =?iso-8859-1?Q?Ga=EBl?= PORTAY <gael.portay@savoirfairelinux.com>
Date: Wed, 23 Nov 2016 09:37:55 -0500
Subject: [Buildroot] [PATCH] pseudo-wrapper: fix console issue
In-Reply-To: <742299100.47508539.1479889455513.JavaMail.root@zimbra96-e16.priv.proxad.net>
References: <20161123053220.1845-1-gael.portay@savoirfairelinux.com>
 <742299100.47508539.1479889455513.JavaMail.root@zimbra96-e16.priv.proxad.net>
Message-ID: <20161123143429.jx6nceftqw3mvz3u@gportay>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Wed, Nov 23, 2016 at 09:24:15AM +0100, yann.morin.1998 at free.fr wrote:
> We want the wrapper to fail if the command failed., so:
> 
>     # ... run script/command...
>     "${0%/*}/pseudo" "${@}"
>     ret=$?
> 
>     # ... terminates server...
>     kill -s TERM "$pid"
>     wait "$pid"
> 
>     exit ${ret}

Indeed, I saw it rigth after I sent the patch :(
