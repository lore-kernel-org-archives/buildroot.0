From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 17 Mar 2015 12:08:16 -0300
Subject: [Buildroot] Blackfin Buildroot toolchain issue
In-Reply-To: <20150317153028.66788805@free-electrons.com>
References: <20150315221722.3645eb35@free-electrons.com>	<20150315221813.173a36e2@free-electrons.com>	<5508382D.7080008@zacarias.com.ar>
 <20150317153028.66788805@free-electrons.com>
Message-ID: <55084360.1070405@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

On 03/17/2015 11:30 AM, Thomas Petazzoni wrote:

> Dear Gustavo Zacarias,
> 
> On Tue, 17 Mar 2015 11:20:29 -0300, Gustavo Zacarias wrote:
> 
>> This seems to be a problem with the internal toolchain since we don't
>> enable tls for gcc, whereas ADIs toolchain does.
> 
> I think we should make the TLS option a blind option, and have it
> unconditionally enabled, except if the architecture doesn't support it.

There's this as well:
https://bugs.busybox.net/show_bug.cgi?id=7921
Which basically boils down to uclibc NPTL requiring TLS.
I'll check for space savings to see if it makes sense for it to even be
an option.
Regards.
