From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 10 Mar 2018 22:37:11 +0100
Subject: [Buildroot] [PATCH v3,1/1] libmpdclient: fix install
In-Reply-To: <87efkrbpbp.fsf@dell.be.48ers.dk>
References: <20180310094608.19499-1-fontaine.fabrice@gmail.com>
 <87ina3bpi3.fsf@dell.be.48ers.dk> <87efkrbpbp.fsf@dell.be.48ers.dk>
Message-ID: <CAPi7W83-Sv6Sb4oWnQzTVM8U3XVnF1t8zL3pUTptda0=mwcgWA@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Dear Peter,

2018-03-10 22:20 GMT+01:00 Peter Korsgaard <peter@korsgaard.com>:

> >>>>> "Peter" == Peter Korsgaard <peter@korsgaard.com> writes:
>
> Hi,
>
>  > It would be a lot nicer to fix the problem. I have no experience with
>  > mesonbuild, but grepping around the problem seems to come from
>
>  > is_debianlike() in mesonbuild/mesonlib.py, which looks for
>  > /etc/debian_version on the host(!) so this behaviour depends on the host
>  > OS. changing this to just a 'return False' fixes it for me.
>
>  > There's other problems though. If it isn't a debianlike system, then it
>  > looks if /usr/lib64 on the host(!) is a directory, and if so uses that
>  > instead of usr/lib :/
>
>  > Similary, get_library_dirs() has login to look at uname -m and again
>  > look in /usr/lib64 on the host, which breaks horrible for cross
>  > compilation :/
>
>  > I guess we need to patch out all of this crap until upstream gains real
>  > cross compilation support :/
>
>  > Any takers?
>
> Sorry, after looking closer it seems most of these are just about the
> default location, so we can override then with the right values by
> passing the needed arguments to meson (--libdir).
>
> You're perfectly right, I will send you an update of the patch.

> --
> Bye, Peter Korsgaard
>
Best Regards,

Fabrice
-------------- next part --------------
An HTML attachment was scrubbed...
URL: <http://lists.busybox.net/pipermail/buildroot/attachments/20180310/5cb381fc/attachment.html>
