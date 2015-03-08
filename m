From: =?UTF-8?B?QW5kcsOpIEhlbnRzY2hlbA==?= <nerv@dawncrow.de>
Date: Sun, 08 Mar 2015 18:52:04 +0100
Subject: [Buildroot] [PATCH v3 2/2] wine: Add gettext dependency check
 for host-wine
In-Reply-To: <20150308183122.308f9227@free-electrons.com>
References: <54FC5B41.5050004@dawncrow.de>	<20150308155730.11c74ecc@free-electrons.com>	<54FC67E8.7010004@dawncrow.de>
 <20150308183122.308f9227@free-electrons.com>
Message-ID: <54FC8C44.2050907@dawncrow.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Am 08.03.2015 um 18:31 schrieb Thomas Petazzoni:
> Dear Andr? Hentschel,
> 
> On Sun, 08 Mar 2015 16:16:56 +0100, Andr? Hentschel wrote:
> 
>> Wine is built using host-wine, so i need gettext support in host-wines wrt.
> 
> In which cases do you need gettext support in host-wine?
> 
> Always ? Only when the target wine is going to be built with gettext
> support (which your patch does not do) ?

When host-gettext is built, then we could use it, otherwise target wine will be english only.
I don't think this diserves a hard dependency, do you?

> Why in the first place would we want to have gettext support in
> host-wine ?

Wine has a tool called wrc which transforms dialogs/strings and such into a windows like resource file.
With the help of the gettext library wrc merges the translations from wines po-files into that resource file.
As the wrc tool from host-wine is used, we need the gettext support there.
Further there are no runtime requirements, so in fact it doesn't matter to wine(or even host-wine) if the target
gettext is built.
Note: host-gettext and target gettext are two different things:

# For the target version, we only need the runtime, and for the host
# version, we only need the tools.
GETTEXT_SUBDIR = gettext-runtime
HOST_GETTEXT_SUBDIR = gettext-tools
