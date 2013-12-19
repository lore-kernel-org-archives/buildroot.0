From: Ryan Barnett <rjbarnet@rockwellcollins.com>
Date: Thu, 19 Dec 2013 02:36:52 -0600
Subject: [Buildroot] [autobuild.buildroot.net] Build results
	for	2013-12-17
In-Reply-To: <87ob4eo3j7.fsf@dell.be.48ers.dk>
References: <20131218073008.6219E100A64@stock.ovh.net>
 <20131218104812.62edfd68@skate> <87ob4eo3j7.fsf@dell.be.48ers.dk>
Message-ID: <OF53519EFF.5AF86C73-ON86257C46.002EE51E-86257C46.002F4CC8@rockwellcollins.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter Korsgaard <jacmet@uclibc.org> wrote on 12/18/2013 04:29:48 AM:

> >>>>> "Thomas" == Thomas Petazzoni <thomas.petazzoni@free-electrons.com> 
writes:
> 
>  > Hello,
>  > On Wed, 18 Dec 2013 08:30:08 +0100 (CET), Thomas Petazzoni wrote:
> 
>  >> python-pycrypto-2.6 | 8 
>  >> python-pyasn-1.2 | 6 
> 
>  > I have worked on those issues. They are caused by incorrect header 
and
>  > library paths being passed. The pycrypto header problem is quite 
easy,
>  > the library path is a little bit trickier, but I'm working on it. I
>  > will be posting patches as soon as possible.
> 
> The other pycrypto issue (that legal-info fails) is that the one of the
> license files is called LICENSE.orig and apply-patches.sh currently
> deletes all *.orig files :/

One idea I have in regards to this (until apply-patches.sh is fixed) is to 
copy LICENSE.orig to LICENSE.orig.save as a pre-patch hook and then copy 
it back to LICENSE.orig as a post-patch hook. I know it is not pretty and 
is very hackish but it could stop those autobuilder failures. 

Let me know what you think and I'll submit a patch if this is something 
you would be willing to accept.

Thanks,
-Ryan

[...]
