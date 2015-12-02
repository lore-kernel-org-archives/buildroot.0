From: rdkehn at yahoo.com <rdkehn@yahoo.com>
Date: Wed, 2 Dec 2015 07:20:31 -0600
Subject: [Buildroot] [PATCH v6] package/unscd: new package
In-Reply-To: <565E130B.7090201@mind.be>
References: <1448982954-5055-1-git-send-email-rdkehn@yahoo.com>
 <565E130B.7090201@mind.be>
Message-ID: <20151202132031.GB547@dkarchlinux64.currentcomm.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Arnout, Thomas:

On Tue, Dec 01, 2015 at 10:37:15PM +0100, Arnout Vandecappelle wrote:
>  Hi Doug,
> 
>  Even though it's already v6 I still have some comments :-(
> 
> On 01-12-15 16:15, Doug Kehn wrote:
> > A daemon which handles passwd, group and host lookups for running
> > programs and caches the results for the next query. You only need this
> > package if you are using slow Name Services like LDAP, NIS or NIS+.
> > 
> > This particular NSCD is a complete rewrite of the GNU glibc nscd which
> > is a single threaded server process which offloads all NSS lookups to
> > worker children; cache hits are handled by the parent, and only cache
> > misses start worker children, making the parent immune to resource
> > leaks, hangs, and crashes in NSS libraries.
> > 
> > It should mostly be a drop-in replacement for existing installs using
> > nscd.
> 
>  This explanation is not really relevant for the commit log. Just keep the first
> sentence. All this text should be present in the package help text, however.
> 
>  It would be good however to explain in the commit log that glibc's nscd is not
> installed by buildroot at the moment, and why it only works with glibc.
> 

I'm not sure if unscd, by itself, only works with glibc. Associated
packages that benefit from unscd require glibc. My system is glibc
based so I know this works. I'm not sure about other c-libs.

What is your suggestion here?

Regards,
...doug
