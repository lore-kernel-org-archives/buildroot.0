From: Pedro Sanchez <psanchez@fosstel.com>
Date: Thu, 11 Aug 2011 14:23:33 -0400
Subject: [Buildroot] Python standard library problems
In-Reply-To: <4E43F72C.4060005@in-2-technology.co.uk>
References: <4E42D99C.7080806@fosstel.com>
 <4E42FCAB.2070609@in-2-technology.co.uk> <4E43D5B4.2090106@fosstel.com>
 <4E43F72C.4060005@in-2-technology.co.uk>
Message-ID: <4E441E25.4010600@fosstel.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Well, I'm not trying to build specific Python modules. I'm just 
selecting the Python interpreter from BR's config menu, that's all. I 
was expecting to get a full interpreter with support for the Python 
standard library.

I'm trying to build BR now using the crosstool-ng toolchain ... If I run 
into similar problems then I'll see how to hook up into setup.py's 
output to see what's going on.

-- 
Pedro


On 08/11/2011 11:37 AM, Dominic Newton wrote:
> Hi
>
> Yes I'm using the native toolchain. One thing to check might be any
> dependencies the modules you are trying to build - for example have you
> got appropriate libraries being built before python for networking which
> will get _socket built.
>
> The easiest way to look at the setup.py output is to redirect the stdout
> to a file and then inspect it, any messages regarding module builds will
> be there. If python cannot build a module it won't stop, but just sends
> some output to the console. It is possible to edit setup.py to output
> results direct to a log file, but this can take a while to sort out.
>
> Not sure if this is much help as this has (so far) always worked for me
> out of the box for a number of targets.
>
> Dominic Newton
> In 2 Technology Ltd.
> _______________________________________________
> buildroot mailing list
> buildroot at busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
