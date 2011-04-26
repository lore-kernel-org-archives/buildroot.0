From: David Anders <dave123_aml@yahoo.com>
Date: Tue, 26 Apr 2011 06:24:52 -0700 (PDT)
Subject: [Buildroot] devmem2
In-Reply-To: <871v0p7ewm.fsf@macbook.be.48ers.dk>
Message-ID: <941721.92187.qm@web161408.mail.bf1.yahoo.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Peter,

the primary commit that makes the devmem applet unusable for most debugging is this one:

commit 043246560fcd5bb7bfb2caa2db270c3c0e8e06f4
Author: Denis Vlasenko <vda.linux@googlemail.com>
Date:   Sun Oct 26 17:26:55 2008 +0000

    devmem: make it more script-friendly; don't do any reads
     and output nothing if writing was requested. -100 bytes


for board bring up and general development, for which devmem is primarily used, having devmem report the value before the write is important, as well as reporting the value after the write.

Dave



--- On Tue, 4/26/11, Peter Korsgaard <jacmet@uclibc.org> wrote:

> From: Peter Korsgaard <jacmet@uclibc.org>
> Subject: Re: devmem2
> To: "David Anders" <dave123_aml@yahoo.com>
> Cc: "Xianghua Xiao" <xiaoxianghua@gmail.com>, "Bj?rn Forsman" <bjorn.forsman@gmail.com>, buildroot at busybox.net
> Date: Tuesday, April 26, 2011, 12:36 AM
> >>>>> "David" == David
> Anders <dave123_aml@yahoo.com>
> writes:
> 
>  David> devmem in busybox is worthless.
> 
>  David> it has been "modified" so many times to adhere
> to the busybox
>  David> standard that it is not longer a useful item.
> 
> What do you mean about that? Devmem2 is a very simple
> program, and the
> devmem applet seems to work exactly the same the times I've
> used it
> (except for the access-to-highest-page-issue that got fixed
> back in
> 1.16.x).
> 
> -- 
> Bye, Peter Korsgaard
> 
