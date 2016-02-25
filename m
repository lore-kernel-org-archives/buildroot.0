From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Thu, 25 Feb 2016 17:05:44 +0100
Subject: [Buildroot] wget download: 'scheme missing' results in empty
	output file
In-Reply-To: <87fuwgx0ge.fsf@dell.be.48ers.dk>
References: <CAAXf6LXVweNYNvHNZG9bvYu9KVeAa9L6=qPOwRsmsx8DhVGTJQ@mail.gmail.com>
 <87fuwgx0ge.fsf@dell.be.48ers.dk>
Message-ID: <CAAXf6LVLzgK8WOODsVifFXhNuoOp82UJfTQwNmN7-D0coK0Y4g@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On Thu, Feb 25, 2016 at 4:40 PM, Peter Korsgaard <peter@korsgaard.com> wrote:
>>>>>> "Thomas" == Thomas De Schampheleire <patrickdepinguin@gmail.com> writes:
>
>  > Hi Yann, all,
>  > When a package does not (by error) define FOO_SITE, and the source
>  > archive is not already present, the wget download helper will be
>  > invoked with as URL /foo-xxx.tar.gz. wget reports 'Scheme missing' and
>  > bails out, but _returns with a successful error code (0)_.
>
> That sounds like a wget bug. What wget version are you using?
>
> It works here:
>
> wget /foo-xxx.tar.gz ; echo $?
> /foo-xxx.tar.gz: Scheme missing.
> 1
>
> wget --version | head
> GNU Wget 1.16.3 built on linux-gnu.
>
> +digest +https +ipv6 +iri +large-file +nls +ntlm +opie +psl +ssl/gnutls
>
> Wgetrc:
>     /etc/wgetrc (system)
> Locale:
>     /usr/share/locale
> Compile:
>     gcc -DHAVE_CONFIG_H -DSYSTEM_WGETRC="/etc/wgetrc"
>

This is with wget 1.12 from 2009 :)

Ok, so probably it's fixed meanwhile, but regardless what about the
patch which could cover other issues in such tools (not only wget) ?
