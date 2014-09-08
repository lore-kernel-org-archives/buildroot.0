From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 08 Sep 2014 12:32:29 -0300
Subject: [Buildroot] patching issue
In-Reply-To: <CAK9TtU22PKEbOF2KPRnps=oT+jt=b3rCh1zkCbqDO9rrAHyV-w@mail.gmail.com>
References: <CAK9TtU22PKEbOF2KPRnps=oT+jt=b3rCh1zkCbqDO9rrAHyV-w@mail.gmail.com>
Message-ID: <540DCC0D.5080003@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 09/08/2014 11:34 AM, Sylvain LG wrote:

> Hello,
> 
> I've just launched a compilation from latest buildroot sources.
> 
> Here comes an issue:
> 
>     Applying busybox-0005-busybox-1.22.1-nc.patch using patch: 
>     patching file networking/nc_bloaty.c
>     make: *** No rule to make target
>     `package/busybox/busybox-1.22.x.config', needed by
>     `/home/username/buildroot/output/build/busybox-1.22.1/.config'.  Stop.
> 
> 
> What can I do?

Hi.
It's not a patching issue, it's a config issue.
The name of the default busybox config changed to
package/busybox/busybox.config (without the trailing version) when
multiple version support was dropped, so you need to adjust that.
Regards.
